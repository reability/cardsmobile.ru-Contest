//
//  BaseTableViewController.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 14.11.2020.
//

import UIKit

class BaseTableViewController: UIViewController {
    
    lazy var formSource: FormSource = {
        return $0
    }(FormSource())
    
    lazy var tableView: UITableView = {
        $0.delegate = formSource
        $0.dataSource = formSource
        $0.separatorStyle = .none
        //$0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.backgroundColor = .groupTableViewBackground
        view.backgroundColor = .groupTableViewBackground
        layout()
    }
    
    func reloadData(with model: [FiledModel]) {
        formSource.model = model
        _reloadData()
    }
    
    func reloadData() {
        _reloadData()
    }
}

private extension BaseTableViewController {
    
    func _reloadData() {
        tableView.reloadData()
    }
    
}

private extension BaseTableViewController {
    
    func layout() {
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
}
