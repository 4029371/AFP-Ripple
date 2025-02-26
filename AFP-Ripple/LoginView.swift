//
//  LoginView.swift
//  AFP-Ripple
//
//  Created by Mira on 25/2/2025.
//

import SwiftUI

struct LoginView: View {
    @State private var userName = ""
    @State private var password = ""
    @State private var loginMessage = ""
    
    var body: some View {
        
      
        
        ZStack {
            
            Color.rippleTeal1
                .ignoresSafeArea()
            
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.rippleYellow1)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                Spacer()
                Image(systemName: "lock.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 250)
                    .foregroundStyle(LinearGradient(colors: [.rippleLilac1, .rippleYellow1], startPoint: .top, endPoint: .bottom))
                
                Rectangle()
                    .fill(Color.rippleTeal2)
                    .frame(width: 300, height: 175)
                    .cornerRadius(20)
                    .overlay {
                        VStack (spacing: 0) {
                            
                            TextField ("Username", text: $userName)
                                .foregroundColor(.white)
                                .background(Color(.rippleTeal1))
                                .cornerRadius(5)
                                .opacity(0.7)
                                .padding(.horizontal, 20)
                                .bold()
                            
                            SecureField ("Password", text:$password)
                                .textContentType(.password)
                                .background(Color(.rippleTeal1))
                                .cornerRadius(5)
                                .padding(20)
                                .opacity(0.7)
                                .bold()
                            
                            Button(action: {
                                loginMessage = "Login Successful"
                            }) {
                                Text("Sign In")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.rippleYellow1)
                        }
                    }
                Spacer()
            }
        }
    }
    
}
#Preview {
    LoginView()
}
