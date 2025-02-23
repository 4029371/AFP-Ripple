//
//  AFP_RippleApp.swift
//  AFP-Ripple
//
//  Created by Donovan Ong on 24/2/2025.
//

import SwiftUI

@main
struct AFP_RippleApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                Tab {
                    // Add View Here
                } label: {
                    Image(systemName: "globe")
                    Text("My Travel")
                }
                Tab {
                    // Add View Here
                } label: {
                    Image(systemName: "person.3")
                    Text("Student List")
                }
                Tab {
                    // Add View Here
                } label: {
                    Image(systemName: "lock.fill")
                    Text("Own Struct")
                }
                Tab {
                    // Add View Here
                } label: {
                    Image(systemName: "lock.fill")
                    Text("Own Struct")
                }
                Tab {
                    // Add View Here
                } label: {
                    Image(systemName: "lock.fill")
                    Text("Own Struct")
                }
            }
        }

    }
}
