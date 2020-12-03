//
//  MasterDeskInteractor.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 15.11.2020.
//

import Foundation

final class MasterDeskInteractor {
    
    weak var output: MasterDeskPresenterInput?
    
}

extension MasterDeskInteractor: MasterDeskPresenterOutput {
    
    func fetchCards() {
        let mocked: [GetCardDetailsModel] = [
            GetCardDetailsModel(title: "ВкусГаражей", code: "8957371839567", info: "Оплачивайте покупки с помощью дисконтной карты и накапливайте была. Обменивайте на скидки в 1р каждые 10 баллов на дисконтной карте", status: true, amount: 200, colorSheme: .init(mainColor: .green, complementaryColor: .white)),
            GetCardDetailsModel(title: "Маникюр Нади", code: "2675303180285", info: "Получайте скидки", status: true, amount: nil, colorSheme: .init(mainColor: .black, complementaryColor: .white)),
            GetCardDetailsModel(title: "Уткохвост", code: "QR", info: "Клубная карта", status: true, amount: nil, colorSheme: .init(mainColor: .blue, complementaryColor: .yellow)),
        ]
        
        output?.didSucceded(with: mocked)
    }
    
}
