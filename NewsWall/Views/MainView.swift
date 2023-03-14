//
//  MainView.swift
//  NewsWall
//
//  Created by Irakli Nozadze on 14.03.23.
//

import Foundation
import SwiftUI

struct MainView {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Apple", systemImage: "list.dash")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
