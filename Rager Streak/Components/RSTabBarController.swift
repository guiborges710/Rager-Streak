//
//  RSTabBarController.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 15/12/20.
//  Copyright © 2020 guilherme.martinelli. All rights reserved.
//
import UIKit

class RSTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        customTabBar()
        setTabBarItems()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 78
        tabBar.frame.origin.y = view.frame.height - 76
        tabBar.itemPositioning = .automatic
        tabBar.itemSpacing =  UIScreen.main.bounds.height / 100
        
        
    }
    func customTabBar() {
        let tabBar = self.tabBar
        tabBar.barTintColor = RSColor().grayColor()
        tabBar.tintColor = RSColor().purpleColor()
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        let destination: RagersViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RagersViewController") as! RagersViewController
//
//        var destinationDS = destination.router?.dataStore
//        viewController.navigationController?.pushViewController(destination, animated: true)
        return true;
    }
    
    func setTabBarItems(){
         let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
         myTabBarItem1.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)

         let myTabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
         myTabBarItem2.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
    }
}
