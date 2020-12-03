//
//  UITableView+Ext.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 20.11.2020.
//

import UIKit

extension UITableViewCell {
    
    static var identifier: String {
        return description()
    }
    
}

extension UICollectionViewCell {
    
    static var identifier: String {
        return description()
    }
    
}
