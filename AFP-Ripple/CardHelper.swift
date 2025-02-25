//
//  CardHelper.swift
//  AFP-Ripple
//
//  Created by Donovan Ong on 25/2/2025.
//

import SwiftUI

struct CardHelper: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct card: Identifiable {
    var id = UUID()
    var template: String
    var affirmation: String
    var saved: Bool
}

#Preview {
    CardHelper()
}
