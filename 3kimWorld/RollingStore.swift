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
    
    func createRestaurant(restaurantName: String, rolling: Rolling) {
        let db = Firestore.firestore()
        let docRef = db.collection("rollingpaper3").document("Team5").collection("articles").document(rolling.id)
        
        docRef.setData(["name": restaurantName]) { error in
            if let error = error {
                print("Error writing document: \(error)")
            } else {
                print("Document successfully written!")
            }
        }
    }
}


