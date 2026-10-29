//
//  SavePathsView.swift
//  Project9
//
//  Created by Alex de la Rosa on 11/4/26.
//

import SwiftUI
import Observation

@Observable
class PathStore {
  var path: [Int] {
    didSet {
      save()
    }
  }
  
  private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
  
  init() {
    if let data = try? Data(contentsOf: savePath) {
      if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
        path = decoded
        return
      }
    }
    
    // Still here? Start with an empty path.
    path = []
  }
  
  func save() {
    do {
      let data = try JSONEncoder().encode(path)
      try data.write(to: savePath)
    } catch {
      print("Failed to save navigation data")
    }
  }
}

struct SavePathsDetailView: View {
  var number: Int
  
  var body: some View {
    NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
      .navigationTitle("Number: \(number)")
  }
}

struct SavePathsView: View {
  @State private var pathStore = PathStore()
  
  var body: some View {
    NavigationStack(path: $pathStore.path) {
      SavePathsDetailView(number: 0)
        .navigationDestination(for: Int.self) { i in
          SavePathsDetailView(number: i)
        }
    }
  }
}


// If using NavigationPath

//@Observable
//class PathStore {
//  var path: NavigationPath {
//    didSet {
//      save()
//    }
//  }
//  
//  private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
//  
//  init() {
//    if let data = try? Data(contentsOf: savePath) {
//      if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
//        path = NavigationPath(decoded)
//        return
//      }
//    }
//    
//    // Still here? Start with an empty path.
//    path = NavigationPath()
//  }
//  
//  func save() {
//    guard let representation = path.codable else { return }
//    
//    do {
//      let data = try JSONEncoder().encode(representation)
//      try data.write(to: savePath)
//    } catch {
//      print("Failed to save navigation data")
//    }
//  }
//}

#Preview {
  SavePathsView()
}
