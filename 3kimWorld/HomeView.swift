//
//  HomeView.swift
//  3kimWorld
//
//  Created by youngseo on 2022/12/12.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Text("Name님의 미니홈피")
                        Text("URL~")
                    }
                    
                    HStack{
                        Rectangle()
                            .frame(width: 90, height:90)
                        VStack(alignment: .leading){
                            Text("Today Int | Int")
                            Text("Name")
                            Text("Name님의 미니홈피입니다.")
                        }
                    }
                    
                    HStack{
                        Text("Today is...")
                        
                        Spacer()
                        
                        Text("일촌")
                        Text("Int")
                        Text("즐겨찾기")
                        Text("Int")
                    }
                }
                
                Divider()
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Mini Room")
                        
                        Spacer()
                        
                        Text("기본 미니룸")

                    }
                    
                    Rectangle()
                        .frame(height: 200)
                }
                
                Divider()
                
                VStack{
                    Text("What Friends Say")
                }
            }.padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
