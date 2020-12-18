//
//  ContentView.swift
//  UnitConverter
//
//  Created by Austin Hill on 12/17/20.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 1
    
    let lengthDictionary = [
        "millimeters" :  UnitLength.millimeters ,
        "centimeters" :  UnitLength.centimeters ,
        "decimeters" : UnitLength.decimeters ,
        "meters" :  UnitLength.meters,
        "kilometers" : UnitLength.kilometers,
        "inches" : UnitLength.inches,
        "feet" : UnitLength.feet,
        "yards" : UnitLength.yards,
        "miles" : UnitLength.miles
    ]
    
    
    var convertedOutput: String {
        let inputValue = Double(self.inputValue) ?? 0
        let inputName = Array(lengthDictionary.keys)[inputUnit]
        let outputName = Array(lengthDictionary.keys)[outputUnit]
        
        let unitsInput = Measurement(value: inputValue, unit: lengthDictionary[inputName]!)
        let unitsOutput = unitsInput.converted(to: lengthDictionary[outputName]!)
        
        return "\(unitsOutput)"

    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Unit Value", text: $inputValue)
                    .keyboardType(.decimalPad)
                }
                Section {
                    Picker("Base Unit", selection: $inputUnit) {
                        ForEach(0 ..< Array(lengthDictionary.keys).count ) {
                            Text("\(Array(self.lengthDictionary.keys)[$0])")
                        }
                        
                    }
                    Picker("Converted Unit", selection: $outputUnit) {
                        ForEach(0 ..< Array(lengthDictionary.keys).count ) {
                            Text("\(Array(self.lengthDictionary.keys)[$0])")
                        }
                    }
                }
                Section (header: Text("Grand Total")){
                    Text("\(convertedOutput)")
                }
                    
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
