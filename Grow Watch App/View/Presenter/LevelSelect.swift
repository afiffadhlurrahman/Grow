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
                    LevelCard(level: "easy", levelBackground: Color(red: 0.54, green: 0.73, blue: 0.58))
                    LevelCard(level: "medium", levelBackground: Color(red: 0.54, green: 0.73, blue: 0.58))
                    LevelCard(level: "hard", levelBackground: Color(red: 0.54, green: 0.73, blue: 0.58))
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
        }.background(Color(uiColor: UIColor(red: 0.78, green: 0.92, blue: 0.79, alpha: 1)))
    }
}

#Preview {
    LevelSelect()
}
