//
//  RebrickableSet.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/12/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import Foundation

struct RebrickableSet: Decodable {
    let number: String
    let name: String
    let year: Int
    let themeId: Int
    let partCount: Int
    let url: URL
    let imageUrl: URL
    let lastModified: Date
    
    enum CodingKeys : String, CodingKey {
        case number = "set_num"
        case name
        case year
        case themeId = "theme_id"
        case partCount = "num_parts"
        case url = "set_url"
        case imageUrl = "set_img_url"
        case lastModified = "last_modified_dt"
    }
}

struct RebrickableTheme: Decodable {
    let id: Int
    let parentId: Int
    let name: String
    
    enum CodingKeys : String, CodingKey {
        case id
        case parentId = "parent_id"
        case name
    }
}

struct RebrickablePart: Decodable {
    let number: String
    let name: String
    let categoryId: Int
    let url: URL
    let imageUrl: URL
    
    enum CodingKeys : String, CodingKey {
        case number = "part_num"
        case name
        case categoryId = "part_cat_id"
        case url = "part_url"
        case imageUrl = "part_img_url"
    }
}

struct RebrickablePartCategory: Decodable {
    let id: Int
    let name: String
    let partCount: Int
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case partCount = "part_count"
    }
}

struct RebrickableColor: Decodable {
    let id: Int
    let name: String
    let rgb: String
    let isTrans: Bool
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case rgb
        case isTrans = "is_trans"
    }
}
