//
//  Utils.swift
//  SpeakingTraining
//
//  Created by man ching chan on 21/7/2023.
//

import Foundation


struct Utils{
    
    static let langs  = [
        "en-US": "English",
        "zh-HK":"Cantonese",
        "th-TH":"Thai",
        "ja-JP":"Japanese",
        "de-DE":"German",
        "zh-CN":"Mandarin",
        "ko-KR":"Korean",
        "fr-FR":"French",
        "es-ES":"Spanish"
    ]
    


    static let gameWaitAnswerTimerCounterVal : Int = 4 // time to wait for answer input 
    static let startCounterVal : Int = 1   // time wait to start game
    static let numOfQuestionVal : Int = 5   // total number of guess per game
    static let idleTimerCounterVal : Int = 2 // time pause between every game
    
    
    static func convertToNumberReading(num:Int,locale:String)->String{
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        formatter.locale = Locale(identifier: locale)
        
        let text = formatter.string(from:num as NSNumber)
        
        guard let text = text else {return ""}
        
        return text
        
        
    }
    
}


enum PlayLevel:String,CaseIterable{

    case Beginner
    case Medium
    case Difficult

}

extension String {
    var isNumber: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
}



