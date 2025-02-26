//
//  DetailView.swift
//  AFP-Ripple
//
//  Created by TIEU THUY ANH on 25/2/2025.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var templateText: String
    @Binding var affirmationText: String
    @Binding var liked: Bool
    
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
                
                ExploreCard(templateText: $templateText, affirmationText: $affirmationText, liked: $liked)
            }
            
        }
    }
}

#Preview {
    @Previewable @State var templateText: String = "I am"
    @Previewable @State var affirmationText: String = "The best"
    @Previewable @State var liked: Bool = false
    DetailView(templateText: $templateText, affirmationText: $affirmationText, liked: $liked)
}
