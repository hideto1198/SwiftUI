//
//  OrderEntity.swift
//  TapiocaMilkTea
//
//  Created by 東　秀斗 on 2022/07/13.
//

import Foundation

let flavorArray: [String] = [
    "Milk tea",
    "Uji Match Milk",
    "Okinawa brown sugar milk",
    "Cassis raspberry milk",
    "Strawberry Milk"
]

let iceCreamArray: [String] = [
    "None",
    "Vanilla",
    "Tea",
    "Matcha"
]

enum Flavor: Int {
    case milk_tea = 0
    case uji_match_milk = 1
    case okinawa_brown_sugar_milk = 2
    case cassis_raspberry_milk = 3
    case strawberry_milk = 4
    
    var name: String {
        flavorArray[Int(self.rawValue)]
    }
}

enum IceCream: Int {
    case None = 0
    case Vanilla = 1
    case Tea = 2
    case Matcha = 3
    
    var name: String {
        iceCreamArray[Int(self.rawValue)]
    }
}

struct OrderEntity: Codable, Identifiable {
    public var id: String
    public var flavor: Int
    public var iceCream: Int
    public var nataDeCoco: Bool
    public var other: String
    public var date: Date
    public var quantity: Int
    public var favorite: Bool
    
    public var flavorName: String {
        Flavor(rawValue: self.flavor)!.name
    }
    
    public var iceCreamName: String {
        IceCream(rawValue: self.iceCream)!.name
    }
}
