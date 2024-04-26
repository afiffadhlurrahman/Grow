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

struct LevelCard: View {
    var level: String
    var levelIcon: String {
        if level == "easy" {
            return "dial.low.fill"
        } else if level == "medium" {
            return "dial.medium.fill"
        } else {
            return "dial.high.fill"
        }
    }
    
    var body: some View {
        NavigationLink {
            FocusTree()
        } label: {
            HStack {
                Image(systemName: levelIcon)
                    .font(.system(size: 36))
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 16))
                    .padding()
                    .background(.gray)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            }
            .padding(
                EdgeInsets(
                    top: 20,
                    leading: 8,
                    bottom: 20,
                    trailing: 8
                )
            )
            .cornerRadius(16.0)
        }.listItemTint(Color.gray.opacity(0.8))
    }
}
