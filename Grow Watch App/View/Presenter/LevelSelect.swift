//
//  LevelSelect.swift
//  Grow Watch App
//
//  Created by Alfadli Maulana Siddik on 26/04/24.
//

import SwiftUI

struct LevelSelect: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    LevelCard(level: "easy")
                    LevelCard(level: "medium")
                    LevelCard(level: "hard")
                }.listStyle(.carousel)
            }
        }
    }
}

#Preview {
    LevelSelect()
}
