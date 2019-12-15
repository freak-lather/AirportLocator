//
//  AirportRespository.swift
//  AirportLocator
//
//  Created by ven2aj on 15/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import Foundation

protocol AirportsRepositoryProtocol {
    func getAllAirports(_ handler:@escaping (_ airports: [Airport]?, _ message: String?)->Void)-> Void
}

struct AirportRepository: AirportsRepositoryProtocol {
    func getAllAirports(_ handler: @escaping ([Airport]?, String?) -> Void) {
        if let airports = DataManager.sharedInstance.getAllAirports() {
            handler(airports, ResponseMessage.getSuccess.rawValue)
        } else {
            handler(nil, ResponseMessage.failureNoRecordsFound.rawValue)
        }
    }
}
