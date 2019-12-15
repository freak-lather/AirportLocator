//
//  AirportGeomatry.swift
//  AirportLocator
//
//  Created by ven2aj on 15/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import Foundation
struct AirportLocation: AirportCodable {
    var location: AirportCoordinates?
    
    enum CodingKeys: String, CodingKey {
        case location = "location"
    }
    
    init(location: AirportCoordinates? = nil) {
        self.location = location
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        location = try values.decodeIfPresent(AirportCoordinates.self, forKey: .location)
    }
}
