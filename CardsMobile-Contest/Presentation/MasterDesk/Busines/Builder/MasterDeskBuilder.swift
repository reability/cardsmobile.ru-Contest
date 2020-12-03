//
//  MasterDeskBuilder.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 18.11.2020.
//

import UIKit


final class MasterDeskBuilder {
    
    func build() -> UIViewController {
        let viewController = MasterDeskViewController()
        
        let presenter = MasterDeskPresenterImp()
        presenter.view = viewController
        presenter.dataProvider = MasterDeskDataProviderImp()
        
        let interactor = MasterDeskInteractor()
        presenter.interactor = interactor
        interactor.output = presenter
        
        viewController.presenter  = presenter
        
        
        return viewController
    }
    
}
