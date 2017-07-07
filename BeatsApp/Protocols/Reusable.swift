//
//  Reusable.swift
//  BeatsApp
//
//  Created by Malcolm Kumwenda on 2017/07/07.
//  Copyright © 2017 Byte Orbit. All rights reserved.
//

import UIKit

protocol Reusable  { }

extension Reusable where Self: UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: Reusable {}


extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_ :T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T  {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not deque cell")
        }
        return cell
    }
}
