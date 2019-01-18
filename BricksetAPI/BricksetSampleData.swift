//
//  BricksetSampleData.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/13/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import Foundation


struct BricksetSampleData {
    static func getSets(query: String) -> Data {
        return toData(content: """
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
        <soap:Body>
        <getSetsResponse xmlns="https://brickset.com/api/">
        <getSetsResult>
        <sets>
        <setID>3750</setID>
        <number>6982</number>
        <numberVariant>1</numberVariant>
        <name>Explorien Starship</name>
        <year>1996</year>
        <theme>Space</theme>
        <themeGroup>Action/Adventure</themeGroup>
        <subtheme>Exploriens</subtheme>
        <pieces>662</pieces>
        <minifigs>4</minifigs>
        <image>true</image>
        <imageFilename>6982-1</imageFilename>
        <thumbnailURL>https://images.brickset.com/sets/small/6982-1.jpg</thumbnailURL>
        <largeThumbnailURL>https://images.brickset.com/sets/small/6982-1.jpg</largeThumbnailURL>
        <imageURL>https://images.brickset.com/sets/images/6982-1.jpg</imageURL>
        <bricksetURL>https://brickset.com/sets/6982-1</bricksetURL>
        <released>true</released>
        <owned>false</owned>
        <wanted>false</wanted>
        <qtyOwned>0</qtyOwned>
        <ACMDataCount>0</ACMDataCount>
        <ownedByTotal>1749</ownedByTotal>
        <wantedByTotal>969</wantedByTotal>
        <UKRetailPrice/>
        <USRetailPrice>80</USRetailPrice>
        <CARetailPrice/>
        <EURetailPrice/>
        <USDateAddedToSAH/>
        <USDateRemovedFromSAH/>
        <rating>4.16666666666667</rating>
        <reviewCount>18</reviewCount>
        <packagingType>Box</packagingType>
        <availability>Retail</availability>
        <instructionsCount>1</instructionsCount>
        <additionalImageCount>0</additionalImageCount>
        <ageMin/>
        <ageMax/>
        <height/>
        <width/>
        <depth/>
        <weight/>
        <category>Normal</category>
        <userRating>0</userRating>
        <EAN/>
        <UPC>042884069827</UPC>
        <lastUpdated>2012-08-25T18:56:10.84</lastUpdated>
        </sets>
        </getSetsResult>
        </getSetsResponse>
        </soap:Body>
        </soap:Envelope>
        """)
    }
    static func getSetsByNumber(setNumber: String) -> Data {
        return toData(content: """
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
        <soap:Body>
        <getSetsResponse xmlns="https://brickset.com/api/">
        <getSetsResult>
        <sets>
        <setID>3750</setID>
        <number>\(setNumber)</number>
        <numberVariant>1</numberVariant>
        <name>Explorien Starship</name>
        <year>1996</year>
        <theme>Space</theme>
        <themeGroup>Action/Adventure</themeGroup>
        <subtheme>Exploriens</subtheme>
        <pieces>662</pieces>
        <minifigs>4</minifigs>
        <image>true</image>
        <imageFilename>6982-1</imageFilename>
        <thumbnailURL>https://images.brickset.com/sets/small/6982-1.jpg</thumbnailURL>
        <largeThumbnailURL>https://images.brickset.com/sets/small/6982-1.jpg</largeThumbnailURL>
        <imageURL>https://images.brickset.com/sets/images/6982-1.jpg</imageURL>
        <bricksetURL>https://brickset.com/sets/6982-1</bricksetURL>
        <released>true</released>
        <owned>false</owned>
        <wanted>false</wanted>
        <qtyOwned>0</qtyOwned>
        <ACMDataCount>0</ACMDataCount>
        <ownedByTotal>1749</ownedByTotal>
        <wantedByTotal>969</wantedByTotal>
        <UKRetailPrice/>
        <USRetailPrice>80</USRetailPrice>
        <CARetailPrice/>
        <EURetailPrice/>
        <USDateAddedToSAH/>
        <USDateRemovedFromSAH/>
        <rating>4.16666666666667</rating>
        <reviewCount>18</reviewCount>
        <packagingType>Box</packagingType>
        <availability>Retail</availability>
        <instructionsCount>1</instructionsCount>
        <additionalImageCount>0</additionalImageCount>
        <ageMin/>
        <ageMax/>
        <height/>
        <width/>
        <depth/>
        <weight/>
        <category>Normal</category>
        <userRating>0</userRating>
        <EAN/>
        <UPC>042884069827</UPC>
        <lastUpdated>2012-08-25T18:56:10.84</lastUpdated>
        </sets>
        </getSetsResult>
        </getSetsResponse>
        </soap:Body>
        </soap:Envelope>
        """)
    }
    static func getSetsByYear(year: String) -> Data {
        return toData(content: """
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
        <soap:Body>
        <getSetsResponse xmlns="https://brickset.com/api/">
        <getSetsResult>
        <sets>
        <setID>3750</setID>
        <number>6982</number>
        <numberVariant>1</numberVariant>
        <name>Explorien Starship</name>
        <year>\(year)</year>
        <theme>Space</theme>
        <themeGroup>Action/Adventure</themeGroup>
        <subtheme>Exploriens</subtheme>
        <pieces>662</pieces>
        <minifigs>4</minifigs>
        <image>true</image>
        <imageFilename>6982-1</imageFilename>
        <thumbnailURL>https://images.brickset.com/sets/small/6982-1.jpg</thumbnailURL>
        <largeThumbnailURL>https://images.brickset.com/sets/small/6982-1.jpg</largeThumbnailURL>
        <imageURL>https://images.brickset.com/sets/images/6982-1.jpg</imageURL>
        <bricksetURL>https://brickset.com/sets/6982-1</bricksetURL>
        <released>true</released>
        <owned>false</owned>
        <wanted>false</wanted>
        <qtyOwned>0</qtyOwned>
        <ACMDataCount>0</ACMDataCount>
        <ownedByTotal>1749</ownedByTotal>
        <wantedByTotal>969</wantedByTotal>
        <UKRetailPrice/>
        <USRetailPrice>80</USRetailPrice>
        <CARetailPrice/>
        <EURetailPrice/>
        <USDateAddedToSAH/>
        <USDateRemovedFromSAH/>
        <rating>4.16666666666667</rating>
        <reviewCount>18</reviewCount>
        <packagingType>Box</packagingType>
        <availability>Retail</availability>
        <instructionsCount>1</instructionsCount>
        <additionalImageCount>0</additionalImageCount>
        <ageMin/>
        <ageMax/>
        <height/>
        <width/>
        <depth/>
        <weight/>
        <category>Normal</category>
        <userRating>0</userRating>
        <EAN/>
        <UPC>042884069827</UPC>
        <lastUpdated>2012-08-25T18:56:10.84</lastUpdated>
        </sets>
        </getSetsResult>
        </getSetsResponse>
        </soap:Body>
        </soap:Envelope>
        """)
    }
    
    static func getInstructions(setId: Int) -> Data {
        return toData(content: """
        <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
        <soap:Body>
        <getInstructionsResponse xmlns="https://brickset.com/api/">
        <getInstructionsResult>
        <instructions>
        <URL>https://www.lego.com/biassets/bi/4105588.pdf</URL>
        <description>BUILDING INSTR. 6982 IN</description>
        </instructions>
        </getInstructionsResult>
        </getInstructionsResponse>
        </soap:Body>
        </soap:Envelope>
        """)
    }
    
    static func toData(content: String) -> Data {
        return content.data(using: String.Encoding.utf8)!
    }
}
