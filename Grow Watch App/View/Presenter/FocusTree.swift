//
//  FocusTree.swift
//  Grow Watch App
//
//  Created by Alfadli Maulana Siddik on 26/04/24.
//

import SwiftUI

struct FocusTree: View {
    @State var lottieTreeEasy: String = "TreeEasy"
    @State var lottieTreeMedium: String = "TreeMedium"
    @State var lottieTreeHard: String = "TreeHard"
    
    
    @State var lottieRunningBoy: String = "Running Boy"

    @ObservedObject var viewModel: LottieViewModel = .init()
    @ObservedObject var viewModelTemplate: TemplateLottieViewModel = .init()
    @EnvironmentObject var workoutManager: WorkoutManager
    
    @State private var progress: CGFloat = 0.0 // State untuk mengontrol progress bar
    
    @State private var selection: Tab = .tree
    
    @State private var trigger: Trigger? = Trigger(id: "showSheet")

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
                                .onChange(of: workoutManager.distance) { oldValue, newValue in
                                    withAnimation(.linear(duration: 1)) { // Mengubah durasi menjadi 2 detik
                                        if self.progress < 1 {
                                            let selectedDistance = Router.shared.selectedLevelDistance // Ambil jarak yang dipilih dari Router
                                            self.progress = min(newValue / selectedDistance, 1.0)
                                        } else {
                                            Router.shared.selectedLevelDistance = 0
                                            let selectedLevel = Router.shared.selectedLevel
                                            
                                            Router.shared.obtainedTrees.append("Tree \(selectedLevel.capitalized)")
                                            
                                            WKInterfaceDevice.current().play(.notification)
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
                                self.viewModel.speed = 1
                                self.viewModel.lastFrame = 45
                                self.viewModel.workoutManager = workoutManager
                                
                                switch Router.shared.selectedLevel {
                                case "easy":
                                    self.viewModel.loadAnimationFromFile(filename: lottieTreeEasy)
                                case "medium":
                                    self.viewModel.loadAnimationFromFile(filename: lottieTreeMedium)
                                case "hard":
                                    self.viewModel.loadAnimationFromFile(filename: lottieTreeHard)
                                default:
                                    break
                                }
                                                                
                            }
                    }
                })
            }
            .tag(Tab.tree)
                .buttonStyle(.borderless)
            
        }
        .navigationBarBackButtonHidden()
        .onAppear{
            self.trigger = Trigger(id: "showSheet")
        }
        .sheet(item: $trigger) { detail in
            ScrollView{
                VStack(alignment: .center, spacing: 5) {
                    
                    HStack {
                        Image("Tree Start")
                            .resizable()
                            .scaledToFit()
                        Image(systemName: "arrow.down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundStyle(Color.white)
                    }
                    
                    HStack {
                        // Animasi Lottie
                        Image(uiImage: viewModelTemplate.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .onAppear {
                                self.viewModelTemplate.loadAnimationFromFile(filename: lottieRunningBoy)
                            }
                        
                        Image(systemName: "arrow.down")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundStyle(Color.white)
                    }
                    
                    Image("Tree On Progress")
                }
            }
            
            .onTapGesture {
                trigger = nil
            }
        }
        
    }
    
}

struct Trigger: Identifiable {
    var id: String
}

#Preview {
    NavigationStack {
        FocusTree()
    }
}
