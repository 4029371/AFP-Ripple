//
//  WhatisRipple.swift
//  AFP-Ripple
//
//  Created by Mira on 25/2/2025.
//

import SwiftUI

struct WhatisRipple: View {
    var body: some View {
        ZStack {
            
            Rectangle()
                .fill(Color.rippleTeal1)
                .frame(width: 300, height: 300)
                .cornerRadius(20)
            
            
        }
    }
}
#Preview {
    WhatisRipple()
}
