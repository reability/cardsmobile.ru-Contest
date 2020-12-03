//
//  CardInfoButton.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 29.11.2020.
//

import UIKit

struct CardInfoButton: FiledModel {
    let title: String
    
    var height: CGFloat {
        return 56.0
    }
    
    func cell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardInfoButtonTableViewCell.identifier) as! CardInfoButtonTableViewCell
        cell.setUp(self)
        return cell
    }
}
