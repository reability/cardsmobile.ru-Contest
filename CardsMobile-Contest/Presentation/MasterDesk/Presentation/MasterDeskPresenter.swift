//
//  MasterDeskPresenter.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 15.11.2020.
//

import Foundation

protocol MasterDeskPresenter: CardShelfDelegate, FormSourceActionDelegate {
    func viewDidLoad()
}

protocol MasterDeskPresenterInput: class {
    func didSucceded(with model: [GetCardDetailsModel])
    func failedInitialLoad()
}

protocol MasterDeskPresenterOutput: class {
    func fetchCards()
}

final class MasterDeskPresenterImp {
    
    unowned var view: MasterDeskViewProtocol!
    var dataProvider: MasterDeskDataProvider!
    var interactor: MasterDeskInteractor!
    
    var cards: [GetCardDetailsModel] = []
    
    var currentIndex: Int!
    
}

extension MasterDeskPresenterImp: MasterDeskPresenter {
    
    func viewDidLoad() {
        interactor.fetchCards()
        //view.reloadData(with: dataProvider.getRows(for: [], selectedIndex: 0))
    }
    
    func didSelectedCard(with index: Int) {
        currentIndex = index
        view.reloadData(with: dataProvider.getRows(for: cards, selectedIndex: currentIndex))
        let color = dataProvider.getNaviColor(for: cards, selectedIndex: currentIndex)
        view.setUpNavigation(with: color)
    }
    
	
    
}

extension MasterDeskPresenterImp: MasterDeskPresenterInput {
    
    func didSucceded(with model: [GetCardDetailsModel]) {
        
        self.cards = model
        currentIndex = 1
        let rows = dataProvider.getRows(for: model, selectedIndex: currentIndex)
        view.reloadData(with: rows)
        
        let color = dataProvider.getNaviColor(for: model, selectedIndex: currentIndex)
        view.setUpNavigation(with: color)
    }
    
    func failedInitialLoad() {
        //#warning("No imp")
    }
    
    
}
