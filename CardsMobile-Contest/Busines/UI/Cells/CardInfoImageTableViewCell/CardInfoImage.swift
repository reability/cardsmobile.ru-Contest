//
//  CardInfoImage.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 29.11.2020.
//

import Foundation
import UIKit.UIImage
import UIKit.UITableView

struct CardInfoImage: FiledModel {
    
    let image: UIImage
    
    var height: CGFloat {
        return 140.0
    }
    
    func cell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardInfoImageTableViewCell.identifier) as! CardInfoImageTableViewCell
        cell.setUp(self)
        return cell
    }
    
}
