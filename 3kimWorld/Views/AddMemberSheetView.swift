//
//  AddMemberSheetView.swift
//  3kimWorld
//
//  Created by TAEHYOUNG KIM on 2022/12/14.
//

import SwiftUI

struct AddMemberSheetView: View {
    @State private var presentAlert = false
    @State private var teamTextField = ""
    @Binding var isShowingSheet: Bool
    @State var colorIndex: Int = 0
    @State var selecterColor: Color?
    var team: Team
    var rollingStore: RollingStore
    var colors: [Color] = [.yellow, .blue, .white, .black, .green, .brown, .red, .purple]
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                Section(header: Text("편지지 색깔을 골라주세요")) {
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(Array(colors.enumerated()), id: \.offset) { idx, color in
                                    
                                    Button {
                                        colorIndex = idx
                                        selecterColor = color
                                    } label: {
                                        Circle()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(color)
                                            .overlay(Circle().stroke(Color.black, lineWidth: selecterColor == color ? 3 : 0.8))
                                            .padding(5)
                                        
                                        
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
                
            }
            .scrollContentBackground(.hidden)
            .background(Color(hue: 0.102, saturation: 0.224, brightness: 0.918))
            .navigationTitle("Add new Post")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        isShowingSheet.toggle()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let createMember: Member = Member(id: UUID().uuidString, name: teamTextField, colorIndex: colorIndex)
                        rollingStore.addMember(member: createMember, team: team)
                        teamTextField = ""
                        isShowingSheet.toggle()
                    } label: {
                        Text("추가")
                    }
                }
            }
        }
    }
}
