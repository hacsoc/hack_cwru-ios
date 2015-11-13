//
//  AnnouncementsController.swift
//  HackCWRU
//
//  Created by Andrew Mason on 5/24/15.
//  Copyright (c) 2015 CWRU Hacker Society. All rights reserved.
//

import UIKit
import Foundation

class AnnouncementsController: UITableViewController {
    var frame:CGRect?
    var announcements:[Announcement]?
    
    init(options: [NSObject : AnyObject]?, frame:CGRect) {
        super.init(nibName: nil, bundle: nil)
        self.frame = frame
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.autoresizingMask = UIViewAutoresizing.None
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        // TODO: use preprocessor flags to swap out a real URL for production.
        // This requires a rails server to be hosting the backend on your dev machine.
        let url = "http://localhost:3000/announcements.json"
        let json:NSArray
        do {
            json = try JSONHelper.parse(HTTPHelper.get(url)) as! NSArray
            announcements = Announcement.collectionFromJSON(json)
        } catch is NSError {
            announcements = [Announcement]()
            print("Error: Unable to load announcements")
        }
        self.view.frame = frame!
        self.tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return announcements!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "")
        let announcement:Announcement = announcements![indexPath.row]
        cell.textLabel!.text = "\(announcement.id)"
        
        return cell
    }
    
}
