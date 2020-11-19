//
//  RSTextField.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 19/11/20.
//  Copyright © 2020 guilherme.martinelli. All rights reserved.
//
import UIKit

class RSTextField: UITextField, UITextFieldDelegate{
    let border = CALayer()

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        delegate = self
        self.layer.borderWidth = 0
        createBorder()
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        createBorder()
    }

    func createBorder(){
        let width = CGFloat(1.0)
        border.borderColor = UIColor(hexString: "7A4DDF").cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        clearButtonMode = .whileEditing
        movePlaceholderUp()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        movePlaceholderDown()
    }

    func movePlaceholderUp(){
        border.borderColor = UIColor.white.cgColor
    }
    func movePlaceholderDown(){
        border.borderColor = UIColor(hexString: "7A4DDF").cgColor
    }
}
