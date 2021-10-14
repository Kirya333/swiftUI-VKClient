//
//  ContentView.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 04.10.2021.
//

import SwiftUI
import Combine

struct LoginView: View {
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowMainView: Bool = false
    @State private var shouldShowLogo: Bool = true
    @State private var showIncorrentCredentialsWarning = false
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    )
    .removeDuplicates()
    
    @Binding var isUserLoggedIn: Bool
    
    let loginService = LoginService()
    
    private func verifyLoginData() {
        if loginService.checkUserData(login: login, password: password) {
            isUserLoggedIn = true
        } else {
            showIncorrentCredentialsWarning = true
        }
        
        password = ""
    }
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                Image("vkImage")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            }
            ScrollView(showsIndicators: false) {
                VStack {
                    if shouldShowLogo {
                        Text("VK Client ")
                            .font(.largeTitle)
                            .padding(.top, 32)
                            .aspectRatio(contentMode: .fill)
                        
                    }
                    VStack {
                        HStack {
                            Text("Login:")
                            Spacer()
                            TextField("", text: $login)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        HStack {
                            Text("Password:")
                            Spacer()
                            SecureField("", text: $password)
                                .frame(maxWidth: 150)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }.frame(maxWidth: 250)
                    .padding(.top, 50)
                    Button(action: verifyLoginData) {
                        Text("Log in")
                    }.padding(.top, 50)
                    .padding(.bottom, 20)
                    .disabled(login.isEmpty || password.isEmpty)
                }
            }
            .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                withAnimation(Animation.easeInOut(duration: 0.5)) {
                    self.shouldShowLogo = !isKeyboardOn
                }
            }
        }.onTapGesture {
            UIApplication.shared.endEditing()
        }.alert(isPresented: $showIncorrentCredentialsWarning, content: { Alert(title: Text("Error"), message: Text("Incorrent Login/Password was entered"))
        })
        }
    }




struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isUserLoggedIn: .constant(false))
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
