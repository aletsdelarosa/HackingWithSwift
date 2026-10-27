//
//  ExpenseItem.swift
//  Project7
//
//  Created by Alex de la Rosa on 11/2/26.
//
import Foundation

enum ExpenseType: String, Codable, CaseIterable, Identifiable {
  case personal
  case business
  
  var value: String { rawValue.capitalized }
  
  var id: ExpenseType { self }
}

struct ExpenseItem: Identifiable, Codable {
  var id = UUID()
  let name: String
  let type: ExpenseType
  let amount: Double
}
