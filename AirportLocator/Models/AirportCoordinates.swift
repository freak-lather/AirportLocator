//
//  AirportLocation.swift
//  AirportLocator
//
//  Created by ven2aj on 15/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import Foundation
struct AirportCoordinates: AirportCodable {
    var lat: Double?
    var lng: Double?
    
    enum CodingKeys: String, CodingKey {
        case lat = "lat"
        case lng = "lng"
    }
    
    init(lat: Double = 0.0, lng: Double = 0.0) {
        self.lat = lat
        self.lng = lng
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .lat)
        lng = try values.decodeIfPresent(Double.self, forKey: .lng)
    }
}
