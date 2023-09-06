//
//  GameView.swift
//  ReadNumberGame
//
//  Created by man ching chan on 6/9/2023.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gameViewModel : GameViewModel
    
    var body: some View {
        VStack{
            
            if (!gameViewModel.isGameStart){
                
                Text("\(gameViewModel.startGameCounter)")
                    .font(.system(size: 200))
                    .fontWeight(.bold)
            }
            

            
            
        }
        .onAppear{
            
            gameViewModel.fireStartGameTimer()
        }
        .onChange(of: gameViewModel.isGameStart) { newValue in
            print(gameViewModel.isGameStart)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject({()-> GameViewModel in
                let envObj = GameViewModel()
                envObj.languageSelect = "zh-HK"
                envObj.levelSelect = .Medium
                return envObj
                
            }())
    
    }
}
