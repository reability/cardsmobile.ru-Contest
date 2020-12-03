//
//  FullinfoBuilder.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович

import UIKit.UIViewController

struct FullInfoInput {
    let selectedIndex: Int
}

final class FullinfoBuilder {
    
    static func build(with input: FullInfoInput) -> UIViewController {
        let vc = FullInfoViewController()
        
        let presenter = FullInfoPresenterImp()
        vc.presenter = presenter
        presenter.index = input.selectedIndex
        
        let dataProvider = FullInfoDataProviderImp()
        
        presenter.view = vc
        presenter.dataProvider = dataProvider
        
        let interactor = FullinfoInteractorImp()
        presenter.interactor = interactor
        interactor.output = presenter
        
        return vc
    }
    
}


