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
        //회고 조 리스트
        Form {
            ForEach(rollingStore.teams) {item in
                //조를 클릭하면 -> 해당 조 멤버 리스트로 이동
                //            NavigationLink(item.team) { MemberView(team: item) }
                NavigationLink {
                    MemberView(team: item)
                } label: {
                    Text(item.team)
                        .font(.custom("UhBee mysen", size: 30))
                        .fontWeight(.bold)
                }
                
            }
        }
//        .listStyle(.inset)
        .scrollContentBackground(.hidden)
        .background(Color(hue: 0.102, saturation: 0.224, brightness: 0.918))
        .navigationTitle("RollingPaper")
        .onAppear { rollingStore.fetchTeam() }
        
        //toolbar 오른쪽의 add버튼을 누르면 조를 추가할 수 있는 alert
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

