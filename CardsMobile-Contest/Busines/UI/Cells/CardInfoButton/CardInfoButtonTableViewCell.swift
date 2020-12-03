//
//  CardInfoButtonTableViewCell.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 29.11.2020.
//

import UIKit

final class CardInfoButtonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var centralButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        centralButton.addTarget(self, action: #selector(didTapedButton), for: .touchUpInside)
        centralButton.layer.cornerRadius = 12.0
    }
    
    func setUp(_ model: CardInfoButton) {
        centralButton.setTitle(model.title, for: .normal)
    }
    
    @objc func didTapedButton() {
        
    }
    
    
}
