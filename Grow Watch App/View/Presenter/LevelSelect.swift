//
//  LevelSelect.swift
//  Grow Watch App
//
//  Created by Alfadli Maulana Siddik on 26/04/24.
//

import SwiftUI

struct LevelSelect: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject private var navPath = Router.shared
    
    var body: some View {
        VStack {
            NavigationStack (path: $navPath.path) {
                List {
                    LevelCard(level: "easy")
                    LevelCard(level: "medium")
                    LevelCard(level: "hard")
                }
                .listStyle(.carousel)
                .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                            case .focusTree:
                                FocusTree()
                            case .taskComplete:
                                TaskCompletedView()
                        }
                }
            }
        }
    }
}

#Preview {
    LevelSelect()
}
