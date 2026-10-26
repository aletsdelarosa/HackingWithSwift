//
//  ImplicitAnimationView.swift
//  Project6
//
//  Created by Alex de la Rosa on 10/28/26.
//

import SwiftUI

struct ImplicitAnimationView: View {
  @State private var defaultAnimationAmount = 1.0
  @State private var linearAnimationAmount = 1.0
  @State private var springAnimationAmount = 1.0
  @State private var delayedAnimationAmount = 1.0
  @State private var repeatedAnimationAmount = 1.0
  
  var body: some View {
    defaultAnimationView
  }
  
  private var defaultAnimationView: some View {
    Button("Default Animation") {
      defaultAnimationAmount += 1
    }
    .padding(50)
    .background(.red)
    .foregroundStyle(.white)
    .clipShape(.circle)
    .scaleEffect(defaultAnimationAmount)
    .animation(.default, value: defaultAnimationAmount)
  }
  
  private var linearAnimationView: some View {
    Button("Linear Animation") {
      linearAnimationAmount += 1
    }
    .padding(50)
    .background(.red)
    .foregroundStyle(.white)
    .clipShape(.circle)
    .scaleEffect(linearAnimationAmount)
    .animation(.linear, value: linearAnimationAmount)
  }
  
  private var springAnimationView: some View {
    Button("Spring Animation") {
      springAnimationAmount += 1
    }
    .padding(50)
    .background(.red)
    .foregroundStyle(.white)
    .clipShape(.circle)
    .scaleEffect(springAnimationAmount)
    .animation(.spring(duration: 1, bounce: 0.9), value: springAnimationAmount)
  }
  
  private var delayedAnimationView: some View {
    Button("Delayed Animation") {
      delayedAnimationAmount += 1
    }
    .padding(50)
    .background(.red)
    .foregroundStyle(.white)
    .clipShape(.circle)
    .scaleEffect(delayedAnimationAmount)
    .animation(
      .easeInOut(duration: 2)
      .delay(1),
      value: delayedAnimationAmount)
  }
  
  private var repeatedAnimationView: some View {
    Button("Repeated Animation") {
      repeatedAnimationAmount += 1
    }
    .padding(50)
    .background(.red)
    .foregroundStyle(.white)
    .clipShape(.circle)
    .scaleEffect(repeatedAnimationAmount)
    .animation(
      .easeInOut(duration: 1)
      .repeatCount(3, autoreverses: true),
      value: repeatedAnimationAmount)
  }
  
  
}

#Preview {
  ImplicitAnimationView()
}
