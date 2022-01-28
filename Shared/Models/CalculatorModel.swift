//
//  CalculatorModel.swift
//  EzCalculator
//
//  Created by Noot Fang on 27/1/22.
//

import SwiftUI
import Combine


protocol CalculatorProtocol {
    func calc(_ item: CalculatorItem)
}

class CalculatorModel: ObservableObject, CalculatorProtocol {

    @Published var calculator: Calculator = .left("0")
   
    func calc(_ item: CalculatorItem) {
        calculator = calculator.apply(item: item)
    
    }

   
  
}

