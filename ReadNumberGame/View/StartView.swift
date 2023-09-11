//
//  StartView.swift
//  ReadNumberGame
//
//  Created by man ching chan on 6/9/2023.
//

import SwiftUI

struct StartView: View {
    
    @EnvironmentObject var gameViewModel : GameViewModel
    
    @AppStorage("selectLang") private var appStorageSelectLang =  "en-US"
    @AppStorage("selectLevel") private var appStorageSelectLevel:PlayLevel =  .Beginner
    
    var body: some View {
       
        NavigationStack{
            
            
            VStack{
                
                Text("Listening Game")
                    .fontWeight(.bold)
                    .font(.largeTitle)
                
                
                
                gameConfigView
                
                
                NavigationLink{
                    
                    
                    GameView()
                } label :{
                    
                    Text("Start")
                        .padding()
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
                .background(Color.blue)
                .cornerRadius(20)
                .foregroundColor(.white)
                
                
                
                
            }
            
        }

        
        
        
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
            .environmentObject(GameViewModel())
    }
}


extension StartView{
    
    

    
    
    private var gameConfigView : some View{
         
         VStack(spacing:10){
             Text("Select Language")
                 .font(.title)
            
             Picker("Select Language",selection:$gameViewModel.languageSelect){
                 
                 
                 
                 ForEach(Array(Utils.langs.keys), id: \.self) { key in
                     
                     Text(Utils.langs[key] ?? "")
                     
                 }
                 
                 
             }
             .scaleEffect(1.5)
             .onChange(of: gameViewModel.languageSelect) { newValue in
                 print("on change new lang \(newValue)")
                 appStorageSelectLang = newValue
                 Singleton.shared.selectedLang = newValue
             }
             
             Rectangle()
                 .frame(height:14)
                 .background(Color.clear)
                 .foregroundColor(.clear)
             
             
             Text("Select Level")
                 .font(.title)
             Picker("Select Level",selection:$gameViewModel.levelSelect){
                 
                 ForEach(PlayLevel.allCases, id:\.self){ option in
                     Text(String(describing: option))
                 }
             }
             .scaleEffect(1.5)
             .onChange(of: gameViewModel.levelSelect) { newValue in
                 
                 print(newValue)
                 appStorageSelectLevel = newValue
             }
             
             
         }
         
         
     }

    
    
}
