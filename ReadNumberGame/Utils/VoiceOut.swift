//
//  VoiceOut.swift
//  SpeakingTraining
//
//  Created by man ching chan on 10/7/2023.
//

import Foundation
import AVFoundation





class VoiceOut : AVSpeechSynthesizer{

    
    var synth = AVSpeechSynthesizer()
    var completionHandler : ((_ isFinished:Bool)->()) = { _ in }
    
    
   
  
    
   override init(){
       
       super.init()
        synth.delegate = self
        
    }
    

    
    func readNumberWithCompletionHandler(lang:String,speech:String,completion:@escaping ((_ isFinihsed:Bool)->())){
        
            
        completionHandler =  completion
        


        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setCategory(.playAndRecord, mode: .videoRecording, options: [.defaultToSpeaker,.allowAirPlay,.allowBluetoothA2DP])
          // try? audioSession.setMode(AVAudioSession.Mode.spokenAudio)
        try? audioSession.setActive(true)
        
        let utterance = AVSpeechUtterance(string:speech)
      
        utterance.pitchMultiplier = 1.0
        utterance.rate = 0.5
        utterance.voice = AVSpeechSynthesisVoice(language: lang)
        utterance.volume = 0.5
   
        
        print(utterance.speechString)
        
 
      
        self.synth.speak(utterance)
        
    }
    
    
    
    
    func stop(){
        
        synth.stopSpeaking(at: .immediate)
        

        
        
    }
    
    
    
    
}

extension VoiceOut:AVSpeechSynthesizerDelegate{
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("did start ")

        
   
        
       
    }
    
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        


            completionHandler(true)
        
       
    }
    
    
}
