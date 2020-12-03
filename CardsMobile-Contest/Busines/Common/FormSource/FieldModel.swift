//
//  FieldModel.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 14.11.2020.
//

import UIKit.UITableViewCell

protocol FiledModel {
    
    var height: CGFloat { get }
    func cell(_ tableView: UITableView) -> UITableViewCell
    
}
