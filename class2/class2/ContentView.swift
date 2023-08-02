//
//  ContentView.swift
//  class2
//
//  Created by 김건호 on 2023/08/02.
//

import SwiftUI

struct ContentView: View {
    struct Ocean: Identifiable, Hashable {
        let name: String
        let id = UUID()
    }


    private var oceans = [
        Ocean(name: "Pacific"),
        Ocean(name: "Atlantic"),
        Ocean(name: "Indian"),
        Ocean(name: "Southern"),
        Ocean(name: "Arctic")
    ]


    @State private var multiSelection = Set<UUID>()


    var body: some View {
        VStack{
            NavigationView {
                
                List(oceans, selection: $multiSelection) {
                    Text($0.name)
                }
                .navigationTitle(multiSelection.count.description)
//                .toolbar { EditButton() }
            }
            Text("\(multiSelection.count) selections")
        }
    }

}

struct MyText<Content> : View where Content : View {
    @ViewBuilder let content : Content
    
    var body : some View {
        
        content.background(Color.pink)
            .font(.largeTitle)
    }
}
struct Title : ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
            .background(Color.blue)
    }
}

struct MyScroll: View {
    var body: some View {
        GeometryReader{ geometry in
            HStack(spacing : 0){
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(0..<100) {
                            Text("Row \($0)")
                        }
                    }.frame(width: geometry.size.width * 0.5)
                }
                
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(0..<100) {
                            Text("Row \($0)")
                        }
                    }.frame(width: geometry.size.width * 0.5)
                }
            }
        }
    }
}

struct MyNavi : View {
    struct Park : Identifiable,Hashable{
        let name : String
        let id = UUID()
    }
    let parks : [Park] = [
    Park(name: "탑골공원"),
    Park(name: "어린이대공원"),
    Park(name: "일산호수공원"),
    Park(name: "올림픽공원")
    ]
    var body: some View{
        NavigationStack {
            List(parks) { park in
                NavigationLink(park.name, value: park)
            }
//            ForEach(parks) { park in
//                NavigationLink(park.name, value : park)
//            }
            .navigationDestination(for: Park.self) { park in
                ParkDetails(park: park)
            }
        }
    }
}
struct ParkDetails : View {
    let park : MyNavi.Park
    
    var body: some View{
        Text(park.name)
    }
}

struct Mytab : View {
    var body: some View{
        TabView {
            MyNavi()
                .badge(3)
                .tabItem {
                    Label("Received", systemImage: "tray.and.arrow.down.fill")
                }
            MyScroll()
                .tabItem {
                    Label("Sent", systemImage: "tray.and.arrow.up.fill")
                }
            ContentView()
                .badge("!")
                .tabItem {
                    Label("Account", systemImage: "person.crop.circle.fill")
                }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Mytab()
    }
}
