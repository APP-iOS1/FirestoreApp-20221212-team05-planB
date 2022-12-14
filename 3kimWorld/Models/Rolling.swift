//
//  Rolling.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/13.
//

import Foundation
import SwiftUI

struct Member: Identifiable, Hashable {
    var id: String
    var name: String
    var colorIndex: Int
    var color: (Color, String) {
        switch colorIndex {
        case 0:
            return (.yellow, "yellow")
        case 1:
            return (.blue, "blue")
        case 2:
            return (.white, "white")
        case 3:
            return (.black, "black")
        case 4:
            return (.green, "green")
        case 5:
            return (.brown, "brown")
        case 6:
            return (.red, "red")
        case 7:
            return (.purple, "purple")
        default:
            return (.yellow, "yellow")
        }
    }
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
