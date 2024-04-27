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
        NavigationView {
                ZStack{
                    Color(red: 0.78, green: 0.92, blue: 0.79).ignoresSafeArea()
                    
                    // Confetti
                    Image(uiImage: viewModel.image)
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFit()
                        .onAppear {
                            self.viewModel.loadAnimationFromFile(filename: lottieConfetti)
                        }
                    
                    
                    VStack(spacing: 10){
                        Spacer()
                        Spacer()
                        // Tree
                        ZStack{
                            Image("defaultIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                        }
                        
                        // Button
                        HomeButton()
                        
                        Spacer()
                    }.ignoresSafeArea()
            }
            .buttonStyle(.borderless)
            .navigationBarTitle("Home")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    TaskCompletedView()
}

// https://lottie.host/9917178f-3626-4539-9ddf-db5117573cba/hgznNkZ0iZ.json
