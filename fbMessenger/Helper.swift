//
//  Helper.swift
//  fbMessenger
//
//  Created by Kelvin Leung on 25/07/2017.
//  Copyright © 2017 Kelvin Leung. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDict = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDict[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict))
    }
    
    func hCenterAlign(view: UIView, to: UIView) {
        addConstraint(NSLayoutConstraint(item: view, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: to, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0))
    }
}

extension UITextView {
    func padding(top: CGFloat, right: CGFloat, bottom: CGFloat, left: CGFloat) {
        self.textContainerInset = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
}
