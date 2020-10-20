//
//  OrderDetail.swift
//  Tapioca milk tea
//
//  Created by 中村裕紀 on 2020/08/25.
//  Copyright © 2020 example.com. All rights reserved.
//

import SwiftUI

struct OrderDetail: View {
    var order: OrderEntity
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Favorite")
                if order.favorite {
                    Image(systemName: "heart.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(.pink)
                } else {
                    Image(systemName: "heart.circle")
                        .resizable()
                    .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                }
            }.padding()

            TapiocaTeaView(iceCream: Int(order.iceCream),
                           flavor: Int(order.flavor),
                           nataDeCoco: order.nataDeCoco)
                .frame(width: 350, height: 350)

            Text(order.flavorName)
                .font(.title)

            if order.nataDeCoco {
                Text("Nata de coco")
            }

            if order.iceCream != 0 {
                Text(order.iceCreamName)
            }

            Text(order.other)

            Text(self.dateFormatter.string(from: order.date))
                .font(.caption)
        }
    }
}

struct OrderDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OrderDetail(order: orderStore.orders[0])
            OrderDetail(order: orderStore.orders[1])
        }

    }
}
