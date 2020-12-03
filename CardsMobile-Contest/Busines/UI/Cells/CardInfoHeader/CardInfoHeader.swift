//
//  CardInfoHeader.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 29.11.2020.
//

import UIKit.UITableView

struct CardInfoHeader: FiledModel {
    
    let title: String
    let description: String?
    
    var height: CGFloat {
        return 84.0
    }
    
    func cell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardInfoHeaderTableViewCell.identifier) as! CardInfoHeaderTableViewCell
        cell.setUp(self)
        return cell
    }
    
    
}
