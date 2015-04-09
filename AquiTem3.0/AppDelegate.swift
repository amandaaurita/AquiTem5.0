//
//  AppDelegate.swift
//  AquiTem3.0
//
//  Created by Amanda Aurita Araujo Fernandes on 3/25/15.
//  Copyright (c) 2015 Amanda Aurita Araujo Fernandes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //representa a primeira seta do storyboard
    var window: UIWindow = UIWindow(frame: UIScreen.mainScreen().bounds)
    //tamanho da tela do dispositivo em uso
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        var tabBarController = UITabBarController()
        tabBarController.tabBar.barStyle = UIBarStyle.Black
        tabBarController.tabBar.tintColor = UIColor.yellowColor()
        
        var mapVC = MapVC (nibName: "MapVC", bundle: nil)
        var custumerNavigationController = UINavigationController(rootViewController: mapVC)
        custumerNavigationController.navigationBar.barStyle = UIBarStyle.Black
        custumerNavigationController.navigationBar.tintColor = UIColor.yellowColor()
        
        var sellerListVC = SellerListVC(nibName: "SellerListVC", bundle: nil)
        var catalogNavigationController = UINavigationController(rootViewController: sellerListVC)
        catalogNavigationController.navigationBar.barStyle = UIBarStyle.Black
        catalogNavigationController.navigationBar.tintColor = UIColor.yellowColor()
        
        var loginVC = LoginVC(nibName: "LoginVC", bundle: nil)
        var sellerNavigationController = UINavigationController(rootViewController: loginVC)
        sellerNavigationController.navigationBar.barStyle = UIBarStyle.Black
        sellerNavigationController.navigationBar.tintColor = UIColor.yellowColor()
        
        var controllers = [custumerNavigationController, catalogNavigationController, sellerNavigationController]
        tabBarController.viewControllers = controllers
        
        let tabItems = tabBarController.tabBar.items as [UITabBarItem]
        let tabItem0 = tabItems[0] as UITabBarItem
        let tabItem1 = tabItems[1] as UITabBarItem
        let tabItem2 = tabItems[2] as UITabBarItem
        tabItem0.title = "Mapa"
        tabItem1.title = "Catálogo"
        tabItem2.title = "Vender"
        tabItem0.image = UIImage(named:"Icone1.png")
        tabItem1.image = UIImage(named:"Icone2.png")
        tabItem2.image = UIImage(named:"Icone3.png")

        self.window.rootViewController = tabBarController
        self.window.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

