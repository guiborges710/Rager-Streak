//
//  LoginScreenViewController.swift
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

protocol LoginScreenDisplayLogic: class {
    func routeToSecondScreen()
    func passwordCorrect()
    func passwordIncorrect(textFieldViewModel: LoginScreen.Model.LabelViewModel)
}

class LoginScreenViewController: UIViewController, LoginScreenDisplayLogic {
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var message: UILabel!
    var interactor: LoginScreenBusinessLogic?
    var router: (NSObjectProtocol & LoginScreenRoutingLogic & LoginScreenDataPassing)?
    
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
        let interactor = LoginScreenInteractor()
        let presenter = LoginScreenPresenter()
        let router = LoginScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
    }
    // MARK: Routing
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
      if let scene = segue.identifier {
        let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
        if let router = router, router.responds(to: selector) {
          router.perform(selector, with: segue)
        }
      }
    }
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        password.text = "Gui"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    // MARK: Do something
    func routeToSecondScreen() {
        router?.routeToSuccess()
    }
    
    func passwordCorrect() {
        routeToSecondScreen()
    }
    
    func passwordIncorrect(textFieldViewModel: LoginScreen.Model.LabelViewModel) {
        message.changeText(string: textFieldViewModel.textMessage,
                           color: textFieldViewModel.colorMessage)
    }
    
    @IBAction func confirmPassword(_ sender: Any) {
        interactor?.confirmPassword(string: password.text)
    }
}
