//
//  ScrollViewRep2.swift
//  ReadNumberGame
//
//  Created by man ching chan on 13/9/2023.
//

import Foundation
import UIKit



class ScrollViewRep : UIScrollView{
    
    
    var slideOffset = 0.0
    
    let imgWidth = 250
    let numOfImage = 20
    let imageMarginMinus = 60
    
    var slideTimer = Timer()
    
    
    override init(frame : CGRect){
        
        super.init(frame: frame)
        drawView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initTimer(){
        print("start timer")
       slideTimer =  Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(slide), userInfo: nil, repeats: true)
        
    }
    
    
    func stopTimer(){
        print("stop timer")
        slideTimer.invalidate()
       
    }
    
    
    @objc func slide(){
        
        slideOffset += 10
        
        if (slideOffset > CGFloat(imgWidth * (numOfImage - 2) - imageMarginMinus * (numOfImage - 2 ))){
            
            self.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        }
        else{
            self.setContentOffset(CGPoint(x: slideOffset, y: 0), animated: true)
        }
        
        
        
        
        
    }
    
    
    
    
    func drawView(){
        


        
        let contentSizeWidth = CGFloat(imgWidth * numOfImage - imageMarginMinus * numOfImage )
        
        self.clipsToBounds = true
        
        print("scrollview height \(self.frame.size.height)")
        self.contentSize = CGSize(width: contentSizeWidth, height: self.frame.size.height)
        self.showsHorizontalScrollIndicator = false
        self.isScrollEnabled = false
        
        
        for i in 1...numOfImage{
            
            let leftOffset = (imgWidth - 60) * (i-1) - 40
            
            let image = UIImage(systemName: "waveform.path")
            
            let imageView = UIImageView(frame: CGRect(x: leftOffset, y: 0, width: imgWidth, height: 200))
            
            imageView.image = image
            
            self.addSubview(imageView)
            
            
        }
        
    }
    
    
}
