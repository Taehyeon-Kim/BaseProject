//
//  UICollectionView+.swift
//  BaseProject
//
//  Created by taehy.k on 2021/08/01.
//

import UIKit

extension UICollectionView {
    // Dequeue Cell
    func dequeueCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: "\(T.self)", for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.self)")
        }
        return cell
    }
}
