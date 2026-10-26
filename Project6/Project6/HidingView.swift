//
//  HidingView.swift
//  Project6
//
//  Created by Alex de la Rosa on 11/2/26.
//

import SwiftUI

struct HidingView: View {
  @State private var isShowingRed = false
  
  var body: some View {
    VStack {
      Button("Tap Me") {
        withAnimation {
          isShowingRed.toggle()
        }
      }
      
      if isShowingRed {
        Rectangle()
          .fill(.red)
          .frame(width: 200, height: 200)
          .transition(
            .asymmetric(insertion: .scale, removal: .opacity))
      }
    }
  }
}

#Preview {
  HidingView()
}
