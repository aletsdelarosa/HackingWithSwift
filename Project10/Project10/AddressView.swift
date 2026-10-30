import SwiftUI

struct AddressView: View {
  @Bindable var order: Order
  
  var body: some View {
    Form {
      Section("Address Details") {
        TextField("Name", text: $order.name)
        TextField("Street Address", text: $order.streetAddress)
        TextField("City", text: $order.city)
        TextField("Zip", text: $order.zip)
      }
      
      Section {
        NavigationLink("Check out") {
          CheckoutView(order: order)
        }
      }
      .disabled(!order.hasValidAddress)
    }
    .navigationTitle("Delivery")
  }
}

#Preview {
  AddressView(order: Order())
}
