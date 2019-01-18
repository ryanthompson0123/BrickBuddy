//
//  Envelopes.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/12/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import Foundation

struct BricksetGetInstructionsEnvelope: Decodable {
    let body: BricksetGetInstructionsBody
    
    enum CodingKeys : String, CodingKey {
        case body = "soap:Body"
    }
}

struct BricksetGetInstructionsBody: Decodable {
    let response: BricksetGetInstructionsResponse
    
    enum CodingKeys : String, CodingKey {
        case response = "getInstructionsResponse"
    }
}

struct BricksetGetInstructionsResponse: Decodable {
    let result: BricksetGetInstructionsResult
    
    enum CodingKeys : String, CodingKey {
        case result = "getInstructionsResult"
    }
}

struct BricksetGetInstructionsResult: Decodable {
    let instructions: [BricksetInstructions]
    
    enum CodingKeys : String, CodingKey {
        case instructions = "instructions"
    }
}

struct BricksetGetSetsEnvelope: Decodable {
    let body: BricksetGetSetsBody
    
    enum CodingKeys : String, CodingKey {
        case body = "soap:Body"
    }
}

struct BricksetGetSetsBody: Decodable {
    let response: BricksetGetSetsResponse
    
    enum CodingKeys : String, CodingKey {
        case response = "getSetsResponse"
    }
}

struct BricksetGetSetsResponse: Decodable {
    let result: BricksetGetSetsResult
    
    enum CodingKeys : String, CodingKey {
        case result = "getSetsResult"
    }
}

struct BricksetGetSetsResult: Decodable {
    let sets: [BricksetSet]
    
    enum CodingKeys : String, CodingKey {
        case sets = "sets"
    }
}

struct BricksetRequestEnvelope {
    let method: String
    let parameters: [String: String]?
    
    func getData() -> Data {
        var soapReqXML:String = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
        
        soapReqXML += "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\""
        soapReqXML += " xmlns:xsd =\"http://www.w3.org/2001/XMLSchema\""
        soapReqXML += " xmlns:soap =\"http://schemas.xmlsoap.org/soap/envelope/\">"
        soapReqXML += " <soap:Body>"
        soapReqXML += "<\(method) xmlns=\"https://brickset.com/api/\">"
        soapReqXML += "<apiKey>__APIKEY__</apiKey>"
        
        if let parameters = parameters {
            soapReqXML += parameters.map({ "<\($0.key)>\($0.value)</\($0.key)>" })
                                    .joined()
        }
        
        soapReqXML += "</\(method)>"
        soapReqXML += "</soap:Body>"
        soapReqXML += "</soap:Envelope>"
        
        return soapReqXML.data(using: String.Encoding.utf8)!
    }
    
    static func getHeaders(method: String) -> [String: String] {
        return ["Host": "brickset.com",
                "SOAPAction": "https://brickset.com/api/\(method)",
                "Content-Type": "text/xml;charset=utf-8"]
    }
}

struct BricksetGetSetsRequest {
    let userHash: String?
    let query: String?
    let theme: String?
    let subtheme: String?
    let setNumber: String?
    let year: String?
    let owned: String?
    let wanted: String?
    let orderBy: String?
    let pageSize: String?
    let pageNumber: String?
    let userName: String?
    
    init(query: String, orderBy: String, pageSize: Int, page: Int) {
        self.userHash = nil
        self.query = query
        self.theme = nil
        self.subtheme = nil
        self.setNumber = nil
        self.year = nil
        self.owned = nil
        self.wanted = nil
        self.orderBy = orderBy
        self.pageSize = String(pageSize)
        self.pageNumber = String(page)
        self.userName = nil
    }
    
    init(setNumber: String, orderBy: String, pageSize: Int, page: Int) {
        self.userHash = nil
        self.query = nil
        self.theme = nil
        self.subtheme = nil
        self.setNumber = setNumber
        self.year = nil
        self.owned = nil
        self.wanted = nil
        self.orderBy = orderBy
        self.pageSize = String(pageSize)
        self.pageNumber = String(page)
        self.userName = nil
    }
    
    init(year: String, orderBy: String, pageSize: Int, page: Int) {
        self.userHash = nil
        self.query = nil
        self.theme = nil
        self.subtheme = nil
        self.setNumber = nil
        self.year = year
        self.owned = nil
        self.wanted = nil
        self.orderBy = orderBy
        self.pageSize = String(pageSize)
        self.pageNumber = String(page)
        self.userName = nil
    }
    
    func getParameters() -> [String: String] {
        return [
            "userHash": userHash ?? "",
            "query": query ?? "",
            "theme": theme ?? "",
            "subtheme": subtheme ?? "",
            "setNumber": setNumber ?? "",
            "year": year ?? "",
            "owned": owned ?? "",
            "wanted": wanted ?? "",
            "orderBy": orderBy ?? "",
            "pageSize": pageSize ?? "",
            "pageNumber": pageNumber ?? "",
            "userName": userName ?? ""
        ]
    }
}
