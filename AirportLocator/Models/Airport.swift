//
//  Airport.swift
//  AirportLocator
//
//  Created by ven2aj on 15/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import Foundation
struct Airport: JSONCodable {
    var name:String?
    var vicinity:String?
    var icon: String?
    var geometry: AirportLocation?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case vicinity = "vicinity"
        case icon = "icon"
        case geometry = "geometry"
    }
    
    init(name: String = "", vicinity: String = "", icon: String = "", geometry: AirportLocation?) {
        self.name = name
        self.vicinity = vicinity
        self.geometry = geometry
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        vicinity = try values.decodeIfPresent(String.self, forKey: .name)
        icon = try values.decodeIfPresent(String.self, forKey: .icon)
        geometry = try values.decodeIfPresent(AirportLocation.self, forKey: .geometry)
    }
}
