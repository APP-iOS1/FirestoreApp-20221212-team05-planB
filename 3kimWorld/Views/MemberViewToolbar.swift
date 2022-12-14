//
//  MemberViewToolbar.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/14.
//

import SwiftUI

struct MemberViewToolbar: ToolbarContent {
    @EnvironmentObject var rollingStore: RollingStore
    @State private var presentAlert = false
    @State private var teamTextField = ""
    @State var message: String = ""
    var team: Team
    
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
                    let createMember: Member = Member(id: UUID().uuidString, name: teamTextField)
                    rollingStore.addMember(member: createMember, team: team)
                })
            }, message: {
                Text("추가 할 이름을 적어주세요")
            })
        }
    }
}

struct MemberViewToolbar_Previews: PreviewProvider {
    static var previews: some View {
        MemberViewToolbar()
    }
}
