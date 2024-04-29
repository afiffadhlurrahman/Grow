//
//  LevelSelect.swift
//  Grow Watch App
//
//  Created by Alfadli Maulana Siddik on 26/04/24.
//

import SwiftUI
import HealthKit

struct LevelSelect: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @StateObject private var navPath = Router.shared
    
    var workoutTypes: [HKWorkoutActivityType] = [.running]
    
    let easyDistance: Double = 45 // Jarak untuk level easy
    let mediumDistance: Double = 90 // Jarak untuk level medium
    let hardDistance: Double = 135 // Jarak untuk level hard
    
    var body: some View {
        VStack {
            NavigationStack (path: $navPath.path) {
                List {
                    LevelCard(level: "easy", levelBackground: Color(red: 0.54, green: 0.73, blue: 0.58), distance: easyDistance)
                    LevelCard(level: "medium", levelBackground: Color(red: 0.54, green: 0.73, blue: 0.58), distance: mediumDistance)
                    LevelCard(level: "hard", levelBackground: Color(red: 0.54, green: 0.73, blue: 0.58), distance: hardDistance)
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
        .background(Color(uiColor: UIColor(red: 0.78, green: 0.92, blue: 0.79, alpha: 1)))
        .onAppear {
            workoutManager.requestAuthorization()
        }
    }
}

#Preview {
    LevelSelect()
}

extension HKWorkoutActivityType: Identifiable {
    public var id: UInt {
        rawValue
    }

    var name: String {
        switch self {
        case .running:
            return "Run"
        default:
            return ""
        }
    }
}
