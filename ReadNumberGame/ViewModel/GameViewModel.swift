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
    
    @Published var randomNumber : Int!
    
    @Published var startGameCounter : Int = Utils.startCounterVal
    
    @Published var gamePlayCounter : Int = 0
    
    @Published var isGameStart = false
    
    @Published var isShowResult = false
    
    @Published var isSpeakingNumber = false
    
    private var startGameTimer = Timer()
    
    private var gamePlayTimer = Timer()
    
    var numOfQuestion = Utils.numOfQuestionVal
    
    
    @Published var answer = ""
    
    
    
    
    func inputNumber(_ symbol : String){
        print(symbol)
        
        if let keyval = Int(symbol) {
            
           
            
            answer.append(symbol)
            
            let answerval = Int(symbol)!
            
            print(answerval)
        }
        else{
            
            
            
            if (symbol ==  "delete.backward.fill"){
                
                
                if (answer.count > 1){
                    
                    answer = 
                }
                
                
            }else  if (symbol ==  " clear.fill"){
                
                answer = ""
            }
            
           
            
            
        }
        

        
        
        
    }
    
    
   
    

    func generateRandom(){
        
        print(levelSelect)
        
        if (levelSelect == .Beginner){
            
            
            randomNumber  = Int.random(in: 1...20)
            
            
        }
        else if (levelSelect == .Medium){
            
            randomNumber = Int.random(in: 20...999)
        }
        else if (levelSelect == .Difficult){
            
            
            randomNumber = Int.random(in: 1000...10000)
        }
        
        print(randomNumber!)
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
            
            startNewGame()
            
        }
        
        
    }
    
    
    func startNewGame(){
        
        isShowResult = false
        
        numOfQuestion -= 1
        print("num of games left \(numOfQuestion)")
        
        if (numOfQuestion == 0){
            print("end game")
        }
        else{
            self.gamePlayCounter = Utils.gameWaitAnswerTimerCounterVal
            
            generateRandom()
            
            // read number
            
            
            
            
            let voice = VoiceOut()
            
            print("random number \(randomNumber!)")
            
            isSpeakingNumber = true
            
            voice.readNumberWithCompletionHandler(lang: "en-US", speech: "\(randomNumber!)") {[weak self] isFinihsed in
                if (isFinihsed){
                    
                    print("finish read ")
                    
                    self?.fireGamePlayTimer()
                    
                    self?.isSpeakingNumber = false
                    
                }
            }
            
        }
        

        
    }
    
    
    func fireGamePlayTimer(){
        
        print("start countdown")
        
        gamePlayTimer =  Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(calGamePlayTimerCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func calGamePlayTimerCounter(){
        
        gamePlayCounter -= 1
        print(gamePlayCounter)
        
        if (gamePlayCounter == 0){
            
            print("game play end")
            gamePlayTimer.invalidate()
            isShowResult = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                
                print("next question ")
                
                self.startNewGame()
               
            }
            
            
        }
        
    }
    
    

    
}
