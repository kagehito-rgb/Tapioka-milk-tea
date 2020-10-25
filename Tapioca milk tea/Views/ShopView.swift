//
//  ShopView.swift
//  Tapioca milk tea
//
//  Created by 中村裕紀 on 2020/10/22.
//  Copyright © 2020 example.com. All rights reserved.
//

import SwiftUI

struct ShopView: View {
    var shop: Shop
    @State var degree: Double = 180

    var body: some View {
        VStack {
            Rectangle()
            ShopImage(image: shop.image)
                .padding(.top, -130)
                .rotation3DEffect(
                    .init(degrees: degree),
                    axis: (
                        x: 0.0,
                        y: 1.0,
                        z: -0.2
                    )
                )
                .animation(.interpolatingSpring(
                            mass: 0.1,
                            stiffness: 6,
                            damping: 0.5,
                            initialVelocity: 30)
                )
                .onAppear {
                    self.degree = 0
                }
            Text(shop.name)
                .padding()
                .font(.largeTitle)
            Text(shop.address)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .padding()
            Text("Phone: " + shop.phoneNumber)
                .padding()
        }
        .navigationBarTitle(shop.name)
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ShopView(shop: dataStore.shops[2])
        }
    }
}
