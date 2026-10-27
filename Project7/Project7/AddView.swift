//
//  AddView.swift
//  Project7
//
//  Created by Alex de la Rosa on 11/2/26.
//

import SwiftUI

struct AddView: View {
  @Environment(\.dismiss) var dismiss
  
  @State private var name = ""
  @State private var type: ExpenseType = .personal
  @State private var amount = 0.0
  
  var expenses: Expenses
  
  var body: some View {
    NavigationStack {
      Form {
        TextField("Name", text: $name)
        
        Picker("Type", selection: $type) {
          ForEach(ExpenseType.allCases) {
            Text($0.value)
          }
        }
        
        TextField(
          "Amount",
          value: $amount,
          format: .currency(
            code: Locale.current.currency?.identifier ?? "USD"))
          .keyboardType(.decimalPad)
      }
      .navigationTitle("Add new expense")
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel", role: .cancel) {
            dismiss()
          }
        }
        
        ToolbarItem(placement: .topBarTrailing) {
          Button("Save") {
            let item = ExpenseItem(
              name: name,
              type: type,
              amount: amount)
            
            expenses.items.append(item)
            
            dismiss()
          }
        }
      }
    }
  }
}

#Preview {
  AddView(expenses: Expenses())
}
