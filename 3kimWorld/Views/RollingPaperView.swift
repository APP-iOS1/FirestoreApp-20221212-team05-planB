//
//  RollingPaperView.swift
//  3kimWorld
//
//  Created by youngseo on 2022/12/13.
//

import SwiftUI

struct RollingPaperView: View {
    
    @EnvironmentObject var rollingStore: RollingStore
    var team: Team
    var member: Member
    let columns = [GridItem(.adaptive(minimum: 100))]
    @State var repliesArray: [String] = ["메세지1", "메세지2", "메세지3", "메세지4", "메세지5", "메세지6", "메세지7", "메세지8"]
    
    
    var body: some View {
        
            LazyVGrid(columns: columns, spacing: 30) {
                ForEach(Array(rollingStore.rollingPapers.enumerated()), id: \.offset){ index, replies in
                    
                        VStack {
                            Text(replies.message)
                                .rotationEffect(.degrees(Double.random(in:0...360)))
                                .font(.custom("UhBee mysen", size: 25))
//                                .lineSpacing(5)
                        }
                    Spacer()

                }
            }

        .onAppear {
            rollingStore.fetchMessage(member: member, team: team)
        }
        .background(
            Image("paperImage")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
}

//struct RollingPaperView_Previews: PreviewProvider {
//    static var previews: some View {
//        RollingPaperView()
//    }
//}
