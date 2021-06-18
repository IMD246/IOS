//
//  DesignableView.swift
//  AppLearningEnglish
//
//  Created by CNTT on 5/10/21.
//  Copyright © 2021 fit.tdc.vn. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableView: UIView {
    @IBInspectable var shadowColor: UIColor = UIColor.clear{
        didSet{
            layer.shadowColor = shadowColor.cgColor
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 0{
        didSet{
            layer.shadowRadius = shadowRadius
        }
    }
    @IBInspectable var shadowOpacity: CGFloat = 0{
        didSet{
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    @IBInspectable var shadowOffsetY: CGFloat = 0{
        didSet{
            layer.shadowOffset.height = shadowOffsetY
        }
    }
}
