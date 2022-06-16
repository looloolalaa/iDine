//
//  ContentView.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/04/28.
//

import SwiftUI

struct ContentView: View {
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var dueDate = Date()
    
    var body: some View {
        Text("Hello: \(dueDate, formatter: Self.taskDateFormat)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
