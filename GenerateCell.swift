//
//  GenerateCell.swift
//  
//
//  Created by SeonIl Kim on 2018. 3. 10..
//

import UIKit

extension UITableView {
    func generateCell<T: UITableViewCell>(withIdentifier identifier: String, for indexPath: IndexPath? = nil, cellClass: T.Type) -> T {
        if let indexPath = indexPath {
            guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
                fatalError("Could not dequeue cell: \(T.self) with identifier: \(identifier)")
            }
            return cell
        }
        
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier) as? T else {
            fatalError("Could not dequeue cell: \(T.self) with identifier: \(identifier)")
        }
        return cell
    }
}

extension UICollectionView {
    func generateCell<T: UICollectionViewCell>(withIdentifier identifier: String, for indexPath: IndexPath, cellClass: T.Type) -> T {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell: \(T.self) with identifier: \(identifier)")
        }
        return cell
    }
}
