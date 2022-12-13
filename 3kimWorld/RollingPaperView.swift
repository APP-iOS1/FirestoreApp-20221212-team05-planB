//
//  RollingPaperView.swift
//  3kimWorld
//
//  Created by youngseo on 2022/12/13.
//

import SwiftUI

struct RollingPaperView: View {
 
    let columns = [GridItem(.adaptive(minimum: 100))]
    
    @State var repliesArray: [String] = ["메세지1", "메세지2", "메세지3", "메세지4", "메세지5", "메세지6", "메세지7", "메세지8"]
    

    var body: some View {
        
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(Array(repliesArray.enumerated()), id: \.offset){ index, replies in
                
                    VStack {
                        Text(replies)
                }
                
            }
        }
    }
}

struct RollingPaperView_Previews: PreviewProvider {
    static var previews: some View {
        RollingPaperView()
    }
}
