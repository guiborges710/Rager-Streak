//
//  RagersViewController.swift
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

protocol RagersDisplayLogic: class {

}

class RagersViewController: UIViewController, RagersDisplayLogic {

    @IBOutlet weak var tableViewRagers: TableViewRagers!
    @IBOutlet weak var searchRagers: UISearchBar!
    var interactor: RagersBusinessLogic?
    var router: (NSObjectProtocol & RagersRoutingLogic & RagersDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = RagersInteractor()
    let presenter = RagersPresenter()
    let router = RagersRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = RSColor().blackColor()
        doSomething()
        tableViewRagers.createRagers()
        tableViewRagers.delegate = self.tableViewRagers
        tableViewRagers.dataSource = self.tableViewRagers
  }
  
  // MARK: Do something
    private func setupSearchBar() {
        if let textFieldSearchBar = searchRagers.value(forKey: "searchField") as? UITextField {
            textFieldSearchBar.textColor = .white
        }
    }
    
  func doSomething() {
    let request = Ragers.Something.Request()
    interactor?.doSomething(request: request)
    self.navigationController?.setNavigationBarHidden(false, animated: false)
    setupSearchBar()
  }

}
