//
//  ContentView.swift
//  NewsWall
//
//  Created by Irakli Nozadze on 11.03.23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("Apple News")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Apple")
                }
            Text("Tesla News")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Tesla")
                }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
