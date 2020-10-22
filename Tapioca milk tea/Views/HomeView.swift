//
//  HomeView.swift
//  Tapioca milk tea
//
//  Created by 中村裕紀 on 2020/10/19.
//  Copyright © 2020 example.com. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var categories: [String: [Special]] {
        Dictionary(
            grouping: dataStore.specials.filter {
                $0.category != .featured
            },
            by: { $0.category.rawValue }
        )
    }

    var body: some View {
        NavigationView {
            ScrollView {
                ShopRow(shops: dataStore.shops)

                ForEach(categories.keys.sorted(),
                        id: \.self) { key in
                    CategoryRow(categoryName: key,
                                items: self.categories[key]!)
                }
            }
            .navigationBarTitle(Text("Home"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
