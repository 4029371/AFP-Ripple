//
//  ExploreView.swift
//  AFP-Ripple
//
//  Created by Donovan Ong on 25/2/2025.
//

import SwiftUI

struct ExploreView: View {
    
    @State var selectedPage = 0
    @State var cardArray: [card] = []
    
    @State var exploreCards: [card] = [
        card(template: "I am", affirmation: "cool", saved: false),
        card(template: "I am", affirmation: "resilient", saved: false),
        card(template: "I am", affirmation: "boom", saved: false),
        card(template: "I am", affirmation: "bam", saved: false),
    ]
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(.rippleTeal2)
                .ignoresSafeArea()
            
            VStack {
                Text("Explore")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.rippleYellow1)
                    .multilineTextAlignment(.center)
                    .frame(width: 250)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(0..<exploreCards.count, id: \.self) { i in
                            VStack () {
                                Spacer()
                                ExploreCard(templateText: $exploreCards[i].template, affirmationText: $exploreCards[i].affirmation, liked: $exploreCards[i].saved, savedCards: $cardArray)
                                    .offset(y: -20)
                                    .tag(i)
                                    .tabItem {
                                        Text("Page \(i + 1)")
                                    }
                                Spacer()
                                // REMOVE ME
                                ForEach(cardArray, id: \.id) { card in
                                    Text(card.template + " " + card.affirmation)
                                }
                            }
                        }
                    }
                }
            }
            
//            TabView(selection: $selectedPage) {
//                ForEach(0..<exploreCards.count, id: \.self) { i in
//                    VStack () {
//                        Text("Explore")
//                            .font(.largeTitle)
//                            .fontWeight(.bold)
//                            .foregroundStyle(.rippleYellow1)
//                            .multilineTextAlignment(.center)
//                            .frame(width: 250)
//                        Spacer()
//                        ExploreCard(templateText: $exploreCards[i].template, affirmationText: $exploreCards[i].affirmation, liked: $exploreCards[i].saved, savedCards: $cardArray)
//                            .offset(y: -20)
//                            .tag(i)
//                            .tabItem {
//                                Text("Page \(i + 1)")
//                            }
//                        Spacer()
//                        // REMOVE ME
//                        ForEach(cardArray, id: \.id) { card in
//                            Text(card.template + " " + card.affirmation)
//                        }
//                    }
//                }
//            }
//            .tabViewStyle(.page(indexDisplayMode: .always))
        }
    }
}

#Preview {
    ExploreView()
}
