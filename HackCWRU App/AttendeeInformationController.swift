//
//  AttendeeInformationController.swift
//  HackCWRU App
//
//  Created by Adam Gleichsner on 5/23/15.
//  Copyright (c) 2015 CWRU Hacker Society. All rights reserved.
//

import UIKit

/* AttendeeInformationController
 * UIPageViewController to hold all of the StaticPages (i.e. Hackathon Schedule,
 * ChallengePost and EventBrite links, Menu, Sponsors, etc.)
 */
class AttendeeInformationController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var controllers = [UIViewController]()
    var frame:CGRect?
    
    //Custom initializer to send in a frame yay
    init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [NSObject : AnyObject]?, frame:CGRect) {
        
        super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: options)
        
        self.frame = frame
        self.dataSource = self
        self.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.autoresizingMask = UIViewAutoresizing.None
    }

    //Required by Swift. Why? Because.
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //If this is our first appearance or we've dumped memory, recreate the controllers
        if self.viewControllers == nil || self.controllers.count == 0 {
            self.createPages()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //If we aren't presented, we can drop our controllers for now
        if self.isViewLoaded() && self.view.window == nil {
            self.controllers = [UIPageViewController]()
            println("Doing a memory dump in AttendeeInformationController. Good fucking job.")
        }
    }
    
    //Once the view is loaded, then you have my permission to set the frame.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = frame!
        self.view.backgroundColor = UIColor.greenColor() //This is only here to visualize the boundaries of the PVC
    }
    
    //Enforce dat frame
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(false)
        self.view.frame = frame!
    }
    
    /* Page Creation */
    func createPages() {
        self.controllers = [UIPageViewController]()
        
        controllers.append(self.createDummy(UIColor.redColor()))
        controllers.append(self.createDummy(UIColor.blueColor()))
        
        self.disableControllerResizing(controllers)
        
        self.setViewControllers([controllers[0]], direction: UIPageViewControllerNavigationDirection.Forward , animated: false, completion: nil)
        
    }
    
    /* Page helper methods */
    
    func createDummy (color: UIColor) -> UIViewController {
        
        let dummy = DummyViewController(color: color, withFrame: self.frame!)
        dummy.pageIndex = self.controllers.count
        
        return dummy
    }
    
    //Disable autoresizing because that shit is dumb sometimes
    func disableControllerResizing(controllers:[UIViewController]) {
        for vc in controllers {
            vc.automaticallyAdjustsScrollViewInsets = false
        }
    }
    
    
    /* UIPageViewController DataSource Delegate Methods */
    
    //Get the previous or next controller until you hit the end
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