//
//  ScrollViewRep.swift
//  ReadNumberGame
//
//  Created by man ching chan on 13/9/2023.
//

import Foundation
import UIKit


class ScrollViewControllerRep : UIViewController{
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        drawScrollView()
    }
        
    
    func drawScrollView(){
        
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 200))
        
        scrollView.contentSize = CGSize(width: 1000, height: 200)
        
        scrollView.backgroundColor = .blue
        
        self.view.addSubview(scrollView)
        
    }
    
    
    
}

