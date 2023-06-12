//
//  ContentView.swift
//  WeSplit
//
//  Created by Pawan's Mac on 14/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeoples = 2
    @State private var tipPercentage = 20
    @State private var useRedText = false
    @FocusState private var amountIsFocused: Bool
    
    
    
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeoples + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue =  checkAmount/100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson =  grandTotal / peopleCount
        
        return amountPerPerson
    }
    var totalAmount: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue =  checkAmount/100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    var body: some View {
        NavigationView{
            
            Form{
                Section{
                    TextField("Amount",value:$checkAmount,format:
                            .currency(code: Locale.current.currency?.identifier ?? "IND"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                Picker("Number of people", selection: $numberOfPeoples){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    
                }
                Section{
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0..<101){
                            Text($0, format:.percent)
                        }
                    }
                    
                }header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section{
                    Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "IND"))
                }header:{
                    Text("Amount per Person")
                }
                Section{
                    Text(totalAmount,format:.currency(code: Locale.current.currency?.identifier ?? "IND"))
                }header: {
                    Text("Total Amount of Check")
                }
                
            }
            .navigationTitle("WeSplit")
            .toolbar{
                ToolbarItem(placement:.keyboard){
                    Spacer()
                    
                    Button("Done"){
                        amountIsFocused = false
                    }
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
