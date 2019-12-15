//
//  AirportsListViewModel.swift
//  AirportLocator
//
//  Created by ven2aj on 15/12/19.
//  Copyright © 2019 ven2aj. All rights reserved.
//

import UIKit
protocol AirportsListViewModelProtocol {
    func didLoad()
    func screenTitle()-> String
    func name(forAirportAt indexPath: IndexPath)-> String?
    func image(forAirportAt indexPath: IndexPath)-> UIImage?
    func airport(atSelected indexPath: IndexPath?)-> Airport?
    func willRefreshScreenData()
}

class AirportsListViewModel {
    var airports:[Airport] = []
    var reload: (()-> Void) = {}
    private var interactor: DisplayAirportsListProtocol
    
    init(with interactor:DisplayAirportsListProtocol) {
        self.interactor = interactor
    }
}

extension AirportsListViewModel: AirportsListViewModelProtocol {
    static func create()-> AirportsListViewModel {
        let repository =  AirportRepository()
        let interactor: DisplayAirportsList = DisplayAirportsList(with: repository)
        return AirportsListViewModel(with: interactor)
    }
    
    func didLoad() {
        self.interactor.fetchAllAirports { (allAirports, message) in
            self.airports = allAirports ?? []
            self.reload()
        }
    }
    
    func screenTitle() -> String {
        return "Contacts"
    }
    
    func numberOfRows() -> Int {
        return self.airports.count
    }
    
    func name(forAirportAt indexPath: IndexPath) -> String? {
        return airports[indexPath.row].name ?? ""
    }
    
    func image(forAirportAt indexPath: IndexPath) -> UIImage? {
        return nil
    }
    
    func airport(atSelected indexPath: IndexPath?) -> Airport? {
        if let _indexPath = indexPath {
            return airports[_indexPath.row]
        }
        return nil
    }
    
    @objc func willRefreshScreenData() {
        didLoad()
    }
}
