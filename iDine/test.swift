//
//  test.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/09.
//

import SwiftUI

struct test: View {
    @State private var t0 = false
    @State private var t1 = false
    @State private var t2 = false
    
    var body: some View {
        VStack {
            Button("0") {
                t0.toggle()
            }
            .alert(isPresented: $t0) {
                Alert(title: Text("alert0"), dismissButton: .default(Text("Ok ..")) {
                    t0 = true
                })
            }
            
            Button("1") {
//                t1.toggle()
            }
            .alert(isPresented: $t1) {
                Alert(title: Text("alert1"))
            }
            
        }
        
        
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
