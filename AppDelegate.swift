//
//  AppDelegate.swift
//  NotificationExample
//
//  Created by appcot on 2017/07/31.
//  Copyright © 2017年 appcot. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let notificationClient = NotificationManager()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if #available(iOS 10.0, *) {
            // iOS 10
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
                if error != nil {
                    return
                }
                
                if granted {
                    debugPrint("通知許可")
                } else {
                    debugPrint("通知拒否")
                }
            })
            let req1 = notificationClient.createCalendarNotificationRequest(identifier: "TestNotify", title: "Test", body: "Body",sound: UNNotificationSound.default(), schedule: DateComponents(month:7, day:31, hour:22, minute:59, second:10), repeatOption: false)
            
            let req2 = notificationClient.createCalendarNotificationRequest(identifier: "TestNotify2", title: "Test2", body: "Body2",sound: UNNotificationSound.default(), schedule: DateComponents(month:7, day:31, hour:22, minute:59, second:30), repeatOption: false)
            
            
            notificationClient.addRequests(requests: [req1, req2])
            
        } else {
            // iOS 9
            let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        print(notificationClient.getPendingRequestsName())

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

