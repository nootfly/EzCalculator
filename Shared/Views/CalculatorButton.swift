//
//  CalculatorButton.swift
//  EzCalculator
//
//  Created by Noot Fang on 27/1/22.
//

import SwiftUI

let scale = UIScreen.main.bounds.width / 414



struct CalculatorButton : View {
    
    
    let item: CalculatorButtonItem

   
    let fontSize: CGFloat = 38
    let action: () -> Void
    
  

    var body: some View {
//        let scale = (verticalSizeClass == .regular ? UIScreen.main.bounds.width / 414 : UIScreen.main.bounds.height / 600)
      
        //print(screenSize)
      
        Button(action: action) {
            Text(item.title)
                .font(.system(size: fontSize * scale))
                .foregroundColor(item.foregroundColor)
                .frame(width: item.size.width * scale, height:  item.size.height * scale)
                .background(Color(item.backgroundColorName))
                .cornerRadius(item.size.height * scale / 2)
                .padding(.horizontal, 8)
        }
        
       
    }
    

    
  
}
