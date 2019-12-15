//
//  BaseModel.swift
//  AirportLocator
//
//  Created by ven2aj on 15/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import Foundation
struct AirportList: AirportCodable {
    var results: [Airport]?
    var status: String?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case status = "status"
    }
    
    init(results: [Airport] = [], status: String = "") {
        self.results = results
        self.status = status
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent(Array.self, forKey: .results)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }
}
