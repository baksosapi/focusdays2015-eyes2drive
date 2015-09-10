//
//  EyeEventHandler.swift
//  eyes2drive viewer
//
//  Created by Michael Spoerri on 10.09.15.
//  Copyright (c) 2015 Focusdays2015. All rights reserved.
//

import Foundation
import UIKit


let eyeHandler = EyeEventHandler()

class EyeEventHandler : EyeEventHandlerProtocol {
    
    var tripsRepo:Trips = Trips()
    
    func addEvent(type: Event, delay: Bool){
        UIApplication.sharedApplication().registerUserNotificationSettings(UIUserNotificationSettings(forTypes: .Alert | .Badge | .Sound, categories: nil))
        var notification = UILocalNotification()
        notification.alertBody = "Hallo Welt" // text that will be displayed in the notification
        notification.alertAction = "open" // text that is displayed after "slide to..." on the lock screen - defaults to "slide to view"
        
        var offsetSec = 0;
        if delay {
            offsetSec = 3000;
        }
        var now = NSDate().dateByAddingTimeInterval(NSTimeInterval(offsetSec))
        notification.fireDate = now // todo item due date (when notification will be fired)
        
        
        notification.soundName = UILocalNotificationDefaultSoundName // play default sound
        notification.userInfo = ["UUID": 12345, ] // assign a unique identifier to the notification so that we can retrieve it later
        //notification.category = "TODO_CATEGORY"
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
        
    }
    
    func startTrip(){
        tripsRepo.startAndAddNewTrip()
        
    }
    
    func endTrip(){
        tripsRepo.stopCurrentTrip()
        
    }
}