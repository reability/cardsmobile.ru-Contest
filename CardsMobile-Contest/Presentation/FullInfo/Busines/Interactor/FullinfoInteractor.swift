//
//  FullinfoInteractor.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович

import Foundation

protocol FullinfoInteractor {
    func fetch()
}

// MARK: - From Presenter

final class FullinfoInteractorImp  {
    
    unowned var output: FullInfoPresenterInput!
    // var service: Service<Card>
    
}

extension FullinfoInteractorImp: FullinfoInteractor {
    
    func fetch() {
        #warning("No implementation")
        output?.didSucceded()
    }
    
}
