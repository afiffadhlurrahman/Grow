//
//  TaskCompletedView.swift
//  Grow Watch App
//
//  Created by Muhammad Afif Fadhlurrahman on 26/04/24.
//

import SwiftUI

struct TaskCompletedView: View {
    @State var lottieConfetti: String = "lottieConfetti"
    @ObservedObject var viewModelConfetti: LottieViewModel = .init()
    
    var body: some View {
            ZStack{
                // Color(red: 0.78, green: 0.92, blue: 0.79)
                
                // Confetti
                Image(uiImage: viewModelConfetti.image)
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFit()
                    .onAppear {
                        self.viewModelConfetti.speed = 0.05/2
                        self.viewModelConfetti.lastFrame = 130
                        self.viewModelConfetti.loadAnimationFromFile(filename: lottieConfetti)
                    }
                
                
                VStack(spacing: 10){
                    // Tree
                    ZStack{
                        
                        switch Router.shared.selectedLevel {
                        case "easy":
                            Image("Tree Easy")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                            
                        case "medium":
                            Image("Tree Medium")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                            
                        case "hard":
                            Image("Tree Hard")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                        default:
                            Image("defaultIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200)
                        }
                    }
                    
                    HStack{
                        
                        HomeButton()
                        
                        
                        NavigationLink(destination: TreeGardenView()) {
                            ZStack{
                                Circle()
                                    .foregroundColor(Color(red: 0.44, green: 0.69, blue: 0.52))
                                    .frame(width: 50)
                                
                                Image(systemName: "tree.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 27)
                                    .foregroundColor(.white)
                            }
                            
                        }
                    }
                    
                    // Button
                                    
                                        
                                    
                    
                    // Button
                    
                }
        }
        .buttonStyle(.borderless)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .background(Color(uiColor: UIColor(red: 0.78, green: 0.92, blue: 0.79, alpha: 1)))
    }
}

#Preview {
    TaskCompletedView()
}
