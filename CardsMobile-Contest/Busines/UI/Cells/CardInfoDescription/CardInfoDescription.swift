//
//  CardInfoDescription.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 02.12.2020.
//

import UIKit

struct CardInfoDescription: FiledModel {
    
    var text: String
    
    var height: CGFloat {
        return 80.0
    }
    
    func cell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardInfoDescriptionTableViewCell.identifier) as! CardInfoDescriptionTableViewCell
        cell.setUp(self)
        return cell
    }
    
    
}
