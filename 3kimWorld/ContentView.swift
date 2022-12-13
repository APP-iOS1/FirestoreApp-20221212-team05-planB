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
    @State private var testArray: [String] = ["1","2","3","4","5"]
    @State private var testMember: [String] = ["김영서","김태형","김민호"]
    @State private var message: String = ""
    
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
        }
    }
 
//    func viewMember() -> some View {
//        List {
//            ForEach(testMember,id: \.self) { item in
//                NavigationLink {
//                    //해당 리스트를 클릭하면 회고 조원들 보여주기
//                    CreateMessage(rollingStore: rollingStore)
//                } label: {
//                    Text("\(item)")
//                }
//
//
//            }
//        }.navigationTitle("클릭해서 롤링페이퍼 남기러가기")
//    }
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
