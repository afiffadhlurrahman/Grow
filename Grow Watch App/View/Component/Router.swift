//
//  RouterView.swift
//  todo
//
//  Created by Alfadli Maulana Siddik on 19/04/24.
//

import SwiftUI

class Router: ObservableObject {
    var selectedLevelDistance: Double = 0
    var selectedLevel: String = "easy"
    
    // List of obtained trees
    @Published var obtainedTrees: [String] = []
    
    
    
    enum Destination: String, Hashable {
        case focusTree, taskComplete, levelSelect
    }
    
    @Published var path: [Destination] = []
    
    static let shared: Router = Router()
}
