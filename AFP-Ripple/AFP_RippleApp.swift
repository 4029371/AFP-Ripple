//
//  AFP_RippleApp.swift
//  AFP-Ripple
//
//  Created by Donovan Ong on 24/2/2025.
//

import SwiftUI

@main
struct AFP_RippleApp: App {
    @StateObject var savedCards: Deck = Deck(cards: [
        Card(template: "I am", affirmation: "a placeholder", saved: true),
    ])

    var body: some Scene {
        WindowGroup {
            TabView {
                Tab {
                    CreateView()
                } label: {
                    Image(systemName: "plus")
                        .bold()
                    Text("Create")
                }
                Tab {
                    ExploreView()
                } label: {
                    Image(systemName: "heart.text.square.fill")
                    Text("Explore")
                }
                Tab {
                    ReflectionView()
                } label: {
                    Image(systemName: "heart.fill")
                    Text("Saved")
                }
            }
            .environmentObject(savedCards)
            .tint(.rippleYellow1)
        }

    }
}
