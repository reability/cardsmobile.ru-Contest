//
//  CardInfoCodeTableViewCell.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 29.11.2020.
//

import UIKit

final class CardInfoCodeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var codeViewHolder: UIView!
    @IBOutlet weak var codeLabel: UILabel!
    
    private var barView: BarCode!
    
    override func awakeFromNib() {
        self.barView = BarCode()
        codeViewHolder.addSubview(barView)
        barView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
    func setUp(_ model: CardInfoCode) {
        codeLabel.text = model.code
        barView.setCode(with: model.code)
    }
    
}
