//
//  AppDelegate.swift
//  ClydesdaleChallenge
//
//  Created by Marius Kurgonas on 14/09/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import UIKit
import Swinject

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var assembler: Assembler?
    
    var splitVDel1 = SplitViewDelegate<PersonDetailViewController>()
    var splitVDel2 = SplitViewDelegate<PersonDetailViewController>()
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Create window manually
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = assembleApp()
        window?.makeKeyAndVisible()
        
        // Set theme to current theme (default if no theme was previously set)
        ThemeManager.applyTheme(theme: ThemeManager.currentTheme())
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

// MARK: Swinject
extension AppDelegate {
    func assembleApp() -> UIViewController {
        
        // Init all assemblers
        assembler = Assembler([
            CommonAssembler(),
            RoomsAssembler(),
            PersonDetailAssembler(),
            PeopleAssembler()
            ])
        
        // Init people tab content
        let peopleSplitViewController = UISplitViewController()
        
        let detail = assembler?.resolver.resolve(PersonDetailViewController.self)
        let detailNavigation = UINavigationController(rootViewController: detail!)
        
        let peopleBuilder = assembler?.resolver.resolve(PeopleBuilder.self)
        let peopleView = peopleBuilder?.build(split: peopleSplitViewController, navigation: detailNavigation)
        
        let mainNavigation = UINavigationController(rootViewController: peopleView!)
        
        peopleSplitViewController.viewControllers = [mainNavigation, detailNavigation]
        peopleSplitViewController.tabBarItem = UITabBarItem(title: "Colleagues", image: UIImage(named: "contacts"), tag: 0)
        peopleSplitViewController.preferredDisplayMode = .allVisible
        peopleSplitViewController.delegate = splitVDel1
        
        // Init rooms tab content
        
        let roomsView = assembler?.resolver.resolve(RoomsCollectionView.self)
        let roomsNavigation = UINavigationController(rootViewController: roomsView!)
        roomsNavigation.tabBarItem = UITabBarItem(title: "Rooms", image: UIImage(named: "rooms"), tag: 1)
        let tabController = UITabBarController()
        tabController.viewControllers = [peopleSplitViewController, roomsNavigation]
        return tabController
    }
}

