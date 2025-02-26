//
//  AFP_RippleApp.swift
//  AFP-Ripple
//
//  Created by Donovan Ong on 24/2/2025.
//

import SwiftUI

@main
struct AFP_RippleApp: App {
    @StateObject var savedCards: Deck = Deck(cards: [])

    var body: some Scene {
        WindowGroup {
            TabView {
                Tab {
                    CreateView()
                } label: {
                    Image(systemName: "globe")
                    Text("My Travel")
                }
                Tab {
                    ExploreView()
                } label: {
                    Image(systemName: "person.3")
                    Text("Student List")
                }
                Tab {
                    test()
                } label: {
                    Image(systemName: "person.3")
                    Text("Student List")
                }
            }
            .environmentObject(savedCards)
        }

    }
}
