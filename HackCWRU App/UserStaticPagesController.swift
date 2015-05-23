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

    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [NSObject : AnyObject]?) {
        
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)

        let hackathonSchedule:HackathonScheduleController = HackathonScheduleController()
        let challengeLink:UIViewController = UIViewController()
        let testView:UIImageView = UIImageView(image: UIImage(named: "settings"))
        testView.frame = CGRect(x: 100, y: 100, width: 30, height: 30)
        challengeLink.view.addSubview(testView)
        
        controllers.append(hackathonSchedule)
        controllers.append(challengeLink)
        
        self.setViewControllers([challengeLink], direction: UIPageViewControllerNavigationDirection.Forward , animated: true, completion: nil)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var index:Int
        
        if let vc = viewController as? HackathonScheduleController {
            index = vc.pageIndex
        } else {// if viewController.isKindOfClass(SuitorsViewController class]]) {
            index = 1
        }
        
        
        if index == 0 {
            return nil
        }
        
        index--
        return controllers[index]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {

        var index:Int
        
        if let vc = viewController as? HackathonScheduleController {
            index = vc.pageIndex
        } else {// if viewController.isKindOfClass(SuitorsViewController class]]) {
            index = 1
        }
        
        
        if index == controllers.count {
            return nil
        }
        
        index++
        return controllers[index]
    }
    
}