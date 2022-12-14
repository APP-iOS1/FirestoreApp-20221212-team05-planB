//
//  PostitStore.swift
//  HelloDemo
//
//  Created by Jongwook Park on 2022/12/08.
//

import Foundation
import FirebaseFirestore

class RollingStore: ObservableObject {
    @Published var rollings: [Rolling] = []
    @Published var rollingPapers: [String] = []
    //팀 배열
    @Published var papers: [Paper] = []
    
    let database = Firestore.firestore()
    
    init() {
        rollings = []
    }


    func fetchPostitsTEST() {
        database
            .collection("rollingpaper3")
            .document("Team5")
            .collection("articles")
            .getDocuments { (snapshot, error) in
                self.rollings.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        //                        print(document.documentID)
                        let id: String = document.documentID
                        
                        let docData = document.data()
                        let message: String = docData["message"] as? String ?? ""
                        let rolling: Rolling = Rolling(id: id, message: message)
                        
                        self.rollings.append(rolling)
                    }
                    print(self.rollings)
                }
            }
    }
    
    
    func addPostit(userID: String,_ rolling: Rolling) {
        database
            .collection("rollingpaper3") //
            .document("Team5")
            .collection("articles") // 게시물(사람)
            .document(userID) // articles.id
            .collection("replies")  // 댓글(롤링페이퍼)
            .document(rolling.id)
            .setData(["message": rolling.message])
        //        fetchPostitsTEST(userID: userID)
    }
    
    func addTeam(rolling: Rolling) {
        database
            .collection("rollingpaper3") //
            .document("Team5")
            .collection("articles") // 게시물(사람)
            .document(rolling.id) // articles.id
            .setData(["message": rolling.message])
        fetchPostitsTEST()
    }
    
    func addTeams(paper: Paper) {
        database
            .collection("rollingpaper3") //
            .document(paper.id)
            .setData(["message": "데헷"])
        fetchTeam()
    }
    
    
    func findRollingPaper(user: String) {
        database
            .collection("rollingpaper3")
            .document("Team5")
            .collection("articles")
            .document(user)
            .collection("replies")
            .getDocuments { (snapshot, error) in
                self.rollingPapers.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        print(document.documentID)
                        let id: String = document.documentID
                        let docData = document.data()
                        let message: String = docData["message"] as? String ?? ""
                        let rolling: Rolling = Rolling(id: id, message: message)
                        
                        self.rollingPapers.append(rolling.message)
                    }
                    print(self.rollingPapers)
                }
            }
    }
    
    func fetchTeam() {
        database
            .collection("rollingpaper3")
            .getDocuments { (snapshot, error) in
                self.papers.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        //                        print(document.documentID)
                        let id: String = document.documentID
                        let paper: Paper = Paper(id: id)
                        self.papers.append(paper)
                    }
                    print(self.papers)
                }
            }
    }

}


