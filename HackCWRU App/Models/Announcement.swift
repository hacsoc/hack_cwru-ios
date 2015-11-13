//
//  Announcement.swift
//  HackCWRU
//
//  Created by Andrew Mason on 5/24/15.
//  Copyright (c) 2015 CWRU Hacker Society. All rights reserved.
//

import Foundation

class Announcement {
    var id:Int
    var title:String?
    var content:String?
    var location:String?
    
    // TODO: still need to define the announcements API on the backend.
    //       not sure how many of these inits will still be around when
    //       that's done.
    init(id:Int) {
        self.id = id
    }
    
    init (id:Int, title: String, location: String) {
        self.id = id
        self.title = title
        self.location = location
    }

    // Create an Announcement from a JSON object (NSDictionary).
    //
    // TODO: still need to define announcements API on the backend,
    //       then update this function to pull out the correct
    //       attributes.
    //
    // :json: - the JSON object (an NSDictionary)
    class func fromJSON(json:NSDictionary) -> Announcement {
        return Announcement(id: json["id"] as! Int)
    }
    
    // Create a collection of Announcements from an array of
    // JSON objects (NSDictonaries).
    //
    // :json: - the array of JSON objects (NSDictionaries)
    class func collectionFromJSON(json:NSArray) -> [Announcement] {
        var announcements = [Announcement]()
        for e in json {
            announcements.append(Announcement.fromJSON(e as! NSDictionary))
        }
        return announcements
    }
}
