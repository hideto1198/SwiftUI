//
//  Special.swift
//  TapiocaMilkTea
//
//  Created by 東　秀斗 on 2022/07/13.
//

import Foundation
import SwiftUI

struct Special: Hashable, Codable, Identifiable {
    public var id: String
    public var imageName: String
    public var caption: String
    public var text: String
    public var image: Image { Image(imageName) }
    public var category: Category
    public var isFeatured: Bool
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case new = "New"
        case sale = "Sale"
        case featured = "Featured"
        case flavor = "Flavor"
    }
}
