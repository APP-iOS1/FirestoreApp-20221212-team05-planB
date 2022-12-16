//
//  GridTest.swift
//  3kimWorld
//
//  Created by kimminho on 2022/12/16.
//

import SwiftUI

struct GridTest: View {
    let columns: [GridItem] = Array(repeating: .init(.flexible()),count:3)
    var GaArray: [String] = ["레이디","가가","동해물과백두산이마르고닳도록하느님이보우하사 우리나라만세","우가우가우가우가우가우가","아프리카","레이디","가가","벵비","우가우가","잭슨"]
    var body: some View {
        
        
        
        LazyVGrid(columns: columns) {
            ForEach(Array(GaArray.enumerated()),id: \.offset){ idx,value in
                
                //1분단
                if idx % 3 == 0 {
                    Text(value)
                        .rotationEffect(.degrees(Double.random(in:-25...0)))
                }
                //2분단
                else if idx % 3 == 1 {
                    Text(value)
                        .rotationEffect(.degrees(Double.random(in:-25...25)))
                }
                //3분단
                else {
                    Text(value)
                        .rotationEffect(.degrees(Double.random(in:0...25)))
                        .padding(20)
                        .frame(width:150, height:130)
                }

           }
        }.frame(width:300)
        
    }
}

struct GridTest_Previews: PreviewProvider {
    static var previews: some View {
        GridTest()
    }
}
