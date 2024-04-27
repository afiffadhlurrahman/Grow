//
//  LevelCard.swift
//  Grow Watch App
//
//  Created by Alfadli Maulana Siddik on 27/04/24.
//

import SwiftUI

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

#Preview {
    LevelCard(level: "easy")
}
