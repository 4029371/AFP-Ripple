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
            
            Color.white
                .ignoresSafeArea()
            
                
            
            Rectangle()
                .fill(Color.rippleTeal1)
                .opacity(0.5)
                .frame(width: 300, height: 400)
                .cornerRadius(20)
                .overlay {
                    VStack {
                        
                        TextField ("Username", text: $userName)
                            .foregroundColor(.white)
                            .background(Color(.rippleTeal1))
                            .opacity(0.3)
                            
                            .padding(20)
                        
                        SecureField ("Password", text:$password)
                            .textContentType(.password)
                            .background(Color(.rippleTeal1))
                            .padding(20)
                            .opacity(0.3)
                        
                        
                        Button(action: {
                            loginMessage = "Login Successful"
                        }) {
                            Text("Sign In")
                                .buttonBorderShape(.roundedRectangle(radius: 5))
                                .padding()
                                .foregroundColor(.white)
                                .background(Color(.rippleYellow1))
                                .padding()
                                .frame(width: 200, height: 40)
                            
                            
                        }
                    }
                }
        }
    }
    
}
#Preview {
    LoginView()
}
