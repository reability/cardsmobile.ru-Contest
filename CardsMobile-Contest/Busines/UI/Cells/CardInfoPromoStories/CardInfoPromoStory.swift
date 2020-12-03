//
//  CardInfoPromoStory.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 02.12.2020.
//

import Foundation
import UIKit.UIImage

struct CardInfoPromoStory {
    let text: String
    let image: UIImage
}

struct CardInfoPromoStories: FiledModel {
    
    var items: [CardInfoPromoStory]
    
    var height: CGFloat {
        return 280.0
    }
    
    func cell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardInfoPromoStoriesTableViewCell.identifier) as! CardInfoPromoStoriesTableViewCell
        cell.setUp(self)
        return cell
    }
    
}
