
import SwiftUI



//MARK: - 어떤 회고조인지 선택하는 뷰
struct MemberView: View {
    //    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var rollingStore: RollingStore
    @State private var isShowingSheet = false
    @State var message: String = ""
    var team: Team
    let columns = [GridItem(.adaptive(minimum: 100))]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(rollingStore.members,id: \.self) { item in
                NavigationLink {
                    VStack {
                        TextEditor(text: $message)
                            .frame(width: 300,height: 500)
                        HStack{
                            Button {
                                //완료버튼 눌렀을 때
                                let createMessage: Message = Message(id: UUID().uuidString, message: message)
                                rollingStore.addMessage(member: item, team: team, message: createMessage)
                                //                                dismiss()
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
                    //                        CreateMessage(dismiss: _dismiss, rollingStore: rollingStore, userID: item.id)
                } label: {
                    VStack {
                        Image(item.color.1)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("\(item.name)")
                            .font(.custom("UhBee mysen", size: 25))
                            .foregroundColor(.black)
                            .lineSpacing(5)
                        
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingSheet, content: {
            AddMemberSheetView(isShowingSheet: $isShowingSheet, team: team, rollingStore: rollingStore)
        })
        
        .navigationTitle("롤링페이퍼")
        .onAppear {
            rollingStore.fetchMember(team: team)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isShowingSheet.toggle()
                } label: {
                    Text("add")

                }

            }
            
        }
        
    }
}
struct AddMemberSheetView: View {
    var colors: [Color] = [.yellow, .blue, .white, .black, .green, .brown, .red, .purple]
    @State var colorIndex: Int = 0
    @State private var presentAlert = false
    @State private var teamTextField = ""
    @Binding var isShowingSheet: Bool
    var team: Team
    var rollingStore: RollingStore
    
    var body: some View {
        List(rollingStore.members) {item in
            NavigationLink(item.name) { MemberViewBody(item: item, team: team) }
        }//List
        
        .navigationTitle("롤링페이퍼")
        .onAppear { rollingStore.fetchMember(team: team) }
        .toolbar { MemberViewToolbar(team:team) }
        
    }//body
    
}//struct MemberView


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
