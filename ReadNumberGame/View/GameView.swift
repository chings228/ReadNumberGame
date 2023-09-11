//
//  GameView.swift
//  ReadNumberGame
//
//  Created by man ching chan on 6/9/2023.
//

import SwiftUI

struct GameView: View {
    
    @EnvironmentObject var gameViewModel : GameViewModel
    
    @State private var isAnimated = false
    
    var body: some View {
        VStack{
            
            Spacer()
            
            if (!gameViewModel.isGameStart){
                
                Text("\(gameViewModel.startGameCounter)")
                    .font(.system(size: 200))
                    .fontWeight(.bold)
            }
            else{
                
                if let randomNumber = gameViewModel.randomNumber{
                    
                    
                    if (gameViewModel.isShowResult){
                        
                        Text("\(randomNumber)")
                            .font(.system(size: 200))
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.2)
                    }
                    
                    else{
                        
                        Image(systemName: "waveform.path")
                            .resizable()
                            .padding(.horizontal)
                            .scaledToFit()
                            .scaleEffect(x: isAnimated ? 0.8: 1 , y :isAnimated ? 0.8 : 1.2)
                            .animation(.easeIn(duration: 0.4).repeatForever(), value: isAnimated)
                            
                            
                        
                    }
                    


                    
                }
                
                
                
                
                
            }
            
            Spacer()
            
            keyboardView
            
            
            
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now()+2){
                isAnimated = true
            }
            
            //gameViewModel.fireStartGameTimer()
        }
        .onChange(of: gameViewModel.isGameStart) { newValue in
            print(gameViewModel.isGameStart)
        }
    }
}


extension  GameView {

    var keyboardView : some View {
        
        
        
        
        VStack{
            
            Text("Hello")
            
            
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
