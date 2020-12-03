//
//  CardInfoImageTableViewCell.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 29.11.2020.
//

import UIKit

final class CardInfoImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    func setUp(_ model: CardInfoImage) {
        mainImageView.image = model.image
        contentView.backgroundColor = .groupTableViewBackground
    }
    
}
