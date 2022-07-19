//
//  ItemDetail.swift
//  iDine
//
//  Created by Kihyun Lee on 2022/07/08.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    @EnvironmentObject var bookmark: Bookmark
    @State private var showingOrderConfirm = false
    let item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            
            Button(action: {
                order.add(item: item)
                showingOrderConfirm.toggle()
            }){
                Text("Order this")
                    .font(.title)
                    .padding()
                    .padding(.horizontal)
                    .background(.gray.opacity(0.1))
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 2))
            }
            .alert(isPresented: $showingOrderConfirm) {
                Alert(title: Text("Menu Added!"))
            }
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                if bookmark.items.contains(item) {
                    Button(action: {
                        bookmark.remove(item: item)
                    }){
                        Image(systemName: "star.fill")
                    }
                } else {
                    Button(action: {
                        bookmark.add(item: item)
                    }){
                        Image(systemName: "star")
                    }
                }
            }
        }
        
        
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
                .environmentObject(Bookmark())
        }
    }
}
