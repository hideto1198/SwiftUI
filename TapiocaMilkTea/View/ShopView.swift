//
//  ShopView.swift
//  TapiocaMilkTea
//
//  Created by 東　秀斗 on 2022/07/13.
//

import SwiftUI

struct ShopView: View {
    var shop: Shop
    @State var degree: Double = 180.0
    
    var body: some View {
        VStack {
            Rectangle()
            ShopImage(image: shop.image)
                .padding(.top, -130)
                .rotation3DEffect(.init(degrees: self.degree),
                                  axis: (x: 0.0, y: 1.0, z: -0.2))
                .animation(.interpolatingSpring(
                    mass: 0.1,
                    stiffness: 6,
                    damping: 0.5,
                    initialVelocity: 30
                ))
                .onAppear{
                    self.degree = 0.0
                }
            Text(shop.name)
                .padding()
                .font(.largeTitle)
            Text(shop.address)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .padding()
            Text("Phone: \(shop.phoneNumber)")
                .padding()
        }
        .navigationBarTitle(shop.name)
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(shop: dataStore.shops[2])
    }
}
