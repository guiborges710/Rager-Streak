//
//  LoginScreenModels.swift
//  Rager Streak
//
//  Created by guilherme.martinelli on 16/11/20.
//  Copyright © 2020 guilherme.martinelli. All rights reserved.
//

import UIKit

enum LoginScreen {
    enum Model {
        struct User {
            var nome: String
        }
        
        struct LabelViewModel {
            let textMessage: String
            let colorMessage: UIColor
        }
        
        struct RSButton {
            let borderColor: CGColor
            let borderWidth: CGFloat
        }
        
        struct RSInput {
            let userPlaceHolder: NSAttributedString
            let passwordPlaceHolder: NSAttributedString
        }
    }

}
