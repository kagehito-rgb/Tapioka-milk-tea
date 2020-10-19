//
//  ShopRow.swift
//  Tapioca milk tea
//
//  Created by 中村裕紀 on 2020/10/19.
//  Copyright © 2020 example.com. All rights reserved.
//

import SwiftUI

struct ShopRow: View {
    var shops: [Shop]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Shop")
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.shops) { shop in
                        VStack(alignment: .center) {
                            shop.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 155, height: 155)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)

                            Text(shop.name)
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .font(.caption)
                        }
                        .padding(.leading, 15)
                    }
                }
            }
        }
    }
}

struct ShopRow_Previews: PreviewProvider {
    static var previews: some View {
        ShopRow(shops: dataStore.shops)
    }
}

