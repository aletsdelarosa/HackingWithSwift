//
//  ReturnToRootView.swift
//  Project9
//
//  Created by Alex de la Rosa on 11/4/26.
//

import SwiftUI

struct ReturnToRootView: View {
  @State private var path = [Int]()
  
  // @State private var path = NavigationPath()
  
  var body: some View {
    NavigationStack(path: $path) {
      DetailView(path: $path, number: 0)
        .navigationDestination(for: Int.self) { i in
          DetailView(path: $path, number: i)
        }
    }
  }
}

struct DetailView: View {
  @Binding var path: [Int]
  
  var number: Int
  
  var body: some View {
    NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
      .navigationTitle("Number: \(number)")
      .toolbar {
        Button("Home") {
          path.removeAll()
          
          // If using NavigationPath
          // path = NavigationPath()
        }
      }
  }
}

#Preview {
  ReturnToRootView()
}
