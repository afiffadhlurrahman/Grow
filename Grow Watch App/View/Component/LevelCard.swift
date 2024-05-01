//
//  LevelCard.swift
//  Grow Watch App
//
//  Created by Alfadli Maulana Siddik on 27/04/24.
//

import SwiftUI

struct LevelCard: View {
    var level: String
    var levelBackground: Color
    var distance: Double // Tambahkan properti distance
    
    var levelIcon: String {
        if level == "easy" {
            return "Level Easy"
        } else if level == "medium" {
            return "Level Medium"
        } else {
            return "Level Hard"
        }
    }
    
    @EnvironmentObject var workoutManager: WorkoutManager
    
    var body: some View {
        Button {
            workoutManager.selectedWorkout = .running
            Router.shared.path.append(.focusTree)
            Router.shared.selectedLevelDistance = distance
            Router.shared.selectedLevel = level
        } label: {
            HStack {
                Image(levelIcon)
                    .font(.system(size: 36))
                    .foregroundColor(Color(red: 0.95, green: 0.88, blue: 0.82))
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 16))
                    .padding()
                    .background(Color(red: 0.62, green: 0.75, blue: 0.62))
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color(red: 0.95, green: 0.88, blue: 0.82))
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
        }
//        .listItemTint(Color(red: 0.54, green: 0.73, blue: 0.58))
        .listItemTint(levelBackground)
        .buttonStyle(.borderless)
    }
}

#Preview {
    LevelCard(level: "easy", levelBackground: Color(red: 0.44, green: 0.69, blue: 0.52), distance: 30)
}
