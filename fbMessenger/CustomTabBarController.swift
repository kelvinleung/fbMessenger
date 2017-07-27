//
//  CustomTabBarController.swift
//  fbMessenger
//
//  Created by Kelvin Leung on 28/07/2017.
//  Copyright © 2017 Kelvin Leung. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let friendsController = FriendsController(collectionViewLayout: layout)
        let recentMessagesNavController = UINavigationController(rootViewController: friendsController)
        
        recentMessagesNavController.tabBarItem.title = "Recent"
        recentMessagesNavController.tabBarItem.image = UIImage(named: "recent")
        
        let callsNavController = createEmptyNavController(title: "Calls", imageName: "calls")
        let groupsNavController = createEmptyNavController(title: "Groups", imageName: "groups")
        let peopleNavController = createEmptyNavController(title: "People", imageName: "people")
        let settingsNavController = createEmptyNavController(title: "Settings", imageName: "settings")
        
        viewControllers = [recentMessagesNavController, callsNavController, groupsNavController, peopleNavController, settingsNavController]
    }
    
    private func createEmptyNavController(title: String, imageName: String) -> UINavigationController {
        let viewController = UIViewController()
        viewController.view.backgroundColor = UIColor.white
        viewController.navigationItem.title = title
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
}
