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
                            NavigationLink {
                                DetailView()
                            } label: {
                                HStack {
                                    Text (card.template + " " + card.affirmation)
                                    Spacer()
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.rippleYellow1)
                                }
                            }
                            }
                            .listRowBackground(Color("RippleTeal2"))
                            .foregroundColor(.white)
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
        .accentColor(.rippleYellow1)
        }
    }
          



#Preview {
    @Previewable @State var savedCards: Deck = Deck(cards: [
        Card(template: "I am", affirmation: "cool", saved: false),
        Card(template: "I am", affirmation: "resilient", saved: false),
        Card(template: "I am", affirmation: "boom", saved: false),
        Card(template: "I am", affirmation: "boop", saved: false),
    ])
    ReflectionView()
        .environmentObject(savedCards)
}
