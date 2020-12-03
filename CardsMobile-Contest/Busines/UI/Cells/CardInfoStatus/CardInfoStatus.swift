//
//  CardInfoStatus.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 03.12.2020.
//

import Foundation
import UIKit

typealias ColorSheme = GetCardDetailsModelColorSheme

struct CardInfoStatus: FiledModel {
    let points: Int
    let colorSheme: ColorSheme
    
    var height: CGFloat {
        return 120.0
    }
    
    func cell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardInfoStatusTableViewCell.identifier) as! CardInfoStatusTableViewCell
        cell.setUp(self)
        return cell
    }
}
