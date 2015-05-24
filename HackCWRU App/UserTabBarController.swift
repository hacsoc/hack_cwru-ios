//
//  ViewController.swift
//  HackCWRU App
//
//  Created by Adam Gleichsner on 5/20/15.
//  Copyright (c) 2015 CWRU Hacker Society. All rights reserved.
//

import UIKit

// These are all pixel height constants for the NavBar(top, thick),
// TabBar(Bottom), and StatusBar(Very top, detail stuff)
let NAVIGATION_BAR_HEIGHT:CGFloat = 44
let TAB_BAR_HEIGHT:CGFloat = 49
let STATUS_BAR_HEIGHT:CGFloat = 20

/* UserTabBarController
 * Holds all of the controllers for the various main pages (StaticPages,
 * Mentor Request, Staff Request, Group Finder, etc).
 */
class UserTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        //Make sure nothing will auto adjust to available space. 
        //We're running a tight ship here.
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //If this is our first appearance or we've dumped memory, recreate the controllers
        if self.viewControllers == nil {
            self.createChildrenTabs()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //If we aren't presented, we can drop our controllers for now
        if self.isViewLoaded() && self.view.window == nil {
            self.viewControllers = [UIViewController]()
            println("Doing a memory dump in UserTabBarController. How the fuck did you manage that?")
        }
    }
    
    
    /*Create tabs for controller*/
    
    //When creating a new tab, put your setup into a helper method and call it here
    func createChildrenTabs() {
        var tabControllers = [UIViewController]()
        
        //Append your tab to teh controllers, yo
        tabControllers.append(self.createStaticPagesTab())
        
        self.setViewControllers(tabControllers, animated: true)
    }
    
    
    /*Children Tab creation helpers*/
    
    //Create the UIPageViewController for StaticPages
    func createStaticPagesTab() -> UIViewController {
        
        let pageViewController:UserStaticPagesController = UserStaticPagesController(
            transitionStyle: UIPageViewControllerTransitionStyle.Scroll,
            navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal,
            options: nil,
            frame: CGRect(x: 0, y: NAVIGATION_BAR_HEIGHT + STATUS_BAR_HEIGHT, width: self.view.frame.width, height: self.view.frame.height - STATUS_BAR_HEIGHT - NAVIGATION_BAR_HEIGHT - TAB_BAR_HEIGHT)
        )

        //Set the icon for the TabViewController to use
        //TODO: Insert real icon for the StaticPages. And come up with a better name than StaticPages.
        pageViewController.tabBarItem = UITabBarItem(title: "Info", image: UIImage(named: "settings") , selectedImage: UIImage(named: "settings"))
        
        return pageViewController
    }

}

