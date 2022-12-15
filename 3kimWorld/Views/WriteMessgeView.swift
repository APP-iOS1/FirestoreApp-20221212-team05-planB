//
//  MemberViewBody.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/14.
//

import SwiftUI

struct WriteMessageView: View {
    @EnvironmentObject var rollingStore: RollingStore
    @State var message: String = "롤링페이퍼를 작성해주세요"
    var placeholderString: String = "롤링페이퍼를 작성해주세요"
    var item: Member
    var team: Team
    var body: some View {
        ZStack {
            Color(hue: 0.102, saturation: 0.224, brightness: 0.918)
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                //롤링페이퍼에 메시지 작성하는 TextEditor
                TextEditor(text: $message)
                    .font(.custom("UhBee mysen", size: 25))
                    .scrollContentBackground(.hidden)
                    .background(Color(hue: 0.102, saturation: 0.224, brightness: 0.918))
                    .frame(width: 300,height: 300)
                    .foregroundColor(self.message == placeholderString ? .gray : .primary)
                    .onTapGesture {
                        if self.message == placeholderString {
                            self.message = ""
                        }
                    }
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.secondary.opacity(0.5) ,lineWidth: 2))
                //                .foregroundColor(.secondary.opacity(0.5))
                
                Spacer()
                HStack{
                    Button {
                        //완료버튼 눌렀을 때
                        let createMessage: Message = Message(id: UUID().uuidString, message: message)
                        rollingStore.addMessage(member: item, team: team, message: createMessage)
                        message = ""
                        print("tapped")
                    } label: {
                        Text("작성완료")
                            .frame(width: 185, height: 50)
                            .background(.yellow)
                            .cornerRadius(10)
                    }
                    
                    //롤링페이퍼 버튼을 누르면 그 동안 작성한 롤링페이퍼뷰로 이동
                    NavigationLink(destination: RollingPaperView(team: team, member: item), label: {Text("롤링페이퍼").frame(width: 185, height: 50)
                            .background(.yellow)
                            .cornerRadius(10)
                    })
                    Spacer()
                }.foregroundColor(.black)
                    .padding(.leading, 10)
                Spacer()
                //            .formStyle(.columns)
            }
        }
    }
}

//struct MemberViewBody_Previews: PreviewProvider {
//    static var previews: some View {
//        MemberViewBody(item:item,team:team)
//    }
//}
