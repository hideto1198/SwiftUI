//
//  ContentView.swift
//  TapiocaMilkTea
//
//  Created by 東　秀斗 on 2022/07/13.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("HOME")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "textbox")
                    Text("ORDER")
                }
            OrderHistoryView()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("LIST")
                }
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(OrderStore())
    }
}
