//
//  OrderDetail.swift
//  TapiocaMilkTea
//
//  Created by 東　秀斗 on 2022/07/13.
//

import SwiftUI

struct OrderDetail: View {
    var order: OrderEntity
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "ja_JP")
        return formatter
    }
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Text("Favorite")
                Image(systemName: order.favorite ? "heart.circle.fill" : "heart.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(order.favorite ? .pink : .gray)
            }
            .padding()
            TapiocaTeaView(iceCream: Int(order.iceCream), flavor: Int(order.flavor), nataDeCoco: order.nataDeCoco)
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
        .navigationBarTitle(Text("Order detail"))
    }
}

struct OrderDetail_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetail(order: orderStore.orders[0])
        OrderDetail(order: orderStore.orders[1])
    }
}
