//
//  HackCWRU_AppTests.swift
//  HackCWRU AppTests
//
//  Created by Adam Gleichsner on 5/20/15.
//  Copyright (c) 2015 CWRU Hacker Society. All rights reserved.
//

import UIKit
import XCTest

class HackCWRU_AppTests: XCTestCase {
    
    var nc:UINavigationController?
    
    override func setUp() {
        super.setUp()
        let rootVC = UIViewController()
        nc = UINavigationController(rootViewController: rootVC)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDummyController() {
        let red = UIColor.redColor()
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        var dummy = DummyViewController(color: red, withFrame: frame)
        
        XCTAssert(dummy.frame == frame, "Didn't set frame")
        XCTAssert(dummy.color == red, "Didn't set color")
        
        //Simulate the presentation so we can check if frame and color get set in the view
        nc?.presentViewController(dummy, animated: false, completion: nil)

        XCTAssert(dummy.view.frame == frame, "Didn't set view frame upon presentation")
        XCTAssert(dummy.view.backgroundColor == red, "Didn't set view background color upon presentation")
    }
    
    func testAttendeeInformationController() {
        let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        var statics = AttendeeInformationController(transitionStyle: UIPageViewControllerTransitionStyle.Scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.Horizontal, options: nil, frame: frame)
        
        XCTAssert(statics.frame == frame, "Didn't set frame")
        
        nc?.presentViewController(statics, animated: false, completion: nil)
        
        XCTAssert(statics.view.frame == frame, "Didn't set view frame upon presentation")
        statics.createPages()
        XCTAssert(statics.controllers.count > 0, "Didn't create any controllers")
        
        statics.didReceiveMemoryWarning()
        if statics.isViewLoaded() && statics.view.window == nil {
            XCTAssert(statics.controllers.count == 0, "Didn't dump controllers on memory warning")
        } else {
            XCTAssert(statics.controllers.count > 0, "Dumped controllers despite being visible")
        }
        
        //Test disableControllerResizing
        let vc1 = UIViewController()
        let vc2 = UIViewController()
        XCTAssert(vc1.automaticallyAdjustsScrollViewInsets, "ViewController already doesn't adjust ScrollViewInsets")
        XCTAssert(vc2.automaticallyAdjustsScrollViewInsets, "ViewController already doesn't adjust ScrollViewInsets")

        let controllers = [vc1, vc2]
        
        statics.disableControllerResizing(controllers)
        XCTAssert(!vc1.automaticallyAdjustsScrollViewInsets, "Didn't set adjustScrollViewInsets to false in vc1")
        XCTAssert(!vc2.automaticallyAdjustsScrollViewInsets, "Didn't set adjustScrollViewInsets to false in vc1")
    }

    func testUserTabBarController() {
        
        var tabs = UserTabBarController()
        
        let statics = tabs.createAttendeeInformationTab()
        XCTAssert(statics.isKindOfClass(AttendeeInformationController), "Didn't make a UserStaticPagesController")
        
        tabs.createChildrenTabs()
        XCTAssert(tabs.viewControllers?.count > 0, "Didn't create any children tabs")
        
        tabs.didReceiveMemoryWarning()
        if tabs.isViewLoaded() && tabs.view.window == nil {
            XCTAssert(tabs.viewControllers?.count == 0, "Didn't dump controllers on memory warning")
        } else {
            XCTAssert(tabs.viewControllers?.count > 0, "Dumped controllers despite being visible")
        }
    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measureBlock() {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
