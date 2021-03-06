//
//  AppDelegate.swift
//  CSProgressHUD-Demo
//
//  Created by Tung Thanh Nguyen on 4/25/17.
//  Copyright © 2017 Comtasoft. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
	{
		self.window = UIWindow(frame: UIScreen.main.bounds)
		self.window?.rootViewController = UINavigationController(rootViewController: ViewController())
		self.window?.makeKeyAndVisible()
		return true
	}

	func applicationWillResignActive(_ application: UIApplication)
	{
	}

	func applicationDidEnterBackground(_ application: UIApplication)
	{
	}

	func applicationWillEnterForeground(_ application: UIApplication)
	{
	}

	func applicationDidBecomeActive(_ application: UIApplication)
	{
	}

	func applicationWillTerminate(_ application: UIApplication)
	{
	}
}

