//
//  Bookmark.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/15.
//

import Foundation


class Bookmark: Order {
    convenience init(item: MenuItem) {
        self.init()
        items.append(item)
        items.append(item)
    }
    static let example = Bookmark(item: MenuItem.example)
}
