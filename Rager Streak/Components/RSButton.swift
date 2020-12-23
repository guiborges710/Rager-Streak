//
//  RSButton.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 22/12/20.
//  Copyright © 2020 guilherme.martinelli. All rights reserved.
//

import UIKit

class RSButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setupButton()
        
    }

    func setupButton() {
        let color = RSColor().purpleColor().cgColor
        self.layer.borderColor = color
        self.layer.borderWidth = 1
    }

}

