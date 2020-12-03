//
//  FullInfoViewController.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 30.11.2020.
//

import UIKit

protocol FullInfoViewProtocol: class {
    func reloadData(with model: [FiledModel])
}

// MARK: - Implementation

final class FullInfoViewController: BaseTableViewController, FullInfoViewProtocol {
    
    var presenter: FullInfoPresenter!
    
    // MARK: - View state
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .groupTableViewBackground
        tableView.backgroundColor = .groupTableViewBackground
        
        tableView.register(UINib(nibName: "CardInfoHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: CardInfoHeaderTableViewCell.identifier)
        tableView.register(UINib(nibName: "CardInfoImageTableViewCell", bundle: nil), forCellReuseIdentifier: CardInfoImageTableViewCell.identifier)
        tableView.register(UINib(nibName: "CardInfoCodeTableViewCell", bundle: nil), forCellReuseIdentifier: CardInfoCodeTableViewCell.identifier)
        tableView.register(UINib(nibName: "CardDetailsViewCell", bundle: nil), forCellReuseIdentifier: CardInfoButtonTableViewCell.identifier)
        tableView.register(UINib(nibName: "CardInfoDescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: CardInfoDescriptionTableViewCell.identifier)
        tableView.register(UINib(nibName: "CardInfoPromoStoriesTableViewCell", bundle: nil), forCellReuseIdentifier: CardInfoPromoStoriesTableViewCell.identifier)
        tableView.register(UINib(nibName: "CardInfoStatusTableViewCell", bundle: nil), forCellReuseIdentifier: CardInfoStatusTableViewCell.identifier)
        tableView.register(SpaceTableViewCell.self, forCellReuseIdentifier: SpaceTableViewCell.identifier)
        tableView.register(UINib(nibName: "CardInfoButtonTableViewCell", bundle: nil), forCellReuseIdentifier: CardInfoButtonTableViewCell.identifier)
        
        presenter.viewDidLoad()
    }
    
}
