//
//  BricksetService.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/12/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import Foundation
import Moya

enum BricksetService {
    case getSets(query: String, orderBy: String, pageSize: Int, page: Int)
    case getSetsByNumber(setNumber: String, orderBy: String, pageSize: Int, page: Int)
    case getSetsByYear(year: String, orderBy: String, pageSize: Int, page: Int)
    case getInstructions(setId: Int)
}

extension BricksetService: TargetType {
    var baseURL: URL { return URL(string: "https://brickset.com")! }
    var path: String {
        return "/api/v2.asmx"
    }
    var method: Moya.Method {
        return .post
    }
    var task: Task {
        switch self {
        case let .getSets(query, orderBy, pageSize, page):
            let getSetsRequest = BricksetGetSetsRequest(query: query, orderBy: orderBy, pageSize: pageSize, page: page)
            let envelope = BricksetRequestEnvelope(method: "getSets", parameters: getSetsRequest.getParameters())
            return .requestData(envelope.getData())
        case let .getSetsByNumber(setNumber, orderBy, pageSize, page):
            let getSetsRequest = BricksetGetSetsRequest(setNumber: setNumber, orderBy: orderBy, pageSize: pageSize, page: page)
            let envelope = BricksetRequestEnvelope(method: "getSets", parameters: getSetsRequest.getParameters())
            return .requestData(envelope.getData())
        case let .getSetsByYear(year, orderBy, pageSize, page):
            let getSetsRequest = BricksetGetSetsRequest(year: year, orderBy: orderBy, pageSize: pageSize, page: page)
            let envelope = BricksetRequestEnvelope(method: "getSets", parameters: getSetsRequest.getParameters())
            return .requestData(envelope.getData())
        case let .getInstructions(setId):
            let envelope = BricksetRequestEnvelope(method: "getInstructions", parameters: ["setID": String(setId)])
            return .requestData(envelope.getData())
        }
    }
    var sampleData: Data {
        switch self {
        case .getSets(let query, _, _, _):
            return BricksetSampleData.getSets(query: query)
        case .getSetsByYear(let year, _, _, _):
            return BricksetSampleData.getSetsByYear(year: year)
        case .getSetsByNumber(let setNumber, _, _, _):
            return BricksetSampleData.getSetsByNumber(setNumber: setNumber)
        case .getInstructions(let setId):
            return BricksetSampleData.getInstructions(setId: setId)
        }
    }
    var headers: [String: String]? {
        switch self {
        case .getSets, .getSetsByNumber, .getSetsByYear:
            return BricksetRequestEnvelope.getHeaders(method: "getSets")
        case .getInstructions:
            return BricksetRequestEnvelope.getHeaders(method: "getInstructions")
        }
    }
}
