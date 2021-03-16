//
//  RagersInteractor.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 15/12/20.
//  Copyright (c) 2020 guilherme.martinelli. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol RagersBusinessLogic
{
  func doSomething(request: Ragers.Something.Request)
}

protocol RagersDataStore
{
  //var name: String { get set }
}

class RagersInteractor: RagersBusinessLogic, RagersDataStore
{
  var presenter: RagersPresentationLogic?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Ragers.Something.Request)
  {

  }
}