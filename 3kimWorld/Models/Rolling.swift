//
//  Rolling.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/13.
//

import Foundation

struct Member: Identifiable, Hashable {
    var id: String
    var name: String
}

//MARK: -
struct Team: Identifiable, Hashable {
    var id: String
    var team: String
}

struct Message: Identifiable, Hashable {
    var id: String
    var message: String
}
