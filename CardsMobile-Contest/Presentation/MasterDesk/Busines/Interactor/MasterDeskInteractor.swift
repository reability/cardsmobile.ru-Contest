//
//  MasterDeskInteractor.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович

import UIKit.UIColor

final class MasterDeskInteractor {
    
    unowned var output: MasterDeskPresenterInput!
    // var service: Service<Cards>
    
}

// MARK: - From Presenter

extension MasterDeskInteractor: MasterDeskPresenterOutput {
    
    func fetchCards() {
        #warning("Mocked")
        let mocked: [GetCardDetailsModel] = [
            GetCardDetailsModel(title: "ВкусГаражей", code: "8957371839567", info: "Оплачивайте покупки с помощью дисконтной карты и накапливайте была. Обменивайте на скидки в 1р каждые 10 баллов на дисконтной карте", status: true, amount: 200, image: #imageLiteral(resourceName: "Card_1"), logo: #imageLiteral(resourceName: "logo0"), colorSheme: .init(mainColor: UIColor(red: 88/255, green: 165/255, blue: 140/255, alpha: 1.0), complementaryColor: UIColor(red: 15/255, green: 44/255, blue: 45/255, alpha: 1.0))),
            GetCardDetailsModel(title: "Маникюр Нади", code: "2675303180285", info: "Получайте скидки", status: true, amount: nil, image: #imageLiteral(resourceName: "Card_2"), logo: #imageLiteral(resourceName: "logo2"), colorSheme: .init(mainColor: UIColor(red: 189/255.0, green: 181/255, blue: 175/255, alpha: 1.0), complementaryColor: UIColor(red: 65/255, green: 37/255, blue: 56/255, alpha: 1.0))),
            GetCardDetailsModel(title: "Уткохвост", code: "QR", info: "Клубная карта", status: true, amount: nil, image: #imageLiteral(resourceName: "Card_0"), logo: #imageLiteral(resourceName: "logo1"), colorSheme: .init(mainColor: UIColor(red: 234/255, green: 197/255, blue: 69/255, alpha: 1.0), complementaryColor: UIColor(red: 61/255, green: 111/255, blue: 146/255, alpha: 1.0))),
        ]
        
        output?.didSucceded(with: mocked)
    }
    
}
