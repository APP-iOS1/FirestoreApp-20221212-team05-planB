//
//  MemberListView.swift
//  3kimWorld
//
//  Created by TAEHYOUNG KIM on 2022/12/14.
//

import SwiftUI

//
//  RollingPaperView.swift
//  3kimWorld
//
//  Created by youngseo on 2022/12/13.
//

import SwiftUI

struct MemberListView: View {
    
    @EnvironmentObject var rollingStore: RollingStore
    var team: Team
    //    var member: Member
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    @State var repliesArray: [String] = ["메세지1", "메세지2", "메세지3", "메세지4", "메세지5", "메세지6", "메세지7", "메세지8"]
    
    
    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(rollingStore.members) { member in
                
                VStack {
                    Image("yellow")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(member.name)
                                        }
            }
        }
        .padding()
        .onAppear {
            rollingStore.fetchMember(team: team)
            
        }
    }
}

//struct RollingPaperView_Previews: PreviewProvider {
//    static var previews: some View {
//        RollingPaperView()
//    }
//}

//
//struct MemberListView_Previews: PreviewProvider {
//    static var rollingStore: RollingStore = RollingStore()
//    static var previews: some View {
//        MemberListView(team: rollingStore.teams[0], member: rollingStore.members[0])
////            .environmentObject(RollingStore())
//    }
//}
