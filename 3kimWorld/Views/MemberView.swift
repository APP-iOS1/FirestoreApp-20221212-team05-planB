
import SwiftUI


//MARK: - 어떤 회고조인지 선택하는 뷰
struct MemberView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var rollingStore = RollingStore()
    @State private var presentAlert = false
    @State private var teamTextField = ""
    @State var message: String = ""
    var paper: Paper
    var body: some View {
        NavigationStack {
            List {
                ForEach(rollingStore.rollings,id: \.self) { item in
                    NavigationLink {
                        VStack {
                            TextEditor(text: $message)
                                .frame(width: 300,height: 500)
                            Button {
                                //완료버튼 눌렀을 때
                                let createRolling: Rolling = Rolling(id: UUID().uuidString, message: message)
                                rollingStore.addPostit(userID: item.id, createRolling, paper: paper)
                                dismiss()
                                print("tapped")
                            } label: {
                                Text("작성완료")
                            }
                            NavigationLink(destination: RollingPaperView(userID: item.id, paper: paper), label: {Text("롤링페이퍼")})
                            Spacer()
                            
                        }
                        //                        CreateMessage(dismiss: _dismiss, rollingStore: rollingStore, userID: item.id)
                    } label: {
                        Text("\(item.id)")
                    }
                }
            }
            .navigationTitle("롤링페이퍼")
            .onAppear {
                rollingStore.fetchPostitsTEST(paper: paper)
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
                            let createRolling: Rolling = Rolling(id: teamTextField, message: teamTextField)
                            rollingStore.addTeam(rolling: createRolling, paper: paper)
                        })
                    }, message: {
                        Text("추가 할 이름을 적어주세요")
                    })
                    
                    
                }
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
//                rollingStore.addPostit(userID: userID, createRolling)
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

struct MemberView_Previews: PreviewProvider {
    static var previews: some View {
        MemberView(paper: RollingStore().papers[0])
    }
}
