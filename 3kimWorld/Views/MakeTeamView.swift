//
//  ContentView.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/12.
//

import SwiftUI


//MARK: - 어떤 회고조인지 선택하는 뷰
struct MakeTeamView: View {
//    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var rollingStore: RollingStore
    @State private var presentAlert = false
    @State private var teamTextField = ""
    @State var message: String = ""
    var body: some View {
            List {
                ForEach(rollingStore.teams,id: \.self) { item in
                    NavigationLink {
                        MemberView(team: item)
                    } label: {
                        Text("\(item.team)")
                    }
                }
            }
            .navigationTitle("팀추가")
            .onAppear {
                rollingStore.fetchTeam()
            }
            .toolbar {
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
}

struct MakeTeamView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            
            MakeTeamView()
                .environmentObject(RollingStore())
        }
    }
}
