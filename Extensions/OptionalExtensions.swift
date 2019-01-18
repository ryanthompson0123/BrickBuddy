//
//  OptionalExtensiosn.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/14/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    var toInt: Int? {
        if let s = self {
            return Int(s)
        } else {
            return nil
        }
    }
}

extension Optional where Wrapped == Int {
    var toString: String? {
        if let i = self {
            return String(i)
        } else {
            return nil
        }
    }
}
