//
//  UIStackView+.swift
//  BaseProject
//
//  Created by taehy.k on 2021/08/01.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
