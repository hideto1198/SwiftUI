//
//  OrderRowView.swift
//  TapiocaMilkTea
//
//  Created by 東　秀斗 on 2022/07/13.
//

import SwiftUI

struct OrderRowView: View {
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
        HStack {
            TapiocaTeaView(
                iceCream: Int(order.iceCream),
                flavor: Int(order.flavor),
                nataDeCoco: order.nataDeCoco
            )
            .frame(width: 70, height: 70)
            VStack(alignment: .leading){
                Text(order.flavorName)
                    .font(.title)
                Spacer()
                if order.nataDeCoco {
                    Text("Nata de coco")
                }
                HStack {
                    if order.iceCream != 0 {
                        Text(order.iceCreamName)
                    }
                    Spacer()
                    Text(self.dateFormatter.string(from: order.date))
                        .font(.caption)
                }
            }
            if order.favorite {
                Image(systemName: "heart.circle.fill")
                    .foregroundColor(.pink)
            } else {
                Image(systemName: "heart.circle")
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct OrderRowView_Previews: PreviewProvider {
    static var previews: some View {
        OrderRowView(order: orderStore.orders[0])
    }
}