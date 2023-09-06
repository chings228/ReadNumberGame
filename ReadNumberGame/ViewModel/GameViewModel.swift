//
//  ViewModel.swift
//  ReadNumberGame
//
//  Created by man ching chan on 6/9/2023.
//

import Foundation



class GameViewModel : ObservableObject{
    
    @Published var languageSelect : String = "en-US"
    
    @Published var levelSelect : PlayLevel = .Beginner
    
    @Published var randomNumber : Int = 0
    
     @Published var startGameCounter : Int = 3
    
    @Published var isGameStart = false
    
    private var startGameTimer = Timer()
    
    private var gamePlayTimer = Timer()
    

    func generateRandom(){
        
        if (levelSelect == .Beginner){
            
            
            randomNumber  = Int.random(in: 11...20)
            
            
        }
        else if (levelSelect == .Medium){
            
            randomNumber = Int.random(in: 20...999)
        }
        else if (levelSelect == .Difficult){
            
            
            randomNumber = Int.random(in: 1000...10000)
        }
        
        print(randomNumber)
        print(Utils.convertToNumberReading(num: randomNumber, locale: languageSelect))
        
    }
    
    
    func fireStartGameTimer(){
        
        startGameTimer =  Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(calStartGameTimerCounter), userInfo: nil, repeats: true)
        
    }
    
    

    
    @objc func calStartGameTimerCounter(){
        
        startGameCounter -= 1
        
        if startGameCounter == 0{
            startGameTimer.invalidate()
            isGameStart = true
            
        }
        
        
    }
    
    
    func fireGamePlayTimer(){
        
        
        
    }
}
