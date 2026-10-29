//
//  NavigationDestinationView.swift
//  Project9
//
//  Created by Alex de la Rosa on 11/4/26.
//

import SwiftUI

struct NavigationDestinationView: View {
  var body: some View {
    NavigationStack {
      List(0..<100) { i in
        NavigationLink("Select \(i)", value: i)
      }
      .navigationTitle("Navigation Destination")
      .navigationDestination(for: Int.self) { selection in
        Text("You selected \(selection)")
      }
    }
  }
}

#Preview {
  NavigationDestinationView()
}
