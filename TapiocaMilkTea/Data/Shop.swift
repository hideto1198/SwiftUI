//
//  Shop.swift
//  TapiocaMilkTea
//
//  Created by 東　秀斗 on 2022/07/13.
//

import SwiftUI
import CoreLocation

struct Shop: Hashable, Codable, Identifiable {
    public var id: String
    public var name: String
    public var phoneNumber: String
    public var address: String
    fileprivate var imageName: String
    public var image: Image { Image(imageName) }
    fileprivate var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
