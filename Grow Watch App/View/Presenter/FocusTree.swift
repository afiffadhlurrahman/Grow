//
//  FocusTree.swift
//  Grow Watch App
//
//  Created by Alfadli Maulana Siddik on 26/04/24.
//

import SwiftUI

struct FocusTree: View {
    @State var lottieTree: String = "Animation - 1714039557202"

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
            .clipShape(Circle())
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

                                            .onChange(of: workoutManager.distance) { oldValue, newValue in
                                                withAnimation(.linear(duration: 1)) { // Mengubah durasi menjadi 2 detik
                                                    if self.progress < 1 {
                                                        let selectedDistance = Router.shared.selectedLevelDistance // Ambil jarak yang dipilih dari Router
                                                        self.progress = min(newValue / selectedDistance, 1.0)
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
                                self.viewModel.loadAnimationFromFile(filename: lottieTree)
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
