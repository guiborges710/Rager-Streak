//
//  NewRagerGameRouter.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 16/03/21.
//  Copyright © 2021 guilherme.martinelli. All rights reserved.
//

import UIKit

@objc protocol NewRagerGameRoutingLogic
{
  func routeToNewRagerPhoto()
}

protocol NewRagerGameDataPassing
{
  var dataStore: NewRagerGameDataStore? { get }
}

class NewRagerGameRouter: NSObject, NewRagerGameRoutingLogic, NewRagerGameDataPassing
{
  weak var viewController: NewRagerGameViewController?
  var dataStore: NewRagerGameDataStore?
  
  // MARK: Routing
    func routeToNewRagerPhoto() {
        let destination: NewRagerPhotoViewController = UIStoryboard(name: "NewRager", bundle: nil).instantiateViewController(withIdentifier: "NewRagerPhotoViewController") as! NewRagerPhotoViewController
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }
}
