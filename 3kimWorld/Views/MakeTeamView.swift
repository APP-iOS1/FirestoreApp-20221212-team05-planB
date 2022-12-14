//
//  ContentView.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/12.
//

import SwiftUI


//MARK: - 팀선택뷰 그리고 팀 추가뷰
struct MakeTeamView: View {
    @EnvironmentObject var rollingStore: RollingStore
    
    var body: some View {
        List(rollingStore.teams) {item in
            NavigationLink(item.team) { MemberView(team: item) }
        }//List
        
        .navigationTitle("팀 선택")
        .onAppear { rollingStore.fetchTeam() }
        .toolbar { MakeTeamToolbar() }
    }//body
    
}//struct MakeTeamView

struct MakeTeamView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            MakeTeamView()
                .environmentObject(RollingStore())
        }
    }
}
