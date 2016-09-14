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
    static let TVBaseURL = "http://cruzy.co/"
    static let TVBaseURL2 = "http://cruzy.co/images/"
    static let TVBootURL = "\(AppDelegate.TVBaseURL)js/application.js"
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let appControllerContext = TVApplicationControllerContext()
        guard let javaScriptURL = NSURL(string: AppDelegate.TVBootURL) else { fatalError("unable to create NSURL") }
        appControllerContext.javaScriptApplicationURL = javaScriptURL
        appControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL
        appControllerContext.launchOptions["BASEURL2"] = AppDelegate.TVBaseURL2
        appController = TVApplicationController(context: appControllerContext, window: window, delegate: self)
        return true
    }
    
}
