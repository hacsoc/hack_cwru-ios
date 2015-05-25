//
//  JSONHelper.swift
//  HackCWRU
//
//  Created by Andrew Mason on 5/24/15.
//  Copyright (c) 2015 CWRU Hacker Society. All rights reserved.
//

import Foundation

class JSONHelper {
    // Parses an NSData object as JSON. Returns an AnyObject. Caller is responsible
    // for knowing how the data should be structured and casting appropriately.
    //
    // :data: - the data to be parsed.
    class func parse(data:NSData) -> AnyObject {
        return NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)!
    }
}
