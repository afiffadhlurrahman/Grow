//
//  HomeButton.swift
//  Grow Watch App
//
//  Created by Muhammad Afif Fadhlurrahman on 26/04/24.
//

import SwiftUI

struct HomeButton: View {
    var body: some View {
        NavigationLink(destination: TesterView()) {
            ZStack {
                Circle().fill(Color(red: 0.44, green: 0.69, blue: 0.52)).frame(width: 50)
                Image(systemName: "house.fill")
                    .foregroundColor(.white)
            }
        }
    }
    
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton()
    }
}
