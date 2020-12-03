//
//  MasterDeskPresenter.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович

// MARK: - Protocols

protocol MasterDeskPresenter: CardShelfDelegate, FormSourceActionDelegate, ViewState {
}

protocol MasterDeskPresenterInput: class {
    func didSucceded(with model: [GetCardDetailsModel])
    func failedInitialLoad()
}

protocol MasterDeskPresenterOutput: class {
    func fetchCards()
}

// MARK: - Implementation

final class MasterDeskPresenterImp {
    
    unowned var view: MasterDeskViewProtocol!
    var dataProvider: MasterDeskDataProvider!
    var interactor: MasterDeskInteractor!
    
    var cards: [GetCardDetailsModel] = []
    
    var currentIndex: Int!
    
}

// MARK: - API for View

extension MasterDeskPresenterImp: MasterDeskPresenter {
    
    // MARK: - ViewState
    
    func viewDidLoad() {
        interactor.fetchCards()
        //view.reloadData(with: dataProvider.getRows(for: [], selectedIndex: 0))
    }
    
    // MARK: - DataSourceDelegate
    
    /// Прокрутка карусели
    
    func didSelectedCard(with index: Int) {
        currentIndex = index
        view.reloadData(with: dataProvider.getRows(for: cards, selectedIndex: currentIndex))
        let color = dataProvider.getNaviColor(for: cards, selectedIndex: currentIndex)
        view.setUpNavigation(with: color)
    }
    
    /// Нажите на ячейку
    
    func didTaped(on model: FiledModel) {
        switch model {
        /// Ячейка с деталями сверху
        case is CardDetails:
            view.openDeatilsModule(with: currentIndex)
        default:
            break
        }
    }
}

// MARK: - From Interactor

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
        #warning("No imp")
    }
    
    
}
