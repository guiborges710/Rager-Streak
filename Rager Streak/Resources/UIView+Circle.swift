//
//  UIView+Circle.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 17/12/20.
//  Copyright © 2020 guilherme.martinelli. All rights reserved.
//

import UIKit

extension UIView {
    func setupViews(circleView: UIView, color: UIColor) {
        circleView.layer.cornerRadius = 41
        circleView.layer.borderColor = color.cgColor
        circleView.layer.borderWidth = 2
    }
}
