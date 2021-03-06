//
//  NewRagerRouter.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 17/12/20.
//  Copyright (c) 2020 guilherme.martinelli. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol NewRagerRoutingLogic
{
  func routeToNewRagerGame()
}

protocol NewRagerDataPassing
{
  var dataStore: NewRagerDataStore? { get }
}

class NewRagerRouter: NSObject, NewRagerRoutingLogic, NewRagerDataPassing
{
  weak var viewController: NewRagerViewController?
  var dataStore: NewRagerDataStore?
  
  // MARK: Routing
    func routeToNewRagerGame() {
        let destination: NewRagerGameViewController = UIStoryboard(name: "NewRager", bundle: nil).instantiateViewController(withIdentifier: "NewRagerGameViewController") as! NewRagerGameViewController
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }
    
    
}
