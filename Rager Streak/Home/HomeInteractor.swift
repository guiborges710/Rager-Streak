//
//  HomeInteractor.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 20/11/20.
//  Copyright (c) 2020 guilherme.martinelli. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomeBusinessLogic
{
  func doSomething(request: Home.Something.Request)
}

protocol HomeDataStore
{
  //var name: String { get set }
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore
{
  var presenter: HomePresentationLogic?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Home.Something.Request)
  {
    
    let response = Home.Something.Response()
    presenter?.presentSomething(response: response)
  }
}