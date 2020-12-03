//
//  MasterDeskViewController.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 14.11.2020.
//

import UIKit

protocol MasterDeskViewProtocol: class {
    func reloadData(with model: [FiledModel])
    func openDeatilsModule(with index: Int)
    func setUpNavigation(with sheme: ColorSheme)
}

// MARK: - Implementation

final class MasterDeskViewController: BaseTableViewController {
    
    var presenter: MasterDeskPresenter!
    
    // MARK: - View state
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        formSource.delegate = presenter
        
        registerCells()
        presenter.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationItem.title = "Кошелек"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить", style: .done, target: self, action: nil)
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
}

extension MasterDeskViewController: MasterDeskViewProtocol {
    
    func openDeatilsModule(with index: Int) {
        let vc = FullinfoBuilder.build(with: .init(selectedIndex: index))
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUpNavigation(with sheme: ColorSheme) {
        navigationController?.navigationBar.barTintColor = sheme.mainColor
        navigationController?.navigationBar.tintColor = sheme.complementaryColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: sheme.complementaryColor]
        
        tableView.backgroundColor = sheme.mainColor
    }
    
}

private extension MasterDeskViewController {
    
    func registerCells() {
        tableView.register(UINib(nibName: "CardShelfTableViewCell", bundle: nil), forCellReuseIdentifier: CardShelfTableViewCell.identifier)
        tableView.register(UINib(nibName: "CardDetailsViewCell", bundle: nil), forCellReuseIdentifier: CardDetailtViewCell.identifier)
        tableView.register(SpaceTableViewCell.self, forCellReuseIdentifier: SpaceTableViewCell.identifier)
    }
    
}
