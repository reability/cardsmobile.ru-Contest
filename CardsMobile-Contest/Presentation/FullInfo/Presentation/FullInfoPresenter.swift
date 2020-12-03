//
//  FullInfoPresenter.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 30.11.2020.
//

import Foundation

protocol FullInfoPresenter {
    func viewDidLoad()
}

protocol FullInfoPresenterInput: class {
    func didSucceded()
}

final class FullInfoPresenterImp: FullInfoPresenterInput, FullInfoPresenter {
    func didSucceded() {
        view?.reloadData(with: dataProvider.getRows(for: index))
    }
    
    
    weak var  view: FullInfoViewProtocol?
    var dataProvider: FullInfoDataProvider!
    var interactor: FullinfoInteractor!
    
    var index: Int!
    
    func viewDidLoad() {
        interactor.fetch()
    }
    
    
}
