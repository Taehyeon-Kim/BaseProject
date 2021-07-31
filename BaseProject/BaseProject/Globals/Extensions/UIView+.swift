//
//  UIView+.swift
//  BaseProject
//
//  Created by taehy.k on 2021/08/01.
//


/*
    makeRounded 사용법)
    cornerView.makeRounded(cornerRadius: 50, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
 
    모서리) X: 좌우, Y: 상하 로 생각하면 어렵지 않음
    - layerMinXMinYCorner : 왼쪽 상단
    - layerMaxXMinYCorner : 오른쪽 상단
    - layerMinXMaxYCorner : 왼쪽 하단
    - layerMaxXMaxYCorner : 오른쪽 하단
 
    - iOS 10이하에서도 사용되는 코드를 작성하고 싶다면 아래 링크 참고
    - 현재는 필요 없다고 판단
    https://swieeft.github.io/2020/03/05/UIViewRoundCorners.html
*/

import UIKit

// MARK: - radius, border
extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    // Set Rounded View
    func makeRounded(cornerRadius: CGFloat?, maskedCorners: CACornerMask = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]) {
        
        if let cornerRadius_ = cornerRadius {
            layer.cornerRadius = cornerRadius_
        } else {
            layer.cornerRadius = layer.frame.height / 2
        }
        
        layer.masksToBounds = true
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}

// MARK: - load xib
// 유용하게 사용했었기 때문에 추가
extension UIView {
    static func loadFromXib(withOwner: Any? = nil, options: [UINib.OptionsKey: Any]? = nil) -> Self {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "\(self)", bundle: bundle)

        guard let view = nib.instantiate(withOwner: withOwner, options: options).first as? Self else {
            fatalError("Could not load view from nib file.")
        }
        return view
    }
}
