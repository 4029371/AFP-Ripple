//
//  DetailView.swift
//  AFP-Ripple
//
//  Created by TIEU THUY ANH on 25/2/2025.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack{
            Color("RippleTeal1")
                .ignoresSafeArea()
            VStack {
                //linked the cards
                Text ("This is your saved affirmation" )
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
                
                Image(systemName: "giftcard.fill")
                                .resizable()
                                .frame(width: 250, height: 200)
                                .foregroundColor(.rippleLilac1)
                                .padding()
            }
            
        }
    }
}

#Preview {
    DetailView()
}
