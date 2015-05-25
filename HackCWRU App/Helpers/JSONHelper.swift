//
//  JSONHelper.swift
//  HackCWRU
//
//  Created by Andrew Mason on 5/24/15.
//  Copyright (c) 2015 CWRU Hacker Society. All rights reserved.
//

import Foundation

class JSONHelper {
    class func parse(data:NSData) -> AnyObject {
        return NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)!
    }
}
