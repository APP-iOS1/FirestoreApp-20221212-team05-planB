//
//  AddMemberSheetView.swift
//  3kimWorld
//
//  Created by TAEHYOUNG KIM on 2022/12/14.
//

import SwiftUI

struct AddMemberSheetView: View {
    var colors: [Color] = [.yellow, .blue, .white, .black, .green, .brown, .red, .purple]
    @State var colorIndex: Int = 0
    @State private var presentAlert = false
    @State private var teamTextField = ""
    @Binding var isShowingSheet: Bool
    var team: Team
    var rollingStore: RollingStore
    
    var body: some View {
        Form {
            Section(header: Text("편지지 색깔을 골라주세요")) {
                VStack {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(Array(colors.enumerated()), id: \.offset) { idx, color in
                                if color == .white {
                                    Button {
                                        colorIndex = idx
                                        
                                    } label: {
                                        Rectangle()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(color)
                                            .overlay(Rectangle().strokeBorder())
                                    }
                                } else {
                                    Button {
                                        colorIndex = idx
                                        
                                    } label: {
                                        Rectangle()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(color)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Section(header: Text("회고 조원 추가")) {
                TextField(text: $teamTextField) {
                    Text("이름을 입력하세요")
                }
            }
                                            
                Button {
                    let createMember: Member = Member(id: UUID().uuidString, name: teamTextField, colorIndex: colorIndex)
                    rollingStore.addMember(member: createMember, team: team)
                    isShowingSheet.toggle()
                } label: {
                    Text("추가")
                }
                
                
            
        }
    }
}
