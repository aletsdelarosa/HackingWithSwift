//
//  ProgrammaticDestinationView.swift
//  Project9
//
//  Created by Alex de la Rosa on 11/4/26.
//

import SwiftUI

struct ProgrammaticDestinationView: View {
  @State private var path = NavigationPath()
  
  var body: some View {
    NavigationStack(path: $path) {
      VStack {
        Text("Hello")
      }
      .navigationTitle("Path binding")
      .navigationDestination(for: Int.self) { selection in
        Text("You selected \(selection)")
      }
      .toolbar {
        Button("Push 556") {
          path.append(556)
        }
        
        Button("Push Hello") {
          path.append("Hello")
        }
      }
    }
  }
}

#Preview {
  ProgrammaticDestinationView()
}
