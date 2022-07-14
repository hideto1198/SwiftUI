//
//  HomeView.swift
//  TapiocaMilkTea
//
//  Created by 東　秀斗 on 2022/07/13.
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
            ScrollView{
                ShopRow(shops: dataStore.shops)
                
                ForEach(self.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
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
