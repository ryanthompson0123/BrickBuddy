//
//  RebrickablePlugins.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/12/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import Foundation
import Moya

struct TokenPlugin: PluginType {
    let token: String
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        request.addValue("key " + token, forHTTPHeaderField: "Authorization")
        return request
    }
}
