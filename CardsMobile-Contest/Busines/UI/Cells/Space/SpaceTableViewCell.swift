//
//  SpaceTableViewCell.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 23.11.2020.
//

import UIKit

final class SpaceTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        contentView.backgroundColor = .groupTableViewBackground
        selectionStyle = .none
    }
    
}



