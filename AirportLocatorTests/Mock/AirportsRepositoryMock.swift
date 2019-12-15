import Foundation

@testable import AirportLocator
class AirportsRepositoryMock: AirportsRepositoryProtocol {
    var getAllAirportsCalledSuccessfully = false
    
    func getAllAirports(_ handler: @escaping ([Airport]?, String?) -> Void) {
        getAllAirportsCalledSuccessfully = true
        handler(nil, nil)
    }
}
