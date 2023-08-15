//
//  ContentView.swift
//  class3
//
//  Created by 김건호 on 2023/08/07.
//

import SwiftUI

class DataModel: ObservableObject {
    @Published var name = "Some Name"
    @Published var isEnabled = false
}
struct MySubView: View {
    @ObservedObject var model : DataModel
    var body: some View {
        Toggle("Enable", isOn:  $model.isEnabled)
    }
}


struct MyView: View {
    @StateObject private var model = DataModel() // Create the state object.


    var body: some View {
        VStack{
            Text(model.name) // Updates when the data model changes.
            MySubView(model: model)
        }
        
            
    }
}





struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ProgressView : View {
    @Binding var isPlaying : Bool
    
    var body: some View {
        Text(isPlaying ? "Playing" : "Pause")
    }
}

struct PlayButton: View {
    @Binding var isPlaying: Bool // Play button now receives a binding.


    var body: some View {
        VStack{
            Button(isPlaying ? "Pause" : "Play") {
                isPlaying.toggle()
            }
            ProgressView(isPlaying : $isPlaying)
        }
    }
}
struct PlayerView: View {
    @State private var isPlaying: Bool = false // Create the state here now.


    var body: some View {
        VStack {
            Text("Player View")
            PlayButton(isPlaying: $isPlaying) // Pass a binding.


            // ...
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
