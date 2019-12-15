//
//  DisplayAirportList.swift
//  AirportLocator
//
//  Created by ven2aj on 15/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import Foundation
protocol DisplayAirportsListProtocol {
    func fetchAllAirports(_ handler:@escaping ([Airport]?, String?)->())->Void
}

struct DisplayAirportsList {
    private var repository: AirportsRepositoryProtocol
    init(with repository: AirportsRepositoryProtocol) {
        self.repository = repository
    }
}

extension DisplayAirportsList: DisplayAirportsListProtocol {
    func fetchAllAirports(_ handler: @escaping ([Airport]?, String?) -> ()) {
        repository.getAllAirports { records, message in
            handler(records, message)
        }
    }
}
