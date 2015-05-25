//
//  AnnouncementsController.swift
//  HackCWRU
//
//  Created by Andrew Mason on 5/24/15.
//  Copyright (c) 2015 CWRU Hacker Society. All rights reserved.
//

import UIKit
import Foundation

class AnnouncmentsController: UIViewController {
    var frame:CGRect?
    
    init(options: [NSObject : AnyObject]?, frame:CGRect) {
        super.init(nibName: nil, bundle: nil)
        self.frame = frame
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.autoresizingMask = UIViewAutoresizing.None
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        // TODO: use preprocessor flags to swap out a real URL for production.
        // This requires a rails server to be hosting the backend on your dev machine.
        let url = NSURL(string: "http://localhost:3000/announcements.json")
        let request:NSURLRequest = NSURLRequest(URL: url!)
        var response:AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
        var error:NSErrorPointer = nil
        var data:NSData = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: error)!
        var json:NSArray =
            NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSArray
        var announcements = Announcement.collectionFromJSON(json)
        println(announcements[0].id)
    }
    
}
