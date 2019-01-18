//
//  RebrickableService.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/12/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import Foundation
import Moya

enum RebrickableService {
    case getColors
    case getColor(id: Int)
    case getPartCategories
    case getPartCategory(id: Int)
    case getParts(setNumber: String)
    case getPart(partNumber: String)
    case getSets(search: String, ordering: String, pageSize: Int, page: Int)
    case getSetsByYear(minYear: Int, maxYear: Int, ordering: String, pageSize: Int, page: Int)
    case getSetsByTheme(themeId: Int, ordering: String, pageSize: Int, page: Int)
    case getThemes
    case getTheme(id: Int)
}

extension RebrickableService: TargetType {
    var baseURL: URL { return URL(string: "https://rebrickable.com")! }
    var path: String {
        switch self {
        case .getColors:
            return "/api/v3/lego/colors/"
        case .getColor(let id):
            return "/api/v3/lego/colors/\(id)/"
        case .getPartCategories:
            return "/api/v3/lego/part_categories/"
        case .getPartCategory(let id):
            return "/api/v3/lego/part_categories/\(id)/"
        case .getParts(let setNumber):
            return "/api/v3/lego/sets/\(setNumber)/parts/"
        case .getPart(let partNumber):
            return "/api/v3/lego/parts/\(partNumber)/"
        case .getSets(_, _, _, _), .getSetsByYear(_, _, _, _, _), .getSetsByTheme(_, _, _, _):
            return "/api/v3/lego/sets/"
        case .getThemes:
            return "/api/v3/lego/themes/"
        case .getTheme(let id):
            return "/api/v3/lego/themes/\(id)/"
        }
    }
    var method: Moya.Method {
        return .get
    }
    var task: Task {
        switch self {
        case .getColors, .getColor, .getPartCategories, .getPartCategory:
            return .requestPlain
        case .getParts, .getPart, .getThemes, .getTheme:
            return .requestPlain
        case let .getSets(search, ordering, pageSize, page):
            return .requestParameters(parameters: [
                "page": page,
                "page_size": pageSize,
                "ordering": ordering,
            "search": search], encoding: URLEncoding.queryString)
        case let .getSetsByYear(minYear, maxYear, ordering, pageSize, page):
            return .requestParameters(parameters: [
                "page": page,
                "page_size": pageSize,
                "ordering": ordering,
                "min_year": minYear,
                "max_year": maxYear], encoding: URLEncoding.queryString)
        case let .getSetsByTheme(themeId, ordering, pageSize, page):
            return .requestParameters(parameters: [
                "page": page,
                "page_size": pageSize,
                "ordering": ordering,
                "theme_id": themeId], encoding: URLEncoding.queryString)
        }
    }
    var sampleData: Data {
        switch self {
        case .getColors:
            return RebrickableSampleData.getColors()
        case .getColor(let id):
            return RebrickableSampleData.getColor(id: id)
        case .getPartCategories:
            return RebrickableSampleData.getPartCategories()
        case .getPartCategory(let id):
            return RebrickableSampleData.getPartCategory(id: id)
        case .getParts(let setNumber):
            return RebrickableSampleData.getParts(setNumber: setNumber)
        case .getPart(let partNumber):
            return RebrickableSampleData.getPart(partNumber: partNumber)
        case .getThemes:
            return RebrickableSampleData.getThemes()
        case .getTheme(let id):
            return RebrickableSampleData.getTheme(id: id)
        case .getSets(let search, let ordering, let pageSize, let page):
            return RebrickableSampleData.getSets(search: search, ordering: ordering, pageSize: pageSize, page: page)
        case .getSetsByYear(let minYear, let maxYear, let ordering, let pageSize, let page):
            return RebrickableSampleData.getSetsByYear(minYear: minYear, maxYear: maxYear, ordering: ordering, pageSize: pageSize, page: page)
        case .getSetsByTheme(let themeId, let ordering, let pageSize, let page):
            return RebrickableSampleData.getSetsByTheme(themeId: themeId, ordering: ordering, pageSize: pageSize, page: page)
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
