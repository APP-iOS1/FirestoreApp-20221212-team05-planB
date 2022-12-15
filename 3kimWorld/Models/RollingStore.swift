//
//  PostitStore.swift
//  HelloDemo
//
//  Created by Jongwook Park on 2022/12/08.
//

import Foundation
import FirebaseFirestore

class RollingStore: ObservableObject {
    @Published var members: [Member] = []
    @Published var rollingPapers: [Message] = []
    @Published var teams: [Team] = []
    
    let database = Firestore.firestore()
    
    
    
    
    
    func fetchMember(team: Team) {
        database
            .collection("rollingpaper")
            .document(team.id)
            .collection("articles")
            .getDocuments { (snapshot, error) in
                self.members.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        //                        print(document.documentID)
                        let id: String = document.documentID
                        
                        let docData = document.data()
                        let name: String = docData["name"] as? String ?? ""
                        let colorIndex: Int = docData["colorIndex"] as? Int ?? 0
                        let member: Member = Member(id: id, name: name, colorIndex: colorIndex)
                        
                        self.members.append(member)
                    }
                    print(self.members)
                }
            }
    }
    
    func fetchTeam() {
        database
            .collection("rollingpaper")
            .order(by: "team", descending: false)
            .getDocuments { (snapshot, error) in
                self.teams.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        //                        print(document.documentID)
                        let id: String = document.documentID
                        let docData = document.data()
                        let teamNumber: String = docData["team"] as? String ?? ""
                        let team: Team = Team(id: id, team: teamNumber)
                        self.teams.append(team)
                    }
                    print(self.teams)
                }
            }
    }
    
    func fetchMessage(member: Member, team: Team) {
        database
            .collection("rollingpaper")
            .document(team.id)
            .collection("articles")
            .document(member.id)
            .collection("replies")
            .getDocuments { (snapshot, error) in
                self.rollingPapers.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        print(document.documentID)
                        let id: String = document.documentID
                        let docData = document.data()
                        let message: String = docData["message"] as? String ?? ""
                        let rolling: Message = Message(id: id, message: message)
                        
                        self.rollingPapers.append(rolling)
                    }
                    print(self.rollingPapers)
                }
            }
    }

    
    func addMessage(member: Member, team: Team, message: Message) {
        database
            .collection("rollingpaper") //
            .document(team.id)
            .collection("articles") // 게시물(사람)
            .document(member.id) // articles.id
            .collection("replies")  // 댓글(롤링페이퍼)
            .document(message.id)
            .setData(["message": message.message])
        //        fetchPostitsTEST(userID: userID)
    }
    

    func addMember(member: Member, team: Team) {
        database
            .collection("rollingpaper") //
            .document(team.id)
            .collection("articles") // 게시물(사람)
            .document(member.id) // articles.id
            .setData(["name": member.name,
                      "colorIndex" : member.colorIndex])
        fetchMember(team: team)
    }
    
    func addTeam(team: Team) {
        database
            .collection("rollingpaper") //
            .document(team.id)
            .setData(["team": team.team])
        fetchTeam()
    }
    
    
    
 
    
}


