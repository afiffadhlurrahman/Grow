//
//  ContentView.swift
//  Grow Watch App
//
//  Created by Muhammad Afif Fadhlurrahman on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: LottieViewModel = .init()
    @State private var progress: CGFloat = 0.0 // State untuk mengontrol progress bar
    
    @State private var text: String = ""
    
    var body: some View {
        ZStack {
            Color(red: 0.78, green: 0.92, blue: 0.79).ignoresSafeArea()
            
            // Progress Bar
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
