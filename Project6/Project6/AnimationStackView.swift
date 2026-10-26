//
//  AnimationStackView.swift
//  Project6
//
//  Created by Alex de la Rosa on 11/2/26.
//

import SwiftUI

struct AnimationStackView: View {
  @State private var enabled = false
  
  var body: some View {
    nilAnimationView
  }
  
  private var multipleAnimationsView: some View {
    Button("Tap Me") {
      enabled.toggle()
    }
    .frame(width: 200, height: 200)
    .background(enabled ? .blue : .red)
    .animation(nil, value: enabled)
    .foregroundStyle(.white)
    .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
    .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
  }
  
  private var nilAnimationView: some View {
    Button("Tap Me") {
      enabled.toggle()
    }
    .frame(width: 200, height: 200)
    .background(enabled ? .blue : .red)
    .animation(nil, value: enabled)
    .foregroundStyle(.white)
    .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
    .animation(.spring(duration: 1, bounce: 0.6), value: enabled)
  }
}

#Preview {
  AnimationStackView()
}
