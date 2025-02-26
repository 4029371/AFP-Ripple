//
//  ReflectionView.swift
//  AFP-Ripple
//
//  Created by TIEU THUY ANH on 24/2/2025.
//

import SwiftUI

struct ReflectionView: View {
    @EnvironmentObject var savedCards: Deck

    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.rippleTeal1)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Saved")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.rippleYellow1)
                        .multilineTextAlignment(.center)
                        .frame(width: 250)
                    List {
                        ForEach(savedCards.cards) { card in
                                NavigationLink { DetailView() }
                                label: {
                                    Text (card.template + " " + card.affirmation) }
                            }
                            .listRowBackground(Color("RippleTeal2"))
                            .foregroundColor(.white)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
    }
          



#Preview {
    ReflectionView()
}
