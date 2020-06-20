//
//  OrderView.swift
//  iDine
//
//  Created by Daniel Bernal on 6/18/20.
//  Copyright © 2020 Daniel Bernal. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink(destination: Checkout()) {
                        Text("Place Order")
                    }
                }.disabled(order.items.isEmpty)
            }
        }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Order")
        .navigationBarItems(trailing: EditButton())
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}
