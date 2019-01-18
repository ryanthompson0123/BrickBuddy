//
//  BricksetPlugins.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/13/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import Foundation
import Moya

struct SoapApiKeyPlugin: PluginType {
    let apiKey: String
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        if let body = request.httpBody {
            let bodyString = String(data: body, encoding: String.Encoding.utf8)
            let newBodyString = bodyString?.replacingOccurrences(of: "__APIKEY__", with: apiKey)
            request.httpBody = newBodyString?.data(using: String.Encoding.utf8)
        }
        
        return request
    }
}
