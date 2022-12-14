//
//  Rolling.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/13.
//

import Foundation


struct Rolling: Identifiable, Hashable {
    var id: String
    var message: String
}

//MARK: -
struct Paper: Identifiable, Hashable {
    var id: String
}

struct Member: Identifiable, Hashable {
    var id: String //키값 김민호
    var replies: [String]
}

struct User: Identifiable, Hashable {
    //댓글의 키값
    var id: String
    //팀
    var paperID: String
    //멤버
    var memberID: String
    //롤링페이퍼
    var replies: [String]
}
