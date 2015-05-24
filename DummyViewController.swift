//
//  DummyViewController.swift
//  HackCWRU App
//
//  Created by Adam Gleichsner on 5/23/15.
//  Copyright (c) 2015 CWRU Hacker Society. All rights reserved.
//

import Foundation
import UIKit

/* Uuuuhhhhh
 */
class DummyViewController: UIViewController {
    
    var pageIndex:Int?
    var frame:CGRect?
    var color:UIColor?
    
    init(color: UIColor, withFrame: CGRect) {
        super.init(nibName: nil, bundle: nil)
        self.color = color
        self.frame = withFrame
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        self.view.frame = frame!
        self.view.backgroundColor = color!
    }
}