//
//  HomeButton.swift
//  Grow Watch App
//
//  Created by Muhammad Afif Fadhlurrahman on 26/04/24.
//

import SwiftUI

struct PlayButton: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(Color(red: 0.44, green: 0.69, blue: 0.52))
                .frame(width: 50)
            
            Button(action: {
                workoutManager.resetWorkout()
                Router.shared.path.append(.levelSelect)
            }, label: {
                Image(systemName: "play.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(.white)
            })
            .padding()
            .background(Color(red: 0.44, green: 0.69, blue: 0.52))
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .buttonStyle(.borderless)
        }
    }
    
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton()
    }
}
