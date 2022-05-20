//
//  settingPageControllerViewController.swift
//  yRadio
//
//  Created by Yunus Gündüz on 15.05.2022.
//

import UIKit

class settingPageControllerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      grad()
    }
    
    func grad(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.purple.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    

}
