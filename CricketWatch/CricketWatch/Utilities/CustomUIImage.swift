//
//  CustomUIImage.swift
//  CricketWatch
//
//  Created by BJIT on 9/2/23.
//

import UIKit

class CustomUIImage: UIImageView {

    @IBInspectable var CornerRadius: CGFloat = 0.0 {
        didSet {
            topLeftCornerRadius = CornerRadius
            topRightCornerRadius = CornerRadius
            bottomLeftCornerRadius = CornerRadius
            bottomRightCornerRadius = CornerRadius
            updateCorners()
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
        let size = min(bounds.size.width, bounds.size.height)
        let topLeft = min(topLeftCornerRadius, size/2)
        _ = min(topRightCornerRadius, size/2)
        _ = min(bottomLeftCornerRadius, size/2)
        _ = min(bottomRightCornerRadius, size/2)
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight],
                                    cornerRadii: CGSize(width: topLeft, height: topLeft))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }

}
