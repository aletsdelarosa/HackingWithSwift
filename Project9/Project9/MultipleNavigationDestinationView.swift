//
//  MultipleNavigationDestinationView.swift
//  Project9
//
//  Created by Alex de la Rosa on 11/4/26.
//

import SwiftUI

struct MultipleNavigationDestinationView: View {
  var body: some View {
    NavigationStack {
      List {
        ForEach(0..<5) { i in
          NavigationLink("Select Number: \(i)", value: i)
        }
        
        ForEach(0..<5) { i in
          NavigationLink("Select String: \(i)", value: String(i))
        }
      }
      .navigationTitle("Multiple Destinations")
      .navigationDestination(for: Int.self) { selection in
        Text("You selected the number \(selection)")
      }
      .navigationDestination(for: String.self) { selection in
        Text("You selected the string \(selection)")
      }
    }
  }
}

#Preview {
  MultipleNavigationDestinationView()
}
