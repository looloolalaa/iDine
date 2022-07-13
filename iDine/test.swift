//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

struct S: Hashable {
    let id: Int
    let name: String
}

struct test: View {
    @State private var myitems: [S] = []
    
    var body: some View {
        VStack {
            ForEach(myitems, id: \.self) { item in
                Button(item.name){
                    withAnimation { () -> () in
                        if let index = myitems.firstIndex(of: item) {
                            myitems.remove(at: index)
                        }
                    }
                }
            }
    
            Button("Add") {
                let number = myitems.count
                myitems.append(S(id: number, name: "myname\(number)"))
            }.padding()
        }
        
        
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
