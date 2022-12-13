//
//  ContentView.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/12.
//

import SwiftUI


//MARK: - 어떤 회고조인지 선택하는 뷰
struct ContentView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var rollingStore = RollingStore()
    @State private var presentAlert = false
    @State private var teamTextField = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(rollingStore.rollings,id: \.self) { item in
                    NavigationLink {
                        CreateMessage(dismiss: _dismiss, rollingStore: rollingStore, userID: item.id)
                    } label: {
                        Text("\(item.id)")
                    }
                }
            }
            .navigationTitle("롤링페이퍼")
            .onAppear {
                    rollingStore.fetchPostitsTEST()
                }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("add") {
                        presentAlert = true
                    }
                    .alert("추가하기", isPresented: $presentAlert, actions: {
                        TextField("",text: $teamTextField)
                        
                        Button("취소",role: .cancel,action: {})
                        Button("추가", action: {
                            let createRolling: Rolling = Rolling(id: teamTextField, message: teamTextField)
                            rollingStore.addTeam(rolling: createRolling)})
                    }, message: {
                        Text("추가 할 이름을 적어주세요")
                    })


                }
            }
        }
    }
}

//MARK: - 이따 파일빼기
struct CreateMessage: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var rollingStore: RollingStore
    @State var message: String = ""
    @State var userID: String
    var body: some View {
        VStack {
            TextEditor(text: $message)
                .frame(width: 300,height: 500)
            Button {
                //완료버튼 눌렀을 때
                let createRolling: Rolling = Rolling(id: UUID().uuidString, message: message)
                rollingStore.addPostit(userID: userID, createRolling)
                dismiss()
                print("tapped")
            } label: {
                Text("작성완료")
            }
            Spacer()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
