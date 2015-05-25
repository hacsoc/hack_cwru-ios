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
    
    init(id:Int) {
        self.id = id
    }
    
    init (id:Int, title: String, location: String) {
        self.id = id
        self.title = title
        self.location = location
    }

    class func fromJSON(json:NSDictionary) -> Announcement {
        return Announcement(id: json["id"] as! Int)
    }
    
    class func collectionFromJSON(json:NSArray) -> [Announcement] {
        var announcements = [Announcement]()
        for e in json {
            announcements.append(Announcement.fromJSON(e as! NSDictionary))
        }
        return announcements
    }
}
