//
//  HTTPHelper.swift
//  HackCWRU
//
//  Created by Andrew Mason on 5/24/15.
//  Copyright (c) 2015 CWRU Hacker Society. All rights reserved.
//

import Foundation

class HTTPHelper {
    // Exectue a GET request. Returns the data returned from the request as NSData.
    // Caller is responsible for knowing how the data should be structured and
    // casting appropratiely.
    //
    // :url: - The URL to which to send the request.
    // :params: (optional) - Any query params to append to the URL.
    class func get(url: String, params: NSDictionary = NSDictionary()) throws -> NSData {
        let url = NSURL(string: url + self.queryString(params))!
        let request = NSURLRequest(URL: url)
        let response:AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
        
        return try NSURLConnection.sendSynchronousRequest(request, returningResponse: response)
    }
    
    // Return a query string to be appended to a URL.
    //
    // Currently does not support nested parameters/dictonaries (i.e. param[sub_param]=blah)
    //
    // :params: - dictionary of param names to values to be in the query string
    private class func queryString(params: NSDictionary) -> String {
        if params.count == 0 {
            return ""
        }
        var query = [String]()
        for (k, v) in params {
            query.append("\(k)=\(v)")
        }
        return "?" + query.joinWithSeparator("&")
    }
}
