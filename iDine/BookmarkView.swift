//
//  BookmarkView.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/15.
//

import SwiftUI

struct BookmarkView: View {
    @EnvironmentObject var bookmark: Bookmark
    
    var body: some View {
        VStack {
            Text("Bookmark")
                .font(.title)
                .fontWeight(.bold)
            
            List {
                ForEach(bookmark.items) { item in
                    HStack {
                        ItemRow(item: item)
                        Button(action: {
                            bookmark.remove(item: item)
                        }){
                            Image(systemName: "star.fill")
                                .resizable()
                                .frame(width: 25, height: 25)
                        }
                        .padding(.leading)
                        .buttonStyle(.borderless)
                    }
                }
                .padding([.top, .leading, .bottom])
            }
        }
    }
}

struct BookmarkView_Previews: PreviewProvider {
    static let bookmark = Bookmark.example
    static var previews: some View {
        BookmarkView()
            .environmentObject(bookmark)
    }
}
