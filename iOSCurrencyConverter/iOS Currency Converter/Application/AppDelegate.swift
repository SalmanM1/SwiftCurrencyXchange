//
//  AppDelegate.swift
//  WiseCurrencyConverter
//
//  Created by Roman Resenchuk on 10-08-2023.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func appInitialization(_ application: UIApplication, didFinishInitWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let root = HomeBuilder.build()
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.tintColor = AppTheme.shared.enabledBackgroundColor
        window.rootViewController = root
        window.makeKeyAndVisible()
        self.window = window
        return YES
    }
}
