//
//  SplashRouter.swift
//  ShopClient
//
//  Created by Evgeniy Antonov on 10/6/17.
//  Copyright (c) 2017 Evgeniy Antonov. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol SplashRoutingLogic {
    func routeToHome()
}

protocol SplashDataPassing {
    var dataStore: SplashDataStore? { get }
}

class SplashRouter: NSObject, SplashRoutingLogic, SplashDataPassing {
    weak var viewController: SplashViewController?
    var dataStore: SplashDataStore?
    
    // MARK: Routing
    func routeToHome() {
        let appDelegate  = UIApplication.shared.delegate as! AppDelegate
        let navigationController = appDelegate.window!.rootViewController as! UINavigationController
        let homeViewController = UIStoryboard.home().instantiateViewController(withIdentifier: ControllerIdentifier.home) as! HomeViewController
        homeViewController.addMenuBarButton()
        navigateToHome(source: navigationController, destination: homeViewController)
    }
    
    // MARK: Navigation
    func navigateToHome(source: UINavigationController, destination: HomeViewController) {
        source.setViewControllers([destination], animated: false)
    }
}
