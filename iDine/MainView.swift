//
//  MainView.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/08.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
            BookmarkView()
                .tabItem {
                    Label("Bookmark", systemImage: "star.fill")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
            .environmentObject(Bookmark())
    }
}
