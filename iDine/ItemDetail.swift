//
//  ItemDetail.swift
//  iDine
//
//  Created by Daniel Bernal on 6/17/20.
//  Copyright © 2020 Daniel Bernal. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    var item: MenuItem
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo by \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(Color.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            
            Button("Order This") {
                self.order.add(item: self.item)
            }.font(.headline)
            
            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
        
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
