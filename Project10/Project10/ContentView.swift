//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Paul Hudson on 09/11/2023.
//

import SwiftUI

struct ContentView: View {
  @State private var order = Order()
  
  var body: some View {
    NavigationStack {
      Form {
        Section("Order Details") {
          Picker("Cupcake Type", selection: $order.type) {
            ForEach(Order.CupcakeType.allCases) {
              Text($0.value)
            }
          }
          
          Stepper(
            "Number of Cupcakes: \(order.quantity)",
            value: $order.quantity,
            in: 1...10
          )
        }
        
        Section("Requests") {
          Toggle("Any Special Request?", isOn: $order.specialRequestEnabled)
          
          if order.specialRequestEnabled {
            Toggle("Add Extra Frosting?", isOn: $order.extraFrosting)
            Toggle("Add Sprinkles?", isOn: $order.addSprinkles)
          }
        }
        
        Section("Delivery") {
          NavigationLink("Delivery details") {
            AddressView(order: order)
          }
        }
      }
      .navigationTitle("Cupcake Corner")
    }
  }
}

#Preview {
  ContentView()
}
