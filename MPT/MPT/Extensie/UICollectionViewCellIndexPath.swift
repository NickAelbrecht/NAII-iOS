//
//  UICollectionViewCellIndexPath.swift
//  MPT
//
//  Created by Nick Aelbrecht on 19/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import Foundation

import UIKit

extension UIResponder {
    
    func next<T: UIResponder>(_ type: T.Type) -> T? {
        return next as? T ?? next?.next(type)
    }
}
