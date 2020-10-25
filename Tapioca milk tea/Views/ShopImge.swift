//
//  ShopImge.swift
//  Tapioca milk tea
//
//  Created by 中村裕紀 on 2020/10/22.
//  Copyright © 2020 example.com. All rights reserved.
//

import SwiftUI

// 外側の線のグラデーション
fileprivate let gradient = Gradient(colors: [
    .white,
    Color.init(red: 0.9, green: 0.9, blue: 0.9)
])

fileprivate let linear = LinearGradient(
    gradient: gradient, startPoint: .top, endPoint: .bottom
)

struct ShopImage: View {
    let image: Image

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: 250, height: 250)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(linear, lineWidth: 13))
            .shadow(radius: 5, x: 0, y: 5)
    }
}

struct ShopImge_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(dataStore.shops) { shop in
                ShopImage(image: shop.image)
            }
        }
        .previewLayout(.fixed(width: 300, height: 300))
    }
}
