//
//  RSViewController.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 19/11/20.
//  Copyright © 2020 guilherme.martinelli. All rights reserved.
//

import UIKit

class RSViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func navigationBarIsHidden() {
        self.navigationController?.setToolbarHidden(true, animated: false)
    }
}
