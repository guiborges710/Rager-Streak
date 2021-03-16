//
//  NewRagerModalViewController.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 16/03/21.
//  Copyright © 2021 guilherme.martinelli. All rights reserved.
//

import UIKit

class NewRagerModalViewController: UIViewController {

    @IBOutlet weak var modalView: UIView!
    // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
  }
  
  // MARK: Setup
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    modalView.layer.cornerRadius = 20
    modalView.backgroundColor = RSColor().grayColor()
    self.title = "Novo Rager"
  }
    @IBAction func notYet(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
    
}

