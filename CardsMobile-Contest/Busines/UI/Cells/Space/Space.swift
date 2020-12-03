//
//  Space.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 23.11.2020.
//

import UIKit

struct Space: FiledModel {
    
    var size: CGFloat
    
    var height: CGFloat {
        return size
    }
    
    func cell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SpaceTableViewCell.identifier) as! SpaceTableViewCell
        
        return cell
    }
    
}
