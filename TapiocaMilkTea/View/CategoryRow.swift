//
//  CategoryRow.swift
//  TapiocaMilkTea
//
//  Created by 東　秀斗 on 2022/07/13.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Special]
    
    var body: some View {
        VStack {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { special in
                        VStack {
                            special.image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 155, height: 155)
                                .cornerRadius(5)
                            Text(special.caption)
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

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: "Flavor", items: dataStore.specials.filter { $0.category == .flavor }
        )
    }
}
