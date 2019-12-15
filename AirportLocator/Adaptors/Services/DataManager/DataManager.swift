//
//  AirportService.swift
//  AirportLocator
//
//  Created by ven2aj on 15/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//
import UIKit

struct DataManager {
    static let sharedInstance = DataManager()
    private let jsonFileName = "data"
    private let fileType = "geojson"
    private let key = "results"

    func getAllAirports()-> [Airport]? {
        return [Airport].getObjectFromJSONFile(fileName: jsonFileName, forKey: key, fileType: fileType)
    }
}
