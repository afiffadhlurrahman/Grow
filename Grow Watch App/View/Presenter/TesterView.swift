//
//  TesterView.swift
//  Grow Watch App
//
//  Created by Muhammad Afif Fadhlurrahman on 26/04/24.
//

import SwiftUI

struct TesterView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    var body: some View {
        
        Text(
                Measurement(
                    value: workoutManager.distance,
                    unit: UnitLength.meters
                ).formatted(
                    .measurement(
                        width: .abbreviated,
                        usage: .road
                    )
                )
            )
    }
}

#Preview {
    TesterView()
}
