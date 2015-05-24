//
//  UserStaticPagesController.swift
//  HackCWRU App
//
//  Created by Adam Gleichsner on 5/23/15.
//  Copyright (c) 2015 CWRU Hacker Society. All rights reserved.
//

import Foundation
import UIKit

class UserStaticPagesController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var controllers = [UIViewController]()
    var frame:CGRect?
    
    init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [NSObject : AnyObject]?, frame:CGRect) {
        
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
        
        self.frame = frame
        self.dataSource = self
        self.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.autoresizingMask = UIViewAutoresizing.None

        let first = DummyViewController(color: UIColor.blueColor(), withFrame: self.frame!)
        first.pageIndex = 0
        
        let second = DummyViewController(color: UIColor.redColor(), withFrame: self.frame!)
        second.pageIndex = 1
        
        controllers.append(first)
        controllers.append(second)
        
        self.disableControllerResizing(controllers)
        
        self.setViewControllers([controllers[0]], direction: UIPageViewControllerNavigationDirection.Forward , animated: false, completion: nil)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = frame!
        self.view.backgroundColor = UIColor.greenColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(false)
        self.view.frame = frame!
    }
    
    func disableControllerResizing(controllers:[UIViewController]) {
        for vc in controllers {
            vc.view.autoresizingMask = UIViewAutoresizing.None
            vc.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var index:Int = 0
        
        if let vc = viewController as? DummyViewController {
            index = vc.pageIndex!
        }
        
        if index == 0 {
            return nil
        }
        
        index--
        return controllers[index]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {

        var index:Int = 0
        
        if let vc = viewController as? DummyViewController {
            index = vc.pageIndex!
        }
        
        
        if index == controllers.count - 1 {
            return nil
        }
        
        index++
        return controllers[index]
    }
    
}