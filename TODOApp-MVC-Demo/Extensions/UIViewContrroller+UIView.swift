//
//  UIViewContrroller+UIView.swift
//  TODOApp-MVC-Demo
//
//  Created by Eslam Sebaie on 10/30/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import UIKit
extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = .zero
        layer.shadowRadius = 2
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    
    func setupViews(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        
    }
    
    func setupButtons() {
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
}
