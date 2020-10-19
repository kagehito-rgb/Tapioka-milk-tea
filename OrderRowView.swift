//
//  OrderRowView.swift
//  Tapioca milk tea
//
//  Created by 中村裕紀 on 2020/08/31.
//  Copyright © 2020 example.com. All rights reserved.
//

import SwiftUI

struct OrderRowView: View {
    var order: OrderEntity
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }

    var body: some View {
        HStack {
            Image("tapioca_preview")
                .resizable()
                .frame(width: 70, height: 70)
            VStack(alignment: .leading) {
                Text(order.flavorName).font(.title).lineLimit(1)
                Spacer()
                if order.nataDeCoco {
                    Text("Nata de coco")
                }
                HStack {
                    if order.iceCream != 0 {
                        Text(order.iceCreamName)
                    }
                    Spacer()
                    Text(self.dateFormatter.string(from: order.date)).font(.caption)
                }
            }
            if order.favorite {
                Image(systemName: "heart.circle.fill").foregroundColor(.pink)
            } else {
                Image(systemName:  "heart.circle").foregroundColor(.secondary)
            }
        }
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: orderStore.orders[0])
    }
}
