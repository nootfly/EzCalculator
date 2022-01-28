//
//  CalculatorView.swift
//  EzCalculator
//
//  Created by Noot Fang on 27/1/22.
//


import SwiftUI
import Combine


struct CalculatorView: View {
    @EnvironmentObject var model: CalculatorModel
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    let data: [CalculatorButtonItem] = [
        .command(.clear), .command(.flip),
        .command(.percent), .op(.divide),
        .digit(7), .digit(8), .digit(9), .op(.multiply),
        .digit(4), .digit(5), .digit(6), .op(.minus),
        .digit(1), .digit(2), .digit(3), .op(.plus),
        
        
    ]
    let lastRowData : [CalculatorButtonItem] = [ .digit(0), .dot, .op(.equal)]
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    let lastRowcolumns = [
        GridItem(.flexible(), spacing: 200, alignment: .leading),
        GridItem(.flexible(),   alignment: .center),
        GridItem(.flexible(), alignment: .trailing),
        
    ]
    
    
    var calculatorButton : some View{
        VStack {
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(data, id: \.self) { item in
                    CalculatorButton(item: item) {
                        self.model.apply(item)
                    }
                }
            }
            LazyVGrid(columns: lastRowcolumns, spacing: 8) {
                ForEach(lastRowData, id: \.self) { item in
                    CalculatorButton(item: item) {
                        self.model.apply(item)
                    }
                }
            }
        }
    }
    
    var displayView: some View {
        Text(model.calculator.output)
            .font(.system(size: 76))
            .minimumScaleFactor(0.5)
            .padding(.horizontal, 24)
            .lineLimit(1)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                alignment: .trailing)
    }
    
    var body: some View {
        
        VStack {
            displayView
            
            calculatorButton
            Spacer()
        }.padding()

    }
}
