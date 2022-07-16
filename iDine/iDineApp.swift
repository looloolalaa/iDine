//
//  iDineApp.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/04/28.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    @StateObject var bookmark = Bookmark()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
                .environmentObject(bookmark)
            
        }
    }
}
