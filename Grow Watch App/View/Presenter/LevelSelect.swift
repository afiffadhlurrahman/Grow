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
    @State var level: String = "easy"
    
    var workoutTypes: [HKWorkoutActivityType] = [.running]
    
    var body: some View {
        VStack {
            NavigationStack (path: $navPath.path) {
                List {
                    LevelCard(level: $level, setLevel: "easy", levelBackground: Color(red: 0.54, green: 0.73, blue: 0.58))
                    LevelCard(level: $level, setLevel: "medium", levelBackground: Color(red: 0.54, green: 0.73, blue: 0.58))
                    LevelCard(level: $level, setLevel: "hard", levelBackground: Color(red: 0.54, green: 0.73, blue: 0.58))
                }
                .listStyle(.carousel)
                .navigationDestination(for: Router.Destination.self) { destination in
                        switch destination {
                            case .focusTree:
                                FocusTree(level: level)
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
