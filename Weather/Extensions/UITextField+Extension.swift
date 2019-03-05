//
//  UITextField+Extension.swift
//  TableViewPractice
//
//  Created by Serhiy Rosovskyy on 3/5/19.
//  Copyright © 2019 BriefOS. All rights reserved.
//

import UIKit


extension UITextField {
    
    func underlined() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
}
