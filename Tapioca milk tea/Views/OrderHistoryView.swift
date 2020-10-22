//
//  OrderHistoryView.swift
//  Tapioca milk tea
//
//  Created by 中村裕紀 on 2020/10/19.
//  Copyright © 2020 example.com. All rights reserved.
//

import SwiftUI

struct OrderHistoryView: View {
    @State var showFavoritesOnly = false

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly, label: {
                    Text("Favorites only")
                })
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))

                ForEach(orderStore.orders) { order in
                    if !self.showFavoritesOnly || order.favorite {
                        NavigationLink(destination: OrderDetail(order: order)) {
                            OrderRowView(order: order)
                        }
                    }
                }
            }
            .navigationBarTitle("Order List")
        }
    }
}

struct OrderHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryView()
    }
}
