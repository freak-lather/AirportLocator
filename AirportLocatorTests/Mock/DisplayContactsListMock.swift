import UIKit

@testable import AirportLocator
class DisplayAirportsListMock: DisplayAirportsListProtocol {
    var fetchAllAirportsCalled = false
    func fetchAllAirports(_ handler: @escaping ([Airport]?, String?) -> ()) {
        fetchAllAirportsCalled = true
        handler(nil, nil)
    }
}
