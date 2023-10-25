//
//  HomePresenter.swift
//  Rager Streak
//
//  Created by Guilherme Borges Saes Nolasco Martinelli on 25/10/23.
//  Copyright © 2023 guilherme.martinelli. All rights reserved.
//

import UIKit

protocol HomePresentationLogic
{
  func presentSomething(response: Home.Something.Response)
}

class HomePresenter: HomePresentationLogic
{
  weak var viewController: HomeDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Home.Something.Response)
  {
    let viewModel = Home.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
