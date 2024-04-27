//
//  TaskCompletedView.swift
//  Grow Watch App
//
//  Created by Muhammad Afif Fadhlurrahman on 26/04/24.
//

import SwiftUI

struct TaskCompletedView: View {
    @State var lottieConfetti: String = "lottieConfetti"
    @ObservedObject var viewModel: LottieViewModel = .init()
    
    var body: some View {
            ZStack{
                // Color(red: 0.78, green: 0.92, blue: 0.79)
                
                // Confetti
                Image(uiImage: viewModel.image)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFit()
                    .onAppear {
                        self.viewModel.speed = 10
                        self.viewModel.lastFrame = 130
                        self.viewModel.loadAnimationFromFile(filename: lottieConfetti)
                    }
                
                
                VStack(spacing: 10){
                    // Tree
                    ZStack{
                        Image("defaultIcon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                    }
                    
                    // Button
                    HomeButton()
                }
        }
        .buttonStyle(.borderless)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    TaskCompletedView()
}
