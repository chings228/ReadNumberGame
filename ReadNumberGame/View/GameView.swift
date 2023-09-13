//
//  GameView.swift
//  ReadNumberGame
//
//  Created by man ching chan on 6/9/2023.
//

import SwiftUI

let soundWaveScrollView = Singleton.shared.scrollView

struct GameView: View {
    
   
    
    @EnvironmentObject var gameViewModel : GameViewModel
    
    @State private var isAnimated = false
    
    var screenWidth = UIScreen.main.bounds.size.width
    
    let keyboardCols = [GridItem( spacing: 0),GridItem(spacing: 0),GridItem(spacing: 0),GridItem(spacing: 0)]
    
    
   
    
    var keyboardSymbol = ["1","2","3","clear.fill","4","5","6","delete.backward.fill","7","8","9","0"]
    
    
    var body: some View {
        VStack{
            
            Spacer()
            
            if (!gameViewModel.isGameStart){

                Text("\(gameViewModel.startGameCounter)")
                    .font(.system(size: 200))
                    .fontWeight(.bold)
            }
           
            else {
               
                
                if let randomNumber = gameViewModel.randomNumber{
                    
                    
                    if (gameViewModel.isShowResult){
                        
                        Text("\(randomNumber)")
                            .font(.system(size: 200))
                            .fontWeight(.bold)
                            .minimumScaleFactor(0.2)
                    }
                    
                    else{
                        
                       
                        ScrollViewBridge()
                            .frame(width:UIScreen.main.bounds.width, height:200)
                        
                        
                    }

                }

            }
            Spacer()
            keyboardView
            
            
            
            
        }
        .ignoresSafeArea()
        .onAppear{
            
            gameViewModel.fireStartGameTimer()
        }
        .onChange(of: gameViewModel.isGameStart) { newValue in
            print(gameViewModel.isGameStart)
        }
        .onChange(of: gameViewModel.isSpeakingNumber) { isRead in
            if isRead{
                print("start read")
                soundWaveScrollView.initTimer()
            }
            else{
                print("end read")
                soundWaveScrollView.stopTimer()
            }
        }
    }
}


extension  GameView {
    
    

    var keyboardView : some View {
        
        
        
        
        VStack{
            LazyVGrid(columns: keyboardCols,spacing: 0) {
                
                ForEach(keyboardSymbol, id: \.self){ symbol in
                    
                    
                    Button() {
                        print(symbol)
                    } label: {
                        
                        if let _ = Int(symbol){
                            Text(symbol)
                                .font(.title)
                                .frame(width:screenWidth/4, height:screenWidth/4)
                                .border(.black,width:0.5)
                                .fontWeight(.bold)
                            
                        }
                        
                        else{
                            Image(systemName: symbol)
                                .scaleEffect(1.5)
                                .frame(width:screenWidth/4, height:screenWidth/4)
                                .border(.black,width:0.5)
                                .fontWeight(.bold)
                               
                        }

                    }


                }
            }
            
            
            
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





struct ScrollViewBridge : UIViewRepresentable{
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
   
   
    
    func makeUIView(context: Context) -> some UIView {
        
        
        return soundWaveScrollView
    }
    

    
    
    
}
