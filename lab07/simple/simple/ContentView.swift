//
//  ContentView.swift
//  simple
//
//  Created by TeU on 2022/5/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DogView()
                .tabItem {
                    Image(systemName: "clock")
                    Text("???")
                }
            LinkView()
                .tabItem {
                    Image(systemName: "house")
                    Text("!!!")
                }
            BookView()
                .tabItem {
                    Image(systemName: "person")
                    Text("掰掰")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
