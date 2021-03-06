//
//  ImageView+Circle.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 20/11/20.
//  Copyright © 2020 guilherme.martinelli. All rights reserved.
//

import UIKit

extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
