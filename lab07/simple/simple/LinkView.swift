//
//  LinkView.swift
//  simple
//
//  Created by TeU on 2022/5/11.
//

import SwiftUI

struct LinkView: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Link("google", destination: URL(string: "https://apple.com")!)
        }
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView()
    }
}
