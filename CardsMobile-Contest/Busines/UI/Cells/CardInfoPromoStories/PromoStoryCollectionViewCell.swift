//
//  PromoStoryCollectionViewCell.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 02.12.2020.
//

import Foundation
import UIKit

final class PromoStoryCollcectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var promoTitleLabel: UILabel!
    
    func setUp(_ model: CardInfoPromoStory) {
        iconImageView.image = model.image
        promoTitleLabel.text = model.text
    }
    
}
