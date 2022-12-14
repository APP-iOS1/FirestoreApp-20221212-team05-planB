//
//  MakeTeamToolbar.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/14.
//

import Foundation
import SwiftUI

struct MakeTeamToolbar: ToolbarContent {
    @EnvironmentObject var rollingStore: RollingStore
    @State private var presentAlert = false
    @State private var teamTextField = ""
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button("add") {
                presentAlert = true
            }
            .alert("추가하기", isPresented: $presentAlert, actions: {
                TextField("",text: $teamTextField)
                
                Button("취소",role: .cancel,action: {
                })
                Button("추가", action: {
                    let createTeam = Team(id: UUID().uuidString, team: teamTextField)
                    rollingStore.addTeam(team: createTeam)
                })
            }, message: {
                Text("추가 할 이름을 적어주세요")
            })
        }
    }

}
