//
//  FullInfoPresenter.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович

// MARK: - Protocols

protocol FullInfoPresenter: ViewState {
}

protocol FullInfoPresenterInput: class {
    func didSucceded()
}

final class FullInfoPresenterImp {
    
    unowned var view: FullInfoViewProtocol!
    var dataProvider: FullInfoDataProvider!
    var interactor: FullinfoInteractor!
    
    var index: Int!

}

// MARK: - API

extension FullInfoPresenterImp: FullInfoPresenter {
    
    // MARK: - ViewState
    
    func viewDidLoad() {
        interactor.fetch()
    }
    
}

// MARK: - From Interactor

extension FullInfoPresenterImp: FullInfoPresenterInput {
    
    func didSucceded() {
        view.reloadData(with: dataProvider.getRows(for: index))
    }
    
}
