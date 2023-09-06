//
//  Singleton.swift
//  ReadNumberGame
//
//  Created by man ching chan on 6/9/2023.
//

import Foundation


class Singleton{
    
    static let shared = Singleton()
    
    var selectedLang = "en-US"
    
    private init(){}
    
    
}
