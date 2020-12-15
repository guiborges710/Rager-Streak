//
//  FirstScreenViewController.swift
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

protocol FirstScreenDisplayLogic: class {
    func routeToSecondScreen()
    func setupButton(buttonViewModel: FirstScreen.Model.RSButton)
}

class FirstScreenViewController: UIViewController, FirstScreenDisplayLogic {
    
    @IBOutlet weak var buttonReady: UIButton!
    @IBOutlet weak var message: UILabel!
    var interactor: FirstScreenBusinessLogic?
    var router: (NSObjectProtocol & FirstScreenRoutingLogic & FirstScreenDataPassing)?
    
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
        let interactor = FirstScreenInteractor()
        let presenter = FirstScreenPresenter()
        let router = FirstScreenRouter()
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
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = UIColor(hexString: "131313")
        tabBarController?.tabBar.isHidden = true
        interactor?.setupButton()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    // MARK: Do something
    func routeToSecondScreen() {
        router?.routeToSuccess()
    }
    
    func setupButton(buttonViewModel: FirstScreen.Model.RSButton) {
        buttonReady.layer.borderColor = buttonViewModel.borderColor
        buttonReady.layer.borderWidth = buttonViewModel.borderWidth
    }
    
    func passwordIncorrect(textFieldViewModel: FirstScreen.Model.LabelViewModel) {
        message.changeText(string: textFieldViewModel.textMessage,
                           color: textFieldViewModel.colorMessage)
    }
    
    @IBAction func confirmPassword(_ sender: Any) {
        routeToSecondScreen()
    }
}
