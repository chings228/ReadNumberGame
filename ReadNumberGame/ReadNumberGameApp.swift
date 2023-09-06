//
//  ReadNumberGameApp.swift
//  ReadNumberGame
//
//  Created by man ching chan on 5/9/2023.
//

import SwiftUI

@main
struct ReadNumberGameApp: App {
    
    @StateObject var vm = GameViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(vm)
        }
    }
}
