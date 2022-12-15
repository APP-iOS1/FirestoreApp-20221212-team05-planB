//
//  TeamListRowView.swift
//  3kimWorld
//
//  Created by TAEHYOUNG KIM on 2022/12/15.
//

import SwiftUI

struct TeamListRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Color(hue: 0.102, saturation: 0.224, brightness: 0.918)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    firstRectangle
                    firstRectangle
                    firstRectangle
                }
                
            }
        }
    }
    var firstRectangle: some View {
        VStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.5481430292, green: 0, blue: 0.4720868468, alpha: 1)), Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(height: 200)
                .overlay {
                    HStack {
                        VStack(alignment: .leading) {
                            Image(systemName: "star.fill")
                            Spacer()
                                .frame(height: 60)
                            Text("회고 5조")
                        }
                        Spacer()
                    }
                    .padding()
                }
                .cornerRadius(30)
            
        }
        
    }
}

struct TeamListRowView_Previews: PreviewProvider {
    static var previews: some View {
        TeamListRowView()
    }
}
