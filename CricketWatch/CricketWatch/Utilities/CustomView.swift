//
//  CustomView.swift
//  CricketWatch
//
//  Created by BJIT on 9/2/23.
//

import UIKit

class CustomView: UIView {
    
//    @IBInspectable var borderColor: UIColor = .clear {
//        didSet {
//            layer.borderColor = borderColor.cgColor
//        }
//    }
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable var topLeftCornerRadius: CGFloat = 0.0 {
        didSet {
            updateCorners()
        }
    }
    
    @IBInspectable var topRightCornerRadius: CGFloat = 0.0 {
        didSet {
            updateCorners()
        }
    }
    
    @IBInspectable var bottomLeftCornerRadius: CGFloat = 0.0 {
        didSet {
            updateCorners()
        }
    }
    
    @IBInspectable var bottomRightCornerRadius: CGFloat = 0.0 {
        didSet {
            updateCorners()
        }
    }
    
    func updateCorners() {
        var maskedCorners: CACornerMask = []
        if topLeftCornerRadius > 0 {
            maskedCorners.insert(.layerMinXMinYCorner)
            layer.cornerRadius = topLeftCornerRadius
        }
        if topRightCornerRadius > 0 {
            maskedCorners.insert(.layerMaxXMinYCorner)
            layer.cornerRadius = topRightCornerRadius
        }
        if bottomLeftCornerRadius > 0 {
            maskedCorners.insert(.layerMinXMaxYCorner)
            layer.cornerRadius = bottomLeftCornerRadius
        }
        if bottomRightCornerRadius > 0 {
            maskedCorners.insert(.layerMaxXMaxYCorner)
            layer.cornerRadius = bottomRightCornerRadius
        }
        layer.maskedCorners = maskedCorners
    }
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 5.0 {
        didSet {
            updateShadow()
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            updateShadow()
        }
    }
    
    func updateShadow() {
        clipsToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = shadowOffset
    }
//    override func layoutSubviews() {
//       super.layoutSubviews()
//       layer.borderWidth = 2.5
//     }
    
}
