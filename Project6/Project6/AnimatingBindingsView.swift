//
//  AnimatingBindingsView.swift
//  Project6
//
//  Created by Alex de la Rosa on 11/2/26.
//

import SwiftUI

struct AnimatingBindingsView: View {
  @State private var animationAmount = 1.0
  
  var body: some View {
    Stepper("Scale amount",
            value: $animationAmount.animation(),
            in: 1...10)
    
    Spacer()
    
    Button("Tap Me") {
      animationAmount += 1
    }
    .padding(40)
    .background(.red)
    .foregroundStyle(.white)
    .clipShape(.circle)
    .scaleEffect(animationAmount)
  }
}

#Preview {
  AnimatingBindingsView()
}
