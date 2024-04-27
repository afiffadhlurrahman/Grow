//
//  RouterView.swift
//  todo
//
//  Created by Alfadli Maulana Siddik on 19/04/24.
//

import SwiftUI

class Router: ObservableObject {
    enum Destination: String, Hashable {
        case focusTree, taskComplete
    }
    
    @Published var path: [Destination] = []
    
    static let shared: Router = Router()
}
