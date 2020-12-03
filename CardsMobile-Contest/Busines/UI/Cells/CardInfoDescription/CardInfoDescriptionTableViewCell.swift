//
//  CardInfoDescriptionTableViewCell.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 02.12.2020.
//

import UIKit

final class CardInfoDescriptionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    func setUp(_ model: CardInfoDescription) {
        descriptionLabel.text = model.text
    }
    
}
