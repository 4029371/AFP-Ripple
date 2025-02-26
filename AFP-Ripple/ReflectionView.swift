//
//  ReflectionView.swift
//  AFP-Ripple
//
//  Created by TIEU THUY ANH on 24/2/2025.
//

import SwiftUI

struct ReflectionView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color("RippleTeal1")
                    .ignoresSafeArea()
                
                List {
                    Section {
                        NavigationLink { DetailView (description: " Your affirmation created on...") }
                        label: {
                            Text ("Saved Affirmations Detail 1") }
                    }
                    .listRowBackground(Color("RippleTeal2"))
                    .foregroundColor(.white)
                    
                    
                    Section {
                        NavigationLink { DetailView (description: "Your affirmation created on...") }
                        label: {
                            Text ("Saved Affirmations Detail 2") }
                    }.listRowBackground(Color("RippleTeal2"))
                        .foregroundColor(.white)
                    
                    Section {
                        NavigationLink { DetailView (description: "Your affirmation created on...") }
                        label: {
                            Text ("Saved Affirmations Detail 3") }
                    }.listRowBackground(Color("RippleTeal2"))
                        .foregroundColor(.white)
                    
                    Section {
                        NavigationLink { DetailView (description: "Your affirmation created on...") }
                        label: {
                            Text ("Saved Affirmations Detail 4") }
                    }
                    .listRowBackground(Color("RippleTeal2"))
                    .foregroundColor(.white)
                }
                .navigationTitle("Archive")
                .padding(.vertical)
                .foregroundColor(.white)
                .scrollContentBackground(.hidden)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
        }
    }
          
        }



#Preview {
    ReflectionView()
}
