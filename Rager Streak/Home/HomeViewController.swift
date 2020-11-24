//
//  HomeViewController.swift
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

protocol HomeDisplayLogic: class
{
  func displaySomething(viewModel: Home.Something.ViewModel)
}

class HomeViewController: UIViewController, HomeDisplayLogic
{
  var interactor: HomeBusinessLogic?
  var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?

  // MARK: Object lifecycle
  
    
    @IBOutlet weak var viewDefeats: UIView!
    @IBOutlet weak var viewVictories: UIView!
    @IBOutlet weak var viewRages: UIView!
    @IBOutlet weak var userImage: UIImageView!
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    self.navigationController?.setNavigationBarHidden(false, animated: false)
    
    setupRightButtonNavBar()
    setupLeftButtonNavBar()
    setupViews(circleView: viewRages, color: RSColor().purpleColor())
    setupViews(circleView: viewDefeats, color: RSColor().redColor())
    setupViews(circleView: viewVictories, color: RSColor().greenColor())

    userImage.makeRounded()
    doSomething()
    }
    
    @objc
    func action(sender: UIBarButtonItem) {
        
    }

    
    func doSomething()
    {
        let request = Home.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Home.Something.ViewModel)
    {
        //nameTextField.text = viewModel.name
    }
    
    func setupViews(circleView: UIView, color: UIColor) {
        circleView.layer.cornerRadius = 41
        circleView.layer.borderColor = color.cgColor
        circleView.layer.borderWidth = 2
    }
    
}

extension HomeViewController {
    func setupRightButtonNavBar() {
        let img = UIImage(named: "editIcon")!.withRenderingMode(.alwaysOriginal)
        let rightButton = UIBarButtonItem(image: img,
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(self.action))
        self.navigationItem.rightBarButtonItem = rightButton

    }
    
    func setupLeftButtonNavBar() {
        let img = UIImage(named: "backButton")!.withRenderingMode(.alwaysOriginal)
        let leftButton = UIBarButtonItem(image: img,
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(self.action))
        self.navigationItem.leftBarButtonItem = leftButton
    }
    
}