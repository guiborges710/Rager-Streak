//
//  RSNavigationBar.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 19/11/20.
//  Copyright © 2020 guilherme.martinelli. All rights reserved.
//

import UIKit

class RSNavigationBar: UINavigationController {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupNavbar()
    }
    func setupNavbar() {
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.barTintColor = .clear
        self.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.layoutIfNeeded()
    }
}
