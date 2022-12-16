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
    let columns: [GridItem] = Array(repeating: .init(.flexible()),count:3)
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color(hue: 0.102, saturation: 0.224, brightness: 0.918)
                    .ignoresSafeArea()
                
                //작성된 롤링페이퍼를 각도를 바꿔서 그리드로 나열
                LazyVGrid(columns: columns) {
                    ForEach(Array(rollingStore.rollingPapers.enumerated()), id:\.offset){ idx,replies in
                        if idx % 3 == 0 {
                            Text(replies.message)
                                .rotationEffect(.degrees(Double.random(in:-25...0)))
                                .font(.custom("UhBee mysen", size: 20))
                                .frame(width:100, height:130)
                        }
                        //2분단
                        else if idx % 3 == 1 {
                            Text(replies.message)
                                .rotationEffect(.degrees(Double.random(in:-25...25)))
                                .font(.custom("UhBee mysen", size: 20))
                                .frame(width:100, height:130)
                        }
                        //3분단
                        else {
                            Text(replies.message)
                                .rotationEffect(.degrees(Double.random(in:0...25)))
                                .font(.custom("UhBee mysen", size: 20))
                                .frame(width:100, height:130)
                        }
                        
                    }
                }
//                .frame(width:300)
                
                .onAppear {
                    rollingStore.fetchMessage(member: member, team: team)
                }
                .background(
                    Image("paperImage")
                        .resizable()
                    //                    .edgesIgnoringSafeArea(.all)
                    //                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .frame(width: 390, height: 770)
                        .cornerRadius(30)
                )
            }
            .navigationTitle("\(member.name)의 롤링페이퍼")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

//struct RollingPaperView_Previews: PreviewProvider {
//    static var previews: some View {
//        RollingPaperView()
//    }
//}
