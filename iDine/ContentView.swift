//
//  ContentView.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    @EnvironmentObject var bookmark: Bookmark
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: ItemDetail(item: item)) {
                                HStack {
                                    ItemRow(item: item)
                                    if bookmark.items.contains(item) {
                                        Button(action: {
                                            bookmark.remove(item: item)
                                        }){
                                            Image(systemName: "star.fill")
                                        }
                                        .buttonStyle(.borderless)
                                    } else {
                                        Button(action: {
                                            bookmark.add(item: item)
                                        }){
                                            Image(systemName: "star")
                                        }
                                        .buttonStyle(.borderless)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Bookmark())
    }
}
