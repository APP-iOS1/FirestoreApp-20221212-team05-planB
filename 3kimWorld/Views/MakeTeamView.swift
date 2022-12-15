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
        }
        .scrollContentBackground(.hidden)
        .background(Color(hue: 0.102, saturation: 0.224, brightness: 0.918))
        //List
        
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

