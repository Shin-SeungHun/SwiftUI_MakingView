//
//  ContentView.swift
//  MakingView
//
//  Created by 신승훈 on 2024/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
     HelloText()
        
    }
    
}

// 해당하는 view 내에서만 사용할떄
extension ContentView {
        private var helloText: some View{
            Text("안녕하세요")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                .padding([.vertical, .horizontal])
        }
    }

// 어디서든 재사용 해야할때
struct HelloText: View {
    var body: some View {
            Text("안녕하세요")
                .foregroundStyle(.white)
                .font(.largeTitle)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20.0))
                .padding([.vertical, .horizontal])
        }
    }

#Preview {
    ContentView()
}
