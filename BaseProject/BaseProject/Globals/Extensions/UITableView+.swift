//
//  UITableView+.swift
//  BaseProject
//
//  Created by taehy.k on 2021/08/01.
//

import UIKit

extension UITableView {
    // Dequeue Cell
    func dequeueCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
      guard let cell = dequeueReusableCell(withIdentifier: "\(T.self)", for: indexPath) as? T else {
        fatalError("Could not dequeue cell with identifier: \(T.self)")
      }
      
      return cell
    }
}
