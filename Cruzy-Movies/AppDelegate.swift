//
//  AppDelegate.swift
//  Cruzy-Movies
//
//  Created by Michael Cruz on 07/01/16.
//  Copyright © 2016 Michael Cruz. All rights reserved.//


import TVMLKit
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, TVApplicationControllerDelegate {
    var window: UIWindow?
    var appController: TVApplicationController?
    static let AWSURL = "https://s3.amazonaws.com/www.cruzy.co/images/Aladdin.jpg"
    static let TVBaseURL = "https://s3.amazonaws.com/www.cruzy.co/s3files/"
    static let TVBootURL = "\(AppDelegate.TVBaseURL)js/application.js"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.main().bounds)
        let appControllerContext = TVApplicationControllerContext()
        guard let javaScriptURL = NSURL(string: AppDelegate.TVBootURL) else { fatalError("unable to create NSURL") }
        appControllerContext.javaScriptApplicationURL = javaScriptURL as URL
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL
        appControllerContext.launchOptions["AWSURL"] = AppDelegate.AWSURL
        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        return true
    }
    
}
