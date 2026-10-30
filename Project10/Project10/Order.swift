import Foundation
import Observation

@Observable
class Order: Codable {
  enum CupcakeType: String, Identifiable, CaseIterable, Codable {
    case vanilla
    case strawberry
    case chocolate
    case rainbow
    
    var id: Order.CupcakeType { self }
    
    var value: String { rawValue.localizedCapitalized }
    
    var extraCost: Decimal {
      switch self {
      case .vanilla: 0
      case .strawberry: 0.5
      case .chocolate: 1
      case .rainbow: 1.5
      }
    }
  }
  
  enum CodingKeys: String, CodingKey {
    case _type = "type"
    case _quantity = "quantity"
    case _specialRequestEnabled = "specialRequestEnabled"
    case _extraFrosting = "extraFrosting"
    case _addSprinkles = "addSprinkles"
    case _name = "name"
    case _city = "city"
    case _streetAddress = "streetAddress"
    case _zip = "zip"
  }
  
  var type = CupcakeType.vanilla
  var quantity = 3
  
  var specialRequestEnabled = false {
    didSet {
      if specialRequestEnabled == false {
        extraFrosting = false
        addSprinkles = false
      }
    }
  }
  
  var extraFrosting = false
  var addSprinkles = false
  
  var name = ""
  var streetAddress = ""
  var city = ""
  var zip = ""
  
  var hasValidAddress: Bool {
    if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
      return false
    }
    
    return true
  }
  
  var cost: Decimal {
    // $2 per cake
    var cost = Decimal(quantity) * 2
    
    // complicated cakes cost more
    cost += type.extraCost
    
    // $1/cake for extra frosting
    if extraFrosting {
      cost += Decimal(quantity)
    }
    
    // $0.50/cake for sprinkles
    if addSprinkles {
      cost += Decimal(quantity) / 2
    }
    
    return cost
  }
}
