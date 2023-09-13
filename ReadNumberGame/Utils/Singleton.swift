//
//  Singleton.swift
//  ReadNumberGame
//
//  Created by man ching chan on 6/9/2023.
//

import Foundation
import UIKit


class Singleton{
    
    static let shared = Singleton()
    
    var selectedLang = "en-US"
    
    private init(){}
    
    let scrollView = ScrollViewRep(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
    
    
}
