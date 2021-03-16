//
//  NewRagerPhotoViewController.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 16/03/21.
//  Copyright © 2021 guilherme.martinelli. All rights reserved.
//

import UIKit

protocol NewRagerPhotoDisplayLogic: class
{

}

class NewRagerPhotoViewController: UIViewController, NewRagerPhotoDisplayLogic
{
//  var interactor: NewRagerGameBusinessLogic?
//  var router: (NSObjectProtocol & NewRagerGameRoutingLogic & NewRagerGameDataPassing)?

  // MARK: Object lifecycle
  
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
//    let viewController = self
//    let interactor = NewRagerGameInteractor()
//    let presenter = NewRagerGamePresenter()
//    let router = NewRagerGameRouter()
//    viewController.interactor = interactor
//    viewController.router = router
//    interactor.presenter = presenter
//    presenter.viewController = viewController
//    router.viewController = viewController
//    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
    setupNavBar()
    self.title = "Novo Rager"
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    
  }
    @IBAction func showModalConfirm(_ sender: Any) {
        showModal()
    }
    
}
extension NewRagerPhotoViewController {
    func setupNavBar() {
        self.navigationItem.leftBarButtonItem = self.navigationController?.setupLeftButtonNavBar()
    }
    
    func showModal() {
        let destination: NewRagerModalViewController = UIStoryboard(name: "NewRager", bundle: nil).instantiateViewController(withIdentifier: "NewRagerModalViewController") as! NewRagerModalViewController
        destination.modalPresentationStyle = .overCurrentContext
        present(destination, animated: true, completion: nil)
    }
}

