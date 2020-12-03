//
//  CardInfoCode.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 29.11.2020.
//

import Foundation
import UIKit.UITableView

struct CardInfoCode: FiledModel {
    
    let code: String
    
    var height: CGFloat {
        return 170.0
    }
    
    func cell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardInfoCodeTableViewCell.identifier) as! CardInfoCodeTableViewCell
        cell.setUp(self)
        return cell
    }
    
}
