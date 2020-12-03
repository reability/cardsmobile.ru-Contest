//
//  MasterDeskDataProvider.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 15.11.2020.
//

import Foundation

protocol MasterDeskDataProvider {
    func getRows(for object: [GetCardDetailsModel], selectedIndex: Int?) -> [FiledModel]
    func getNaviColor(for object: [GetCardDetailsModel], selectedIndex: Int) -> ColorSheme
}

final class MasterDeskDataProviderImp {
    
}

extension MasterDeskDataProviderImp {
    
    func getRows(for object: [GetCardDetailsModel], selectedIndex: Int?) -> [FiledModel] {
        
        var rows: [FiledModel] = []
        
        if let index = selectedIndex {
            let selectedCard = object[index]
            rows.append(selectedCard.cardDetail())
            //rows.append(CardDetails(title: selectedCard.title, barcodeStyle: .barcode(code: selectedCard.code)))
        }
        
        let carouselItems: [CarouselItem] = object.map({ CardShelfItem(title: $0.title, image: #imageLiteral(resourceName: "Снимок экрана 2020-11-23 в 02.07.54")) })
        rows.append(CardShelf(cardTems: carouselItems))
        
        return rows
    }
    
    func getNaviColor(for object: [GetCardDetailsModel], selectedIndex: Int) -> ColorSheme {
        let selectedCard = object[selectedIndex]
        return selectedCard.colorSheme
    }
}

extension MasterDeskDataProviderImp: MasterDeskDataProvider {
    
}
