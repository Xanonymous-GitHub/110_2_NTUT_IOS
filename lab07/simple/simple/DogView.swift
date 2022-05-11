//
//  DogView.swift
//  simple
//
//  Created by TeU on 2022/5/11.
//

import SwiftUI

let ggs = [
    GG(name: "1", singer: "23"),
    GG(name: "4", singer: "56"),
    GG(name: "7", singer: "89"),
    GG(name: "a", singer: "bc"),
    GG(name: "d", singer: "ef")
]

struct DogView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(ggs) { item in
                    NavigationLink {
                        Text("Item at \(item.singer)")
                            .navigationBarTitleDisplayMode(.inline)
                            .toolbar {
                                ToolbarItem(placement: .principal) {
                                    HStack {
                                        Image(systemName: "sun.min.fill")
                                        Text(item.name).font(.headline)
                                    }
                                }
                            }
                    } label: {
                        Text(item.name)
                    }
                }
            }
        }
    }
}

struct DogView_Previews: PreviewProvider {
    static var previews: some View {
        DogView()
    }
}
