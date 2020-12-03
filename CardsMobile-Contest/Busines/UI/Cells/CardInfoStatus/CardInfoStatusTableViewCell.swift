//
//  CardInfoStatusTableViewCell.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 03.12.2020.
//

import UIKit

final class CardInfoStatusTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var reloadButton: UIButton!
    
    override func awakeFromNib() {
        reloadButton.addTarget(self, action: #selector(didTapedReload), for: .touchUpInside)
        reloadButton.layer.cornerRadius = 12.0
    }
    
    func setUp(_ model: CardInfoStatus) {
        pointsLabel.text = String(model.points)
        
        reloadButton.backgroundColor = model.colorSheme.mainColor
        reloadButton.setTitleColor(model.colorSheme.complementaryColor, for: .normal)
        
        
    }
    
    @objc func didTapedReload() {
        
    }
}
