//
//  ViewController.swift
//  HackCWRU App
//
//  Created by Adam Gleichsner on 5/20/15.
//  Copyright (c) 2015 CWRU Hacker Society. All rights reserved.
//

import UIKit

class UserTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.createChildrenTabs()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Create tabs for controller
    func createChildrenTabs() {
        var tabControllers = [UIViewController]()
        
        tabControllers.append(self.createStaticPagesTab())
        
        self.setViewControllers(tabControllers, animated: true)
        
//        self.presentViewController(self.createStaticPagesTab(), animated: true, completion: nil)
    }
    
    //Children Tab creation helpers
    
    //Create the static pages
    func createStaticPagesTab() -> UIViewController {
        let pageViewController:UserStaticPagesController = UserStaticPagesController(
            transitionStyle: UIPageViewControllerTransitionStyle.Scroll,
            navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal,
            options: nil)
        pageViewController.tabBarItem = UITabBarItem(title: "Info", image: UIImage(named: "settings") , selectedImage: UIImage(named: "settings"))
        
        return pageViewController
    }

}

