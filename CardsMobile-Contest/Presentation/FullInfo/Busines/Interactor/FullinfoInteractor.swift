//
//  FullinfoInteractor.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 29.11.2020.
//

import Foundation

protocol FullinfoInteractor {
    func fetch()
}

final class FullinfoInteractorImp: FullinfoInteractor  {
    
    weak var output: FullInfoPresenterInput?
    
    func fetch() {
        output?.didSucceded()
    }
    
}
