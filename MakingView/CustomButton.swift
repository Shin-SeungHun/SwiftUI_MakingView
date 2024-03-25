//
//  CustomButton.swift
//  MakingView
//
//  Created by 신승훈 on 2024/03/25.
//

import SwiftUI

struct CustomButton: View {
    let placeholder: String
    
    // 생성자
    init(placeholder: String) {
        self.placeholder = placeholder
    }
    
    var body: some View {
        Button(action: {
            print("버튼이 눌러졌습니다")
        }, label: {
            Text(placeholder)
                .foregroundStyle(.white)
                .font(.largeTitle)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .padding()
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
        })
    }
}

struct Flower: View{
    let name: String
    
    init(count: Int) {
        self.name = "꽃이 \(count)개 있습니다."
    }
    
    var body: some View {
        Text(name)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
    }
}

#Preview {
    CustomButton(placeholder: "버튼 이름이 바뀌었네요")
//    Flower(count: 4)
}
