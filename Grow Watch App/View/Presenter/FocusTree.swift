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
    
    var body: some View {
        TabView (selection: $tabViewSelection) {
            Button(action: {
                Router.shared.path.removeAll()
            }, label: {
                Image(systemName: "stop.fill")
            })
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .tag(0)
            
            Button (action: {
                Router.shared.path.append(.taskComplete)
            }, label: {
                Image(uiImage: viewModel.image)
                    .resizable()
                    .scaledToFit()
                    .onAppear {
                               self.viewModel.loadAnimation(url: URL(string: "https://assets8.lottiefiles.com/packages/lf20_Zz37yH.json")!)
                           }
                    
            }).tag(1)
            
        }
        .navigationBarBackButtonHidden()
        
    }
}

#Preview {
    NavigationStack {
        FocusTree()
    }
}
