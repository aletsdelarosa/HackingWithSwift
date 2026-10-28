import SwiftUI
import Playgrounds

struct ContentView: View {
  @State var showList = true
  
  let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  let missions: [Mission] = Bundle.main.decode("missions.json")
  
  let columns = [
    GridItem(.adaptive(minimum: 150))
  ]
  
  var body: some View {
    NavigationStack {
      if showList {
        listView
      } else {
        gridView
      }
    }
  }
  
  private var listView: some View {
    List(missions) { mission in
      NavigationLink {
        MissionView(mission: mission, astronauts: astronauts)
      } label: {
        missionListView(mission: mission)
      }
      .listRowBackground(Color.darkBackground)
      .listRowSeparator(.hidden)
    }
    .listStyle(.plain)
    .navigationTitle("Moonshot")
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        Button(
          "Toggle List",
          systemImage: showList ? "app.grid.2x2" : "rectangle.grid.1x3") {
            showList.toggle()
          }
      }
    }
    .preferredColorScheme(.dark)
    .background(.darkBackground)
  }
  
  private func missionListView(mission: Mission) -> some View {
    HStack {
      Image(mission.image)
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
        .padding()
      
      VStack {
        Text(mission.displayName)
          .font(.headline)
          .foregroundStyle(.white)
        Text(mission.formattedLaunchDate)
          .font(.caption)
          .foregroundStyle(.white.opacity(0.5))
      }
      .padding(.vertical)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(.lightBackground)
    }
    .clipShape(.rect(cornerRadius: 10))
    .overlay(
      RoundedRectangle(cornerRadius: 10)
        .stroke(.lightBackground)
    )
  }
  
  private var gridView: some View {
    ScrollView {
      LazyVGrid(columns: columns) {
        ForEach(missions) { mission in
          NavigationLink {
            MissionView(mission: mission, astronauts: astronauts)
          } label: {
            missionGridView(mission: mission)
          }
        }
      }
      .padding([.horizontal, .bottom])
    }
    .navigationTitle("Moonshot")
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        Button(
          "Toggle List",
          systemImage: showList ? "app.grid.2x2" : "rectangle.grid.1x3") {
          showList.toggle()
        }
      }
    }
    .background(.darkBackground)
    .preferredColorScheme(.dark)
  }
  
  private func missionGridView(mission: Mission) -> some View {
    VStack {
      Image(mission.image)
        .resizable()
        .scaledToFit()
        .frame(width: 100, height: 100)
        .padding()
      
      VStack {
        Text(mission.displayName)
          .font(.headline)
          .foregroundStyle(.white)
        Text(mission.formattedLaunchDate)
          .font(.caption)
          .foregroundStyle(.white.opacity(0.5))
      }
      .padding(.vertical)
      .frame(maxWidth: .infinity)
      .background(.lightBackground)
    }
    .clipShape(.rect(cornerRadius: 10))
    .overlay(
      RoundedRectangle(cornerRadius: 10)
        .stroke(.lightBackground)
    )
  }
}

#Preview {
  ContentView()
}
