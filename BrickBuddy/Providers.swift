//
//  WebAPIs.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/21/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import Foundation
import Moya

class Providers {
    
    static func getBricksetProvider() -> MoyaProvider<BricksetService> {
        return MoyaProvider<BricksetService>(plugins: [SoapApiKeyPlugin(apiKey: "tobz-odt6-llVF")])
    }
}
