//
//  UITextColor+ChangeText.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 16/11/20.
//  Copyright © 2020 guilherme.martinelli. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func changeText(string: String, color: UIColor) {
        self.text = string
        self.textColor = color
    }
}
