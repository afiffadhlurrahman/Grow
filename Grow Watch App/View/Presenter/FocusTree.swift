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
//                    Router.shared.path.append(.taskComplete)
                }, label: {
                    // Progress Bar
                    ZStack {
                        VStack {
                                        Spacer()
                                        ProgressView(value: progress)
                                            .progressViewStyle(CircularProgressViewStyle(tint: Color(red: 0.44, green: 0.69, blue: 0.52))) // Mengubah warna progress bar
                                            .scaleEffect(2.5) // Memperbesar ukuran progress bar
                                            .padding()
                                            .onTapGesture {
                                                workoutManager.distance += 10
                                            }
                                            .onAppear {
                                                // Start animating the progress bar
//                                                withAnimation(.linear(duration: 3)) { // Mengubah durasi menjadi 2 detik
//                                                    self.progress = 1.0
//                                                }
                                            }
                                            .onChange(of: workoutManager.distance) { oldValue, newValue in
                                                withAnimation(.linear(duration: 1)) { // Mengubah durasi menjadi 2 detik
                                                    if self.progress < 1 {
                                                        self.progress = newValue / 30
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
                            .onAppear {
                                self.viewModel.speed = 2
                                self.viewModel.lastFrame = 70
                                self.viewModel.loadAnimation(url: URL(string: "https://lottie.host/892ef239-5e69-4385-9b46-a1d56de77971/iLbrJpNZu3.json")!)

                            }
                        
                    }
                })
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
                
//                Text(
//                    Measurement(
//                        value: workoutManager.speed,
//                        unit: UnitSpeed.kilometersPerHour
//                    ).formatted(
//                        .measurement(
//                            width: .abbreviated,
//                            numberFormatStyle: .number
//                        )
//                    )
//                ).foregroundStyle(.black).font(.system(size: 32))
            }
            .tag(Tab.tree)
                .buttonStyle(.borderless)
            
        }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    NavigationStack {
        FocusTree()
    }
}
