//
//  FocusTree.swift
//  Grow Watch App
//
//  Created by Alfadli Maulana Siddik on 26/04/24.
//

import SwiftUI

struct FocusTree: View {
    @ObservedObject var viewModel: LottieViewModel = .init()
    @State public var tabViewSelection = 1
    @State private var progress: CGFloat = 0.0 // State untuk mengontrol progress bar
    
    var body: some View {
        TabView (selection: $tabViewSelection) {
            Button(action: {
                Router.shared.path.removeAll()
            }, label: {
                Image(systemName: "stop.fill")
                    .foregroundColor(Color(red: 0.95, green: 0.88, blue: 0.82))
            })
            .background(Color(red: 0.51, green: 0.73, blue: 0.58))
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .tag(0)
            
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
                                        .onAppear {
                                            // Start animating the progress bar
                                            withAnimation(.linear(duration: 3)) { // Mengubah durasi menjadi 2 detik
                                                self.progress = 1.0
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
                            self.viewModel.speed = 0.5
                            self.viewModel.loadAnimation(url: URL(string: "https://lottie.host/892ef239-5e69-4385-9b46-a1d56de77971/iLbrJpNZu3.json")!)

                        }
                    
                }

                            
                    
            }).tag(1)
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
