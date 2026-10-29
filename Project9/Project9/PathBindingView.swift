//
//  PathBindingView.swift
//  Project9
//
//  Created by Alex de la Rosa on 11/4/26.
//

import SwiftUI

struct PathBindingView: View {
  @State private var path = [Int]()
  
  var body: some View {
    NavigationStack(path: $path) {
      VStack {
        Button("Show 32") {
          path = [32]
        }
        
        Button("Show 64") {
          path.append(64)
        }
        
        Button("Show 32 then 64") {
          path = [32, 64]
        }
      }
      .navigationTitle("Path binding")
      .navigationDestination(for: Int.self) { selection in
        Text("You selected \(selection)")
      }
    }
  }
}

#Preview {
  PathBindingView()
}
