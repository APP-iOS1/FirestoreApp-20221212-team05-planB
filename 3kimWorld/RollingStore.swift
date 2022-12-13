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
        /*
        postits = [
            Postit(id: UUID().uuidString, user: "ned", memo: "Good morning", colorIndex: 0, createdAt: Date().timeIntervalSince1970),
            
            Postit(id: UUID().uuidString, user: "ned", memo: "Good evening", colorIndex: 1, createdAt: Date().timeIntervalSince1970),
            
            Postit(id: UUID().uuidString, user: "ned", memo: "Hello World", colorIndex: 2, createdAt: Date().timeIntervalSince1970),
            
            Postit(id: UUID().uuidString, user: "ned", memo: "Hello my friend", colorIndex: 3, createdAt: Date().timeIntervalSince1970)
        ]
         */
        rollings = []
    }
    
  
    func fetchPostits() {
        database.collection("rollingpaper")
            .getDocuments { (snapshot, error) in
                self.rollings.removeAll()
                
                if let snapshot {
                    for document in snapshot.documents {
                        let id: String = document.documentID
                        
                        let docData = document.data()
                        let message: String = docData["message"] as? String ?? ""
                        let rolling: Rolling = Rolling(id: id, message: message)
                        
                        self.rollings.append(rolling)
                    }
                }
            }
    }
    
//    func fetchPostitsTEST() {
//        database
//            .collection("rollingpaper")
//            .getDocuments { (snapshot, error) in
//                self.rollings.removeAll()
//
//                if let snapshot {
//                    for document in snapshot.documents {
//                        let id: String = document.documentID
//
//                        let docData = document.data()
//                        let message: String = docData["message"] as? String ?? ""
//                        let rolling: Rolling = Rolling(id: id, message: message)
//
//                        self.rollings.append(rolling)
//                    }
//                }
//            }
//    }
    
    
    
//    struct rollingpaper: Codable, Identifiable {
//        var id: String
//    }
//    struct articles: Codable, Identifiable {
//        var id: String
//    }
//    struct replies: Codable, Identifiable {
//        var id: String
//        var message: String
//    }
//
    func addPostit(_ rolling: Rolling) {
        database
            .collection("rollingpaper") //
            .document(rolling.id)
            .collection("articles") // 게시물(사람)
            .document(documentID)
            .collection("replies")  // 댓글(롤링페이퍼)
            .setData(["message": rolling.message])
        
        fetchPostits()
    }
    
//    func removePostit(_ rolling: Rolling) {
//        database.collection("rollingpaper")
//            .document(rolling.id).delete()
//        fetchPostits()
//    }
}
