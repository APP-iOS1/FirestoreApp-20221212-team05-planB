//
//  ContentView.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/12.
//

import SwiftUI


//MARK: - 어떤 회고조인지 선택하는 뷰
struct ContentView: View {
//    @Environment(\.presentationMode) var dismiss
    
    @State private var testArray: [String] = ["1","2","3","4","5"]
    @State private var testMember: [String] = ["김영서","김태형","김민호"]
    @State private var message: String = ""
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(testArray,id: \.self) { item in
                    NavigationLink {
                        //해당 리스트를 클릭하면 회고 조원들 보여주기
                        viewMember()
                    } label: {
                        Text("\(item)")
                    }

                    
                }
            }.navigationTitle("롤링페이퍼")
        }
    }
 
    func viewMember() -> some View {
        List {
            ForEach(testMember,id: \.self) { item in
                NavigationLink {
                    //해당 리스트를 클릭하면 회고 조원들 보여주기
                    CreateMessage()
                } label: {
                    Text("\(item)")
                }

                
            }
        }.navigationTitle("클릭해서 롤링페이퍼 남기러가기")
    }
}

//MARK: - 이따 파일빼기
struct CreateMessage: View {
    @Environment(\.dismiss) private var dismiss
    @State private var message: String = ""
    var body: some View {
        VStack {
            TextEditor(text: $message)
                .frame(width: 300,height: 700)
            Button {
                dismiss()
            } label: {
                Text("작성완료")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
