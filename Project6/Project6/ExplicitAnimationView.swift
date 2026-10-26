//
//  ExplicitAnimationView.swift
//  Project6
//
//  Created by Alex de la Rosa on 11/2/26.
//

import SwiftUI

struct ExplicitAnimationView: View {
  @State private var animationAmount = 0.0
  
  var body: some View {
    springAnimationView
  }
  
  private var defaultAnimationView: some View {
    Button("Tap Me") {
      withAnimation {
        animationAmount += 360
      }
    }
    .padding(50)
    .background(.red)
    .foregroundStyle(.white)
    .clipShape(.circle)
    .rotation3DEffect(
      .degrees(animationAmount),
      axis: (x: 0, y: 1, z: 0))
  }
  
  private var springAnimationView: some View {
    Button("Tap Me") {
      withAnimation(.spring(duration: 1, bounce: 0.5)) {
        animationAmount += 360
      }
    }
    .padding(50)
    .background(.red)
    .foregroundStyle(.white)
    .clipShape(.circle)
    .rotation3DEffect(
      .degrees(animationAmount),
      axis: (x: 0, y: 1, z: 0))
  }
}

#Preview {
  ExplicitAnimationView()
}
