//
//  GrowApp.swift
//  Grow Watch App
//
//  Created by Muhammad Afif Fadhlurrahman on 24/04/24.
//

import SwiftUI

@main
struct GrowApp: App {
    @StateObject var workoutManager = WorkoutManager()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(workoutManager)
//            TaskCompletedView()
        }
    }
}
