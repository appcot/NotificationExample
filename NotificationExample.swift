//
//  NotificationExample.swift
//  NotificationExample
//
//  Created by appcot on 2017/07/31.
//  Copyright © 2017年 appcot. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    private var center: UNUserNotificationCenter? = nil
    private var identifierNames = [String]()
    
    func createCalendarNotificationRequest(identifier: String, title: String, body: String, sound: UNNotificationSound, schedule: DateComponents, repeatOption: Bool) -> UNNotificationRequest{

        var content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = sound
        
        var date = schedule
        
        var trigger = UNCalendarNotificationTrigger.init(
            dateMatching: date,
            repeats: repeatOption
        )
        
        var request = UNNotificationRequest.init(
            identifier: identifier,
            content: content,
            trigger: trigger
        )
        return request
    }
    
    func addRequest(request: UNNotificationRequest) {
        self.center = UNUserNotificationCenter.current()
        self.center?.add(request)
        self.identifierNames.append(request.identifier)
    }
    
    func addRequests(requests: [UNNotificationRequest]) {
        for request in requests {
            self.center = UNUserNotificationCenter.current()
            self.center?.add(request)
            self.identifierNames.append(request.identifier)
        }
    }
    
    func getPendingRequestsName() -> [String] {
        return self.identifierNames
    }
    
}
