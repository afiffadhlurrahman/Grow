//
//  ContentView.swift
//  Grow Watch App
//
//  Created by Muhammad Afif Fadhlurrahman on 24/04/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: LottieViewModel = .init()
    
    var body: some View {
        Image(uiImage: viewModel.image)
            .resizable()
            .scaledToFit()
            .onAppear {
                       self.viewModel.loadAnimation(url: URL(string: "https://assets8.lottiefiles.com/packages/lf20_Zz37yH.json")!)
                   }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
