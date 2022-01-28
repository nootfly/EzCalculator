//
//  CalculatorModel.swift
//  EzCalculator
//
//  Created by Noot Fang on 27/1/22.
//

import SwiftUI
import Combine

class CalculatorModel: ObservableObject {

    @Published var calculator: Calculator = .left("0")
   
    func apply(_ item: CalculatorButtonItem) {
        calculator = calculator.apply(item: item)
    
    }

   
  
}

