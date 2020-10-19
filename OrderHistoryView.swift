//
//  OrderHistoryView.swift
//  Tapioca milk tea
//
//  Created by 中村裕紀 on 2020/10/19.
//  Copyright © 2020 example.com. All rights reserved.
//

import SwiftUI

struct OrderHistoryView: View {
    var body: some View {
        List {
            ForEach(orderStore.orders) { order in
                OrderRowView(order: order)
            }
        }
    }
}

struct OrderHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        OrderHistoryView()
    }
}
