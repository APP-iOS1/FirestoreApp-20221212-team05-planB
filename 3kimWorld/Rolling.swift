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
