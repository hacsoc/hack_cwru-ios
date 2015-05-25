//
//  HTTPHelper.swift
//  HackCWRU
//
//  Created by Andrew Mason on 5/24/15.
//  Copyright (c) 2015 CWRU Hacker Society. All rights reserved.
//

import Foundation

class HTTPHelper {
    class func get(url: String, params: NSDictionary = NSDictionary()) -> NSData {
        let url = NSURL(string: url + self.queryString(params))!
        let request = NSURLRequest(URL: url)
        var response:AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
        var error:NSErrorPointer = nil
        
        return NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: error)!
    }
    
    private class func queryString(params: NSDictionary) -> String {
        if params.count == 0 {
            return ""
        }
        var query = [String]()
        for (k, v) in params {
            query.append("\(k)=\(v)")
        }
        return "?" + join("&", query)
    }
}
