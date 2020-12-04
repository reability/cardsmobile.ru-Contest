//
//  FullInfoDataProvider.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович

protocol FullInfoDataProvider {
    func getRows(for index: Int) -> [FiledModel]
}

// MARK: - Implementation

struct FullInfoDataProviderImp {}

// MARK: - For Presenter

extension FullInfoDataProviderImp: FullInfoDataProvider {
    
    func getRows(for index: Int) -> [FiledModel] {
        
        switch index {
        case 0:
            return _index0
        case 1:
            return _index1
        case 2:
            return _index2
        default:
            debugPrint("Отсвующий индекс")
            fatalError("Not implemented")
        }
    }
}
/// Костыль. Здесь просто лежат готовые модели. Следует формировать модель на основе данных с бекенда

private extension FullInfoDataProviderImp {
    
    var _index0: [FiledModel] {
        return [
            Space(size: 10),
            CardInfoHeader(title: "Вкус Гаражей", description: "Дисконтная карта"),
            CardInfoStatus(points: 200, colorSheme: .init(mainColor: .red, complementaryColor: .white)),
            Space(size: 20),
            CardInfoImage(image: #imageLiteral(resourceName: "Card_1")),
            Space(size: 20),
            CardInfoCode(code: "8957371839567"),
            Space(size: 2),
            CardInfoDescription(text: "Предъявите карту на кассе и получите 5% от суммы в балах. Оплачивайте до 50% покупки с помощью баллов. Каждые 10 баллов переводятся в 1 рубль"),
            Space(size: 2),
            CardInfoDescription(text: "Каждый день новые скидки на более чем 2000 товаров"),
            CardInfoPromoStories(items: [
                .init(text: "Новые скидки в честь белой пятницы", image: #imageLiteral(resourceName: "3074113-200")),
                .init(text: "Комплект ножей \"Шеф ножей\" за баллы только в декабре. Узнайте больше ", image: #imageLiteral(resourceName: "3074113-200")),
                .init(text: "Как украсить дом к новому году?", image: #imageLiteral(resourceName: "3074113-200")),
            ]),
            Space(size: 40.0),
            CardInfoButton(title: "Удалить карту")
        ]
    }
    
    var _index1: [FiledModel] {
        return [
            Space(size: 10),
            CardInfoHeader(title: "Маникюр Нади", description: "Дисконтная карта"),
            CardInfoImage(image: #imageLiteral(resourceName: "Card_2")),
            Space(size: 20),
            CardInfoCode(code: "2675303180285"),
            Space(size: 2),
            Space(size: 40.0),
            CardInfoButton(title: "Удалить карту")
        ]
    }
    
    var  _index2: [FiledModel] {
        return [
            Space(size: 10),
            CardInfoHeader(title: "Уткохвост", description: "Клубная карта"),
            Space(size: 20),
            CardInfoImage(image: #imageLiteral(resourceName: "Card_0")),
            Space(size: 2),
            CardInfoDescription(text: "Получайте доступ к лимитированным продуктам по предъявлению клубной карты"),
            Space(size: 40.0),
            CardInfoButton(title: "Удалить карту")
        ]
    }
    
}
