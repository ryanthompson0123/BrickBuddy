//
//  RebrickableEnvelopes.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/12/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import Foundation

struct RebrickableGetSetsRequest {
    let page: String
    let pageSize: String
    let themeId: Int
    let minYear: Int
    let maxYear: Int
    let minParts: Int
    let maxParts: Int
    let ordering: String
    let search: String
}
