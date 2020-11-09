//
//  AppDelegate.swift
//  GoogleMapsTest
//
//  Created by Developer H on 2020/11/8.
//

import UIKit
import GoogleMaps

let kAPIKey = "AIzaSyB4uPX7Lc5PxA1atuSsp1ebXekx7-mt0xA"
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var backgrounTask: UIBackgroundTaskIdentifier?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey(kAPIKey)
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        
        self.backgrounTask = application.beginBackgroundTask(expirationHandler: {
            application.endBackgroundTask(self.backgrounTask!)
            self.backgrounTask = .invalid
        })
        LocationTool.share.startLocation()

    }
}

