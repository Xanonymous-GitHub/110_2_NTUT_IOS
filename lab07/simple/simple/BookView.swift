//
//  BookView.swift
//  simple
//
//  Created by TeU on 2022/5/11.
//

import SwiftUI
import Foundation

struct GG: Identifiable {
    let id = UUID()
    let name: String
    let singer: String
}

struct BookView: View {
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    private var colors: [Color] = [.yellow, .purple, .green]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())]) {
                    ForEach((0...99), id: \.self) {
                        Image(systemName: symbols[$0 % symbols.count])
                            .font(.system(size: 30))
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                    }
                }
            }
            ScrollView (.horizontal) {
                LazyHGrid(rows: [GridItem(.flexible()),GridItem(.flexible())]) {
                    ForEach((0...99), id: \.self) {
                        Image(systemName: symbols[$0 % symbols.count])
                            .font(.system(size: 30))
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
