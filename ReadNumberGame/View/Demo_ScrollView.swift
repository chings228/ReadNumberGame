//
//  Demo_ScrollView.swift
//  ReadNumberGame
//
//  Created by man ching chan on 14/9/2023.
//

import SwiftUI

struct Demo_ScrollView: View {
    var body: some View {
       
        TabView(){
            
                
                ForEach(0..<10){i in
                    
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hue:Double(i)/10,saturation: 1,brightness: 1).gradient)
//                        .frame(width:300,height:100)
                    
                    
                    
                }
                
                
            
            
            
            
            
        }

        .tabViewStyle(PageTabViewStyle())
        
        
        
        
    }
}

struct Demo_ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        Demo_ScrollView()
    }
}
