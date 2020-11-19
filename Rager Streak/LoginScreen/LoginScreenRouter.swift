//
//  LoginScreenRouter.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 16/11/20.
//  Copyright (c) 2020 guilherme.martinelli. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol LoginScreenRoutingLogic
{
    func routeToSuccess()
}

protocol LoginScreenDataPassing
{
    var dataStore: LoginScreenDataStore? { get set }
}

class LoginScreenRouter: NSObject, LoginScreenRoutingLogic, LoginScreenDataPassing
{
    weak var viewController: LoginScreenViewController?
    var dataStore: LoginScreenDataStore?
    
    func routeToSuccess() {
        let destination: SecondScreenViewController = UIStoryboard(name: "SecondScreen", bundle: nil).instantiateViewController(withIdentifier: "SecondScreenViewController") as! SecondScreenViewController

        var destinationDS = destination.router?.dataStore
        passData(dataSource: dataStore, destination: &destinationDS)
        viewController?.navigationController?.pushViewController(destination, animated: true)
    }
    
    private func passData(dataSource: LoginScreenDataStore?,
                          destination: inout SecondScreenDataStore?) {
        destination?.user = dataSource?.user
    }
}

