//
//  MasterDeskDataProvider.swift
//  CardsMobile-Contest

//  Created by Ванурин Алексей Максимович

protocol MasterDeskDataProvider {
    func getRows(for object: [GetCardDetailsModel], selectedIndex: Int?) -> [FiledModel]
    func getNaviColor(for object: [GetCardDetailsModel], selectedIndex: Int) -> ColorSheme
}

// MARK: - Implementation

struct MasterDeskDataProviderImp {
    
}

// MARK: - For Presenter

extension MasterDeskDataProviderImp: MasterDeskDataProvider {
    
    /// Основые ячейки
    
    func getRows(for object: [GetCardDetailsModel], selectedIndex: Int?) -> [FiledModel] {
        
        var rows: [FiledModel] = []
        
        if let index = selectedIndex {
            let selectedCard = object[index]
            rows.append(selectedCard.cardDetail())
        }
        
        let carouselItems: [CarouselItem] = object.map({ CardShelfItem(title: $0.title, image: #imageLiteral(resourceName: "Снимок экрана 2020-11-23 в 02.07.54")) })
        rows.append(CardShelf(cardTems: carouselItems))
        
        return rows
    }
    
    /// Костыль. Так делать не стоит
    
    func getNaviColor(for object: [GetCardDetailsModel], selectedIndex: Int) -> ColorSheme {
        let selectedCard = object[selectedIndex]
        return selectedCard.colorSheme
    }
    
}
