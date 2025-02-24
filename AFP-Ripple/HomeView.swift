//
//  HomeView.swift
//  AFP-Ripple
//
//  Created by Mira on 24/2/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var userName = ""
    @State private var password = ""
    @State private var loginMessage = ""
 
    var body: some View {
        
        
    
            
            
            ZStack {
                Rectangle()
                    .frame (width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    .opacity(0.8)
                    .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.7333333333, blue: 0.6901960784, alpha: 1)))
                    .ignoresSafeArea()
                
                
                
                Circle()
                    .foregroundColor(.rippleYellow1)
                    .frame(width: 580, height:580)
                    .position(x: 80, y: 400)
                    .shadow(radius: 20)
                    .padding()
                    .rotation3DEffect(.degrees(360), axis: (x: 0, y: 1, z: 0))
                
                
                
                
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .position(x: 160, y: 250)
                
                
                
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .position(x: 250, y: 300)
                
                
                VStack {
                    Text ("Log In")
                    TextField ("Username", text: $userName)
                    SecureField ("Password", text:$password)
                        .textContentType(.password)
                    
                   
                    
                    Button(action: {
                        loginMessage = "Login Successful"
                    }) {
                        Text("Sign In")
                            .buttonBorderShape(.roundedRectangle(radius: 5))
                            .padding()
                            .foregroundColor(.white)
                            .background(Color(.rippleLilac1))
                            .padding()
                            .frame(width: 200, height: 40)
                        
                        
                    }
                    
                        
                    }
                
                
            }
            
        
        
        
        }
    
    
    
        
            
            
               
            
            
        }
    


#Preview {
    HomeView()
}
