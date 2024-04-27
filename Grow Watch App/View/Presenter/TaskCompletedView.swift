//
//  TaskCompletedView.swift
//  Grow Watch App
//
//  Created by Muhammad Afif Fadhlurrahman on 26/04/24.
//

import SwiftUI

struct TaskCompletedView: View {
    @ObservedObject var viewModel: LottieViewModel = .init()
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    Color(red: 0.78, green: 0.92, blue: 0.79).ignoresSafeArea()
                    
                    // Confetti
                    Image(uiImage: viewModel.image)
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFit()
                        .onAppear {
                            self.viewModel.loadAnimation(url: URL(string: "https://lottie.host/9917178f-3626-4539-9ddf-db5117573cba/hgznNkZ0iZ.json")!)
                        }
                    
                    
                    VStack{
                        // Tree
                        ZStack{
                            Image("defaultIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                        }
                        Spacer()
                        
                        // Button
                       HomeButton()
                    }.ignoresSafeArea()
                }
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
