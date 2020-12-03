//
//  FormSource.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 14.11.2020.
//

import UIKit

protocol FormSourceActionDelegate: class {
    func didTaped(on model: FiledModel)
}

final class FormSource: NSObject {
    
    weak var delegate: FormSourceActionDelegate?
    
    var model: [FiledModel]
    
    override init() {
        self.model = []
        
        super.init()
    }
    
}

extension FormSource: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = model[indexPath.row].cell(tableView)
        
        if var c = cell as? Delegatable {
            c.delegate = delegate
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didTaped(on: model[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return model[indexPath.row].height
    }
    
}
