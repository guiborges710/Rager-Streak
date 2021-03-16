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

extension UINavigationController {
    @objc
    func actionBackButton(sender: UIBarButtonItem) {
        popViewController(animated: true)
    }
    
    @objc
    func actionEditButton(sender: UIBarButtonItem) {
        popViewController(animated: true)
    }
    
    @objc
    func actionAddButton(sender: UIBarButtonItem) {
        let destination: NewRagerViewController = UIStoryboard(name: "NewRager", bundle: nil).instantiateViewController(withIdentifier: "NewRagerViewController") as! NewRagerViewController

        self.pushViewController(destination, animated: true)
    }
    
    public func setupRightButtonNavBar() -> UIBarButtonItem {
        let img = UIImage(named: "editIcon")!.withRenderingMode(.alwaysOriginal)
        let rightButton = UIBarButtonItem(image: img,
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(self.actionEditButton))
        
        return rightButton

    }
    
    public func setupLeftButtonNavBar() -> UIBarButtonItem {
        let img = UIImage(named: "backButton")!.withRenderingMode(.alwaysOriginal)
        let leftButton = UIBarButtonItem(image: img,
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(self.actionBackButton))
        return leftButton
    }
    
    public func setupAddButtonNavBar() -> UIBarButtonItem {
        let img = UIImage(named: "navAddButton")!.withRenderingMode(.alwaysOriginal)
        let addButton = UIBarButtonItem(image: img,
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(self.actionAddButton))
        
        return addButton

    }
    
}
