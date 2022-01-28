//
//  Calculator.swift
//  EzCalculator
//
//  Created by Noot Fang on 27/1/22.
//

import Foundation


enum Calculator {
    case left(String)
    case leftOp(left: String, op: CalculatorItem.Op)
    case leftOpRight(left: String, op: CalculatorItem.Op, right: String)
    case error
    
    @discardableResult
    func apply(item: CalculatorItem) -> Calculator {
        switch item {
        case .digit(let num):
            return calc(num: num)
        case .dot:
            return calcDot()
        case .op(let op):
            return calcOp(op: op)
        case .command(let command):
            return calcCommand(command: command)
        }
    }
    
    var output: String {
        let result: String
        switch self {
        case .left(let left): result = left
        case .leftOp(let left, _): result = left
        case .leftOpRight(_, _, let right): result = right
        case .error: return "Error"
        }
        guard let value = Double(result) else {
            return "Error"
        }
        return formatter.string(from: value as NSNumber)!
    }
    
    
}




