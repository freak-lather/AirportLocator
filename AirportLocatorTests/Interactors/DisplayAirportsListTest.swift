import XCTest

@testable import AirportLocator
class DisplayAirportsListTest: XCTestCase {
    var repository = AirportsRepositoryMock()
    var displayAirportList: DisplayAirportsList!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        displayAirportList = DisplayAirportsList(with: repository)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        displayAirportList = nil
    }
    
    func testFetchAllAirports() {
        let expectationFetchAirports: XCTestExpectation = expectation(description: "Expected to fetch all airports from data.json and relevant methods in AirportRepository should gets called")
        self.displayAirportList.fetchAllAirports { (airport, message) in
            XCTAssertTrue(self.repository.getAllAirportsCalledSuccessfully)
            expectationFetchAirports.fulfill()
        }
        
        waitForExpectations(timeout: 4.0) { (error) in
            if let _ = error{
                XCTFail("Failed to call fetch airport from Repository")
            }
        }
    }
}
