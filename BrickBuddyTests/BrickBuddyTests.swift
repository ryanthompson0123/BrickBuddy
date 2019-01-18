//
//  BrickBuddyTests.swift
//  BrickBuddyTests
//
//  Created by Ryan Thompson on 12/12/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import XCTest
import XMLCoder

@testable import BrickBuddy

class BrickBuddyTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    private enum Genre: String, Decodable {
        case computer = "Computer"
        case fantasy = "Fantasy"
        case romance = "Romance"
        case horror = "Horror"
        case sciFi = "Science Fiction"
    }
    
    private struct Book: Decodable, Equatable {
        var id: String
        var author: String
        var title: String?
        var genre: Genre
        var price: Double
        var publishDate: Date
        var description: String
        
        enum CodingKeys: String, CodingKey {
            case id, author, title, genre, price, description
            
            case publishDate = "publish_date"
        }
    }
    
    private let bookXML = """
    <?xml version="1.0"?>
    <book id="bk101">
        <author>Gambardella, Matthew</author>
        <title />
        <genre>Computer</genre>
        <price>44.95</price>
        <publish_date>2000-10-01</publish_date>
        <description>An in-depth look at creating applications
            with XML.</description>
    </book>
    """.data(using: .utf8)!
    
    func testXML() {
        let decoder = XMLDecoder()
        let formatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter
        }()
        
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            let book1 = try decoder.decode(Book.self, from: bookXML)
            XCTAssertEqual(book1.publishDate,
                           Date(timeIntervalSince1970: 970358400))
        } catch {
            XCTAssert(false, "failed to decode test xml: \(error)")
        }
    }
    
    func testDecodeXML() {
        let responseString = """
        <sets>
        <setID>27664</setID>
        <number>10712</number>
        <numberVariant>1</numberVariant>
        <name>Bricks and Gears</name>
        <year>2018</year>
        <theme>Classic</theme>
        <themeGroup>Basic</themeGroup>
        <subtheme/>
        <pieces>244</pieces>
        <minifigs/>
        <image>true</image>
        <imageFilename>10712-1</imageFilename>
        <thumbnailURL>https://images.brickset.com/sets/small/10712-1.jpg</thumbnailURL>
        <largeThumbnailURL>https://images.brickset.com/sets/small/10712-1.jpg</largeThumbnailURL>
        <imageURL>https://images.brickset.com/sets/images/10712-1.jpg</imageURL>
        <bricksetURL>https://brickset.com/sets/10712-1</bricksetURL>
        <released>true</released>
        <owned>false</owned>
        <wanted>false</wanted>
        <qtyOwned>0</qtyOwned>
        <ACMDataCount>0</ACMDataCount>
        <ownedByTotal>542</ownedByTotal>
        <wantedByTotal>235</wantedByTotal>
        <UKRetailPrice>17.99</UKRetailPrice>
        <USRetailPrice>19.99</USRetailPrice>
        <CARetailPrice>24.99</CARetailPrice>
        <EURetailPrice>19.99</EURetailPrice>
        <USDateAddedToSAH>2018-01-01</USDateAddedToSAH>
        <USDateRemovedFromSAH/>
        <rating>5</rating>
        <reviewCount>1</reviewCount>
        <packagingType>Box</packagingType>
        <availability>Retail</availability>
        <instructionsCount>2</instructionsCount>
        <additionalImageCount>10</additionalImageCount>
        <ageMin/>
        <ageMax/>
        <height/>
        <width/>
        <depth/>
        <weight/>
        <category>Normal</category>
        <userRating>0</userRating>
        <EAN/>
        <UPC/>
        <lastUpdated>2018-01-02T11:59:10.76</lastUpdated>
        </sets>
        """
        
        let responseData = responseString.data(using: String.Encoding.utf8)!
        //let envelope =
        
        do {
            let envelope = try XMLDecoder().decode(BricksetSet.self, from: responseData)
            
            XCTAssertNotNil(envelope)
        } catch {
            print("Unexpected error: \(error).")
            XCTFail()
        }
    }

}
