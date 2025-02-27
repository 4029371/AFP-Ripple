//
//  DetailView.swift
//  AFP-Ripple
//
//  Created by TIEU THUY ANH on 25/2/2025.
//

import SwiftUI

struct DetailView: View {
    
    @State var templateText = "I am"
    @State var affirmationText = "test"
    @State var saved = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.rippleTeal1)
                .ignoresSafeArea()
            
            VStack {
                //linked the cards
                Text("Card View")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.rippleYellow1)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                
                ExploreCard(templateText: $templateText, affirmationText: $affirmationText, liked: $saved)
            }
            
        }
    }
}

#Preview {
    DetailView()
}
