//
//  MemberViewBody.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/14.
//

import SwiftUI

struct MemberViewBody: View {
    @EnvironmentObject var rollingStore: RollingStore
    @State var message: String = ""
    @State var item: Member
    @State var team: Team
    var body: some View {
        VStack {
            TextEditor(text: $message)
                .frame(width: 300,height: 500)
            HStack{
                Button {
                    //완료버튼 눌렀을 때
                    let createMessage: Message = Message(id: UUID().uuidString, message: message)
                    rollingStore.addMessage(member: item, team: team, message: createMessage)
                    print("tapped")
                } label: {
                    Text("작성완료")
                        .frame(width: 185, height: 50)
                        .background(.yellow)
                }
                NavigationLink(destination: RollingPaperView(team: team, member: item), label: {Text("롤링페이퍼").frame(width: 185, height: 50)
                    .background(.yellow)})
                Spacer()
            }.foregroundColor(.black)
                .padding(.leading, 10)
        }
    }
}

//struct MemberViewBody_Previews: PreviewProvider {
//    static var previews: some View {
//        MemberViewBody(item:item,team:team)
//    }
//}
