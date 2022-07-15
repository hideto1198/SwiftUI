//
//  OrderHistoryView.swift
//  TapiocaMilkTea
//
//  Created by 東　秀斗 on 2022/07/13.
//

import SwiftUI

struct OrderHistoryView: View {
    @EnvironmentObject var orderStore: OrderStore
    @State var showFavoritesOnly: Bool = false
    @State var showDeleteActionSheet: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                
                Toggle(isOn: self.$showFavoritesOnly) {
                    Text("Favorites Only")
                }
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                ForEach(orderStore.orders) { order in
                    if !self.showFavoritesOnly || order.favorite {
                        NavigationLink(
                            destination: OrderDetail(order: order)
                        ){
                            OrderRowView(order: order)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Order list"))
            .navigationBarItems(
                trailing:
                    Button(
                        action:{
                            self.showDeleteActionSheet = true
                        }
                    ){
                        Text("Favorites")
                    }
                    .actionSheet(isPresented: self.$showDeleteActionSheet){
                        ActionSheet(
                            title: Text("Message"),
                            message: Text("Make All Favorites"),
                            buttons: [
                                .destructive(Text("Favorites")){
                                    self.orderStore.orders.forEach {
                                        $0.favorite = true
                                    }
                                },
                                .cancel(Text("Cancel"))
                            ]
                        )
                    }
            )
        }
    }
}

struct OrderHistoryView_Previews: PreviewProvider {
    static var orderStore: OrderStore {
        let orderStore = OrderStore()
        orderStore.orders.append(OrderEntity())
        return orderStore
    }
    static var previews: some View {
        OrderHistoryView()
            .environmentObject(orderStore)
    }
}
