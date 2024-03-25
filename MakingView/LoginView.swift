//
//  LoginView.swift
//  MakingView
//
//  Created by 신승훈 on 2024/03/25.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isUserLoggedIn = false
    
    var isValidEmail: Bool {
        isValid(regex: "[A-Z0-9a-z._%+=]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
    }
    
    func login(){
        isUserLoggedIn = isValidEmail
    }
    
    private func isValid(regex: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: email)
    }
}

struct LoginView1: View {
    @StateObject private var loginVM = LoginViewModel()
//    @ObservedObject private var loginData = LoginData
    
//    @State private var email = ""
//    @State private var password = ""
//    @State private var isUerLoggedIn = false
    
    var body: some View {
        VStack {
            Text("로그인이 필요해요").font(.largeTitle).bold()
            
            TextField("이메일을 입력해 주세요...", text: $loginVM.email)
                .roundedField()
            
            SecureField("비밀번호를 입력해 주세요...", text: $loginVM.password)
                .roundedField()

            Button("로그인") {
                loginVM.login()
            }
            .disabled(!loginVM.isValidEmail)
        }
            .fullScreenCover(isPresented: $loginVM.isUserLoggedIn) {
                Text(loginVM.email)
            }
        }
       
}

struct LoginView2: View {
    @ObservedObject private var loginVM = LoginViewModel()
//    @ObservedObject private var loginData = LoginData
    
//    @State private var email = ""
//    @State private var password = ""
//    @State private var isUerLoggedIn = false
    
    var body: some View {
        VStack {
            Text("로그인이 필요해요").font(.largeTitle).bold()
            
            TextField("이메일을 입력해 주세요...", text: $loginVM.email)
                .roundedField()
            
            SecureField("비밀번호를 입력해 주세요...", text: $loginVM.password)
                .roundedField()

            Button("로그인") {
                loginVM.login()
            }
            .disabled(!loginVM.isValidEmail)
        }
            .fullScreenCover(isPresented: $loginVM.isUserLoggedIn) {
                Text(loginVM.email)
            }
        }
       
}

struct ContainerView: View {
    @State private var toggle: Bool = false
    
    var body: some View {
        VStack {
            Toggle("토글 해봅시다", isOn: $toggle)
            
            LoginView1()
            LoginView2()
        }
    }
}

extension View {
    func roundedField() -> some View {
        self.padding()
            .background{
                RoundedRectangle(cornerRadius: 20).stroke()
            }
            .padding([.horizontal, .bottom])
    }
}


#Preview {
    ContainerView()
//    LoginView()
//    @StateObject var loginData = LoginData()
//    LoginView(loginData: loginData)
}
