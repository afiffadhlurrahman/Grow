//
//  HomeButton.swift
//  Grow Watch App
//
//  Created by Muhammad Afif Fadhlurrahman on 26/04/24.
//

import SwiftUI

struct HomeButton: View {
    var body: some View {
        Button(action: {
            Router.shared.path.removeAll()
        }, label: {
            Image(systemName: "house.fill")
                .foregroundColor(.white)
        })
        .padding()
        .background(Color(red: 0.44, green: 0.69, blue: 0.52))
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
    
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton()
    }
}
