//
//  ContentView.swift
//  AFP-Ripple
//
//  Created by Donovan Ong on 24/2/2025.
//
// Test Push
import SwiftUI

struct ColorPreview: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color(#colorLiteral(red: 0.4666666667, green: 0.7333333333, blue: 0.6901960784, alpha: 1)))
                .ignoresSafeArea()
            VStack {
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(Color(#colorLiteral(red: 0.3657156825, green: 0.519503355, blue: 0.5258209705, alpha: 1)))
                        .frame(width: 200, height: 200)
                    Image(systemName: "water.waves")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .foregroundStyle(Color(#colorLiteral(red: 0.879907012, green: 0.7766652703, blue: 0.1443305612, alpha: 1)))
                }
                Text("Ripple")
                    .foregroundStyle(Color(#colorLiteral(red: 0.8502051234, green: 0.8743068576, blue: 1, alpha: 1)))
                    .fontWeight(.bold)
                    .font(.title)
            }
            .padding()
        }
    }
}

#Preview {
    ColorPreview()
}
