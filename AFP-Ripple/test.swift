//
//  test.swift
//  AFP-Ripple
//
//  Created by Donovan Ong on 25/2/2025.
//

import SwiftUI

struct test: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(0..<10) {
                    Text("Item \($0)")
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .frame(width: 200, height: 200)
                        .background(.red)
                }
            }
        }
    }
}
 


#Preview {
    test()
}
