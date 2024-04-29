//
//  FocusTree.swift
//  Grow Watch App
//
//  Created by Alfadli Maulana Siddik on 26/04/24.
//

import SwiftUI

struct FocusTree: View {
    @ObservedObject var viewModel: LottieViewModel = .init()
    @EnvironmentObject var workoutManager: WorkoutManager
    
    @State private var progress: CGFloat = 0.0 // State untuk mengontrol progress bar
    
    @State private var selection: Tab = .tree
    
    var level: String
    var target: Double {
        switch level {
        case "easy":
            return 30
        case "medium":
            return 60
        case "hard":
            return 100
        default:
            return 0
        }
    }

    enum Tab {
        case controls, tree
    }
    
    var body: some View {
        TabView (selection: $selection) {
            Button(action: {
                workoutManager.endWorkout()
                workoutManager.resetWorkout()
                Router.shared.path.removeAll()
            }, label: {
                Image(systemName: "stop.fill")
                    .foregroundColor(Color(red: 0.95, green: 0.88, blue: 0.82))
            })
            .background(Color(red: 0.51, green: 0.73, blue: 0.58))
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .tag(Tab.controls)
            
            VStack {
                Button (action: {
                    Router.shared.path.append(.taskComplete)
                }, label: {
                    // Progress Bar
                    ZStack {
                        VStack {
                            Spacer()
                            ProgressView(value: progress)
                                .progressViewStyle(CircularProgressViewStyle(tint: Color(red: 0.44, green: 0.69, blue: 0.52))) // Mengubah warna progress bar
                                .scaleEffect(2.5) // Memperbesar ukuran progress bar
                                .padding()
                                .onChange(of: workoutManager.distance) { oldValue, newValue in
                                    withAnimation(.linear(duration: 1)) { // Mengubah durasi menjadi 2 detik
                                        if self.progress < 1 {
                                            self.progress = newValue / target
                                        } else {
                                            Router.shared.path.append(.taskComplete)
                                        }
                                    }
                                }

                            Spacer()
                        }
                        
                        // Animasi Lottie
                        Image(uiImage: viewModel.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .padding() // Sesuaikan dengan kebutuhan
                        
                    }
                })
                HStack {
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
                    Text(
                        Measurement(
                            value: workoutManager.speed,
                            unit: UnitSpeed.metersPerSecond
                        ).formatted(
                            .measurement(
                                width: .abbreviated,
                                numberFormatStyle: .number
                            )
                        )
                    )
                }.foregroundStyle(.black).font(.system(size: 16))
                
            }
            .tag(Tab.tree)
                .buttonStyle(.borderless)
            
        }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    NavigationStack {
        FocusTree(level: "easy")
    }
}
