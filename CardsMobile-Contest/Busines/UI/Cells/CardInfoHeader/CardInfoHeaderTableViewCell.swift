//
//  CardInfoHeaderTableViewCell.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 29.11.2020.
//

import UIKit

final class CardInfoHeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var MainTitleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    func setUp(_ model: CardInfoHeader) {
        MainTitleLabel.text = model.title
        subTitleLabel.text = model.description
    }
    
}
