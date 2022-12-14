
import SwiftUI


//MARK: - 어떤 회고조인지 선택하는 뷰
struct MemberView: View {
//    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var rollingStore: RollingStore
    @State private var presentAlert = false
    @State private var teamTextField = ""
    @State var message: String = ""
    var team: Team
    var body: some View {
            List {
                ForEach(rollingStore.members,id: \.self) { item in
                    NavigationLink {
                        VStack {
                            TextEditor(text: $message)
                                .frame(width: 300,height: 500)
                            Button {
                                //완료버튼 눌렀을 때
                                let createMessage: Message = Message(id: UUID().uuidString, message: message)
                                rollingStore.addMessage(member: item, team: team, message: createMessage)
//                                dismiss()
                                print("tapped")
                            } label: {
                                Text("작성완료")
                            }
                            NavigationLink(destination: RollingPaperView(team: team, member: item), label: {Text("롤링페이퍼")})
                            Spacer()

                        }
                        //                        CreateMessage(dismiss: _dismiss, rollingStore: rollingStore, userID: item.id)
                    } label: {
                        Text("\(item.name)")
                    }
                }
            }
            .navigationTitle("롤링페이퍼")
            .onAppear {
                rollingStore.fetchMember(team: team)
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
                            let createMember: Member = Member(id: UUID().uuidString, name: teamTextField)
                            rollingStore.addMember(member: createMember, team: team)
                        })
                    }, message: {
                        Text("추가 할 이름을 적어주세요")
                    })
                    
                    
                }
            }
        
    }
}

//MARK: - 이따 파일빼기
//struct CreateMessage: View {
//    @Environment(\.dismiss) var dismiss
//    @StateObject var rollingStore: RollingStore
//    @State var message: String = ""
//    @State var userID: String
//    var body: some View {
//        VStack {
//            TextEditor(text: $message)
//                .frame(width: 300,height: 500)
//            Button {
//                //완료버튼 눌렀을 때
//                let createRolling: Rolling = Rolling(id: UUID().uuidString, message: message)
//                rollingStore.addMessage(userID: userID, createRolling)
//                dismiss()
//                print("tapped")
//            } label: {
//                Text("작성완료")
//            }
//            NavigationLink(destination: RollingPaperView(), label: {Text("롤링페이퍼")})
//            Spacer()
//
//        }
//    }
//}

//struct MemberView_Previews: PreviewProvider {
//    static var previews: some View {
//        MemberView(paper: RollingStore().papers[0])
//    }
//}
