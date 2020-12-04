//
//  CardShelf.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 21.11.2020.
//

import UIKit

struct CardShelf: FiledModel {
    
    func cell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardShelfTableViewCell.identifier) as! CardShelfTableViewCell
        cell.setup(self)
        
        return cell
    }
    
    var height: CGFloat {
        return 300.0
    }
    
    
    var cardTems: [CarouselItem]
    
}

struct CardShelfItem: CarouselItem {
    var title: String
    var image: UIImage
}
