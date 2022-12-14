//
//  ContentView.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/12.
//

import SwiftUI


//MARK: - 어떤 회고조인지 선택하는 뷰
struct ContentView: View {
    @StateObject var rollingStore: RollingStore = RollingStore()
    var body: some View {
        VStack {
            MakeTeamView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
