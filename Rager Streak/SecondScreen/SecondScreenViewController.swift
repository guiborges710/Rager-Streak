//
//  SecondScreenViewController.swift
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

protocol SecondScreenDisplayLogic: class {
    func setupButtonAndInput(viewModelButton: FirstScreen.Model.RSButton, viewModelInput: FirstScreen.Model.RSInput)
}

class SecondScreenViewController: UIViewController, SecondScreenDisplayLogic {
    
    @IBOutlet weak var inputUser: RSTextField!
    @IBOutlet weak var inputPassword: RSTextField!
    @IBOutlet weak var buttonLogin: UIButton!
    var interactor: SecondScreenBusinessLogic?
    var router: (NSObjectProtocol & SecondScreenRoutingLogic & SecondScreenDataPassing)?
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO: Criar um componente para viewController
        view.backgroundColor = UIColor(hexString: "131313")
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        interactor?.setupButtonAndInputs()
    }
    
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
        let interactor = SecondScreenInteractor()
        let presenter = SecondScreenPresenter()
        let router = SecondScreenRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    func setupButtonAndInput(viewModelButton: FirstScreen.Model.RSButton,
                             viewModelInput: FirstScreen.Model.RSInput) {
        buttonLogin.layer.borderWidth = viewModelButton.borderWidth
        buttonLogin.layer.borderColor = viewModelButton.borderColor
        inputUser.attributedPlaceholder = viewModelInput.userPlaceHolder
        inputPassword.attributedPlaceholder = viewModelInput.passwordPlaceHolder
    }
}
