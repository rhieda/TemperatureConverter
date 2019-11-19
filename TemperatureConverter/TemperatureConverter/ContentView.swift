//
//  ContentView.swift
//  TemperatureConverter
//
//  Created by Rafael  Hieda on 11/18/19.
//  Copyright © 2019 Rafael Hieda. All rights reserved.
//

import SwiftUI

enum Types : Int {
    case Celsius
    case Fahrenheit
    case Kelvin
}

struct ContentView: View {
    @State private var inputValue : String = "0"
    private let typesArray = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var inputSelectedIndex : Int = 0
    @State private var outputSelectedIndex : Int = 0
    
    private var convertedValue : Double {
        if let inputType = Types(rawValue: inputSelectedIndex), let outputType = Types(rawValue: outputSelectedIndex) {
            return calculate(inputType: inputType, outputType: outputType)
        } else {
            fatalError("Invalid values for segmented control")
        }
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Inform input value: ")){
                    TextField("Value for",text: $inputValue).keyboardType(.decimalPad)
                    Picker("Select input type:", selection: $inputSelectedIndex){
                        ForEach(0..<typesArray.count){
                            Text(self.typesArray[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output value")) {
                    Picker("Select input type:", selection: $outputSelectedIndex){
                        ForEach(0..<typesArray.count){
                            Text(self.typesArray[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    Text("\(convertedValue)")
                }
            }.navigationBarTitle("Temperature Converter", displayMode: .inline)
        }
    }
}

extension ContentView {
    
    func calculate(inputType : Types, outputType : Types) -> Double{
        let numericInput = Double(inputValue) ?? 0
        
        if(inputType == .Celsius && outputType == .Fahrenheit){
            let fahrenheit = (numericInput * 1.8) + 32
            return fahrenheit
        }
        else if(inputType == .Celsius && outputType == .Kelvin) {
            let kelvin = numericInput + 273.15
            return kelvin
        }
        else if (inputType == .Fahrenheit && outputType == .Celsius) {
            let celsius = (numericInput - 32) * (5/9)
            return celsius
        }
        else if (inputType == .Fahrenheit && outputType == .Kelvin) {
            let kelvin = (numericInput - 32) * (5/9) + 273.15
            return kelvin
        }
        else if (inputType == .Kelvin && outputType == .Celsius) {
            let celsius = (numericInput - 273.15)
            return celsius
        }
        else if (inputType == .Kelvin && outputType == .Fahrenheit) {
            let fahrenheit = (numericInput - 273.15) * (9/5) + 32
            return fahrenheit
        }
        else if(inputType == outputType) {
            return Double(inputValue) ?? 0
        }
        return 0.0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
