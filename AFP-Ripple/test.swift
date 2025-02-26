//
//  test.swift
//  AFP-Ripple
//
//  Created by Donovan Ong on 25/2/2025.
//

import SwiftUI

struct test: View {
    
    @EnvironmentObject var savedCards: Deck
    
    var body: some View {
        VStack {
            ForEach(savedCards.cards) { card in
                Text(card.template + " " + card.affirmation)
            }
        }
    }
}
 


#Preview {
}
