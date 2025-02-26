//
//  HomeView.swift
//  AFP-Ripple
//
//  Created by Mira on 24/2/2025.
//

import SwiftUI

struct HomeView: View {
    
    let size: CGFloat = 100
    
    @State private var position: CGPoint = .init(x: 170, y: 300)
  
    
    var body: some View {
        
        
        
        
        
        NavigationStack {
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
                    .frame(width: 15, height: 25)
                    .position(x: 160, y: 250)
                
                
                
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .position(x: 200, y: 260)
                
                
                
                VStack {
                    
                    
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                            Text("Sign In")
                                .buttonBorderShape(.roundedRectangle(radius: 5))
                                .padding(20)
                                .foregroundColor(.white)
                                .background(.rippleLilac1)
                                .cornerRadius(200)
                        
                    
                            
                        }
                    }
                    
                
                .padding(.top, 500)
                
                
                // Button
                // Look up `.sheet` SwiftUI
                
                
                
                Text("Welcome to Ripple")

                    .padding()
                    .background(Color.rippleTeal2)
                    .foregroundColor(.white)
                    .cornerRadius(100)
                    .padding()
                    
                
                
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                
           

                
                
                Smile(size: size)
                    .position(x: position.x + size * 0.1, y: position.y + size * 0.3)
            }
            .padding()
        }
        
    }
}

#Preview {
    HomeView()
}
