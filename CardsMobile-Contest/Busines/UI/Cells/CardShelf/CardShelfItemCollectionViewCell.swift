//
//  CardShelfItemCollectionViewCell.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 18.11.2020.
//

import UIKit

final class CardShelfItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(_ model: CarouselItem) {
        mainTitleLabel.text = model.title
        mainImageView.image = model.image
    }
}
