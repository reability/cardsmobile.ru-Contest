
# CardMobile-Contest

Работа для конкурса кошелек mobile challenge (https://cardsmobile.ru/kmc/)

- Платформа: iOS
- Таргет: iOS 10.3+
- Устройства: iPhone

Использованные библиотеки

- RSBarcodes_Swift (Генератор штрих кодов)
- SnapKit

## Овервью

Приложении состоит из двух модулей: MasterDesk и FullInfo

<img src="https://github.com/reability/cardsmobile.ru-Contest/blob/main/Img/IMG-1316.gif" alt="drawing" width="200"/>

MasterDesk - экран со списком зарегистрированных карт и быстрым доступом до основной информации

<img src="https://github.com/reability/cardsmobile.ru-Contest/blob/main/Img/screen3.jpeg" alt="drawing" width="200"/>

FullInfo - экран с дополнительной детальной инфомацией карточки

<img src="https://github.com/reability/cardsmobile.ru-Contest/blob/main/Img/screen1.jpeg" alt="drawing" width="200"/>

## Дизайн

Дизайн продумывался с целью упростить пользование повседневными дисконтными картами без расмотрения других видов карт или редкоиспользующийся карты

### Отказ от схожести с физической карты

Идея сделаьт UI похожий на физическую карта не была рассмотрена. Приложения от использования такого подхода теряет в производительности и скорости загрузки и, как конечный результат, проигрывает фотографиям карт в мобильных телефонов, т.к. скорость загрузки нужной карты имеет решаюшую роль

Главный экран приложения позволяет быстро найти наиболее использующеся карты и тут же отобразить наиболее необходимую информацию такую как шрихкод или количество балов

<img src="https://github.com/reability/cardsmobile.ru-Contest/blob/main/Img/screen2.jpeg" alt="drawing" width="200"/>

### Карусель из карт под одну свободную руку

Изначальная мысль заключалась в том, что пользователи могут иметь необходимость использовать приложения имея только одну свободную руку. Дизайн приложения позволяет получать доступ до важного штрих кода используя только праую нижнию часть главного экрана

<img src="https://github.com/reability/cardsmobile.ru-Contest/blob/main/Img/IMG-1315.gif" alt="drawing" width="200"/>

### Гибкий UI

Для каждого отдельного случая легко создавать собственный вариант интерфейса. Например если потребуется куар-ридер вместо штрихкода


<img src="https://github.com/reability/cardsmobile.ru-Contest/blob/main/Img/IMG-1317-1.gif" alt="drawing" width="200"/>

### Цветовые акценты

Для того, чтобы помочь пользователям проше найти нужную карту, вместо выбора одного цвета в качестве акцента, приложение подбирать цветовые схемы в зависимости от выбранной карты

## Архитектура

Основная архитектура приложения - разбение на VIPER+DataProvider модули. View является очень простым классом, единственная задача которого - рисовать интерфейс заключенный в DataProvider подходом, похожим на декларативный подход. Интеракторы могут получать модели как от неких сервисов так и из репозиториев

Интерфейс экранов задается массивом FiledModel, что позволяет легко добавлять в детали карты любые новые виджеты и твикая интерфейс каждой отдельной карты так, как это захочется. Таким образом для одной карты можно составить простой интерфейс

```swift
    private func _index1() -> [FiledModel] {
        return [
            Space(size: 10),
            CardInfoHeader(title: "Маникюр Нади", description: "Дисконтная карта"),
            CardInfoImage(image: #imageLiteral(resourceName: "***")),
            Space(size: 20),
            CardInfoCode(code: "2675303180285"),
            Space(size: 2),
            Space(size: 40.0),
            CardInfoButton(title: "Удалить карту")
        ]
    }
```

А для усложения достаточно добавить элементов в массив

```swift
    private func _index0() -> [FiledModel] {
        return [
            Space(size: 10),
            CardInfoHeader(title: "Вкус Гаражей", description: "Дисконтная карта"),
            CardInfoStatus(points: 200, colorSheme: .init(mainColor: .red, complementaryColor: .white)),
            Space(size: 20),
            CardInfoImage(image: #imageLiteral(resourceName: "karta_adidas_standart")),
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
```

UI использует обыкновенную таблицу UITableView и для добавление нового виджета достаточно нарисовать новую UITableViewCell и добавить модель

```swift
protocol FiledModel {
    
    var height: CGFloat { get }
    func cell(_ tableView: UITableView) -> UITableViewCell
    
}
```

Взаимодествие с такими виджетами берет на себя презентеры и выглядить это может так

```swift
    func didTaped(on model: FiledModel) {
        switch model {
        case is CardDetails:
            view.openDeatilsModule(with: currentIndex)
        default:
            break
        }
    }
```

## Оговоренности

Работа имеет ряд оговоренностей

- Дизайн скорее отображает в себе основную идею. Работы со шрифтами, размерами, цветами, анимацией не проводилось. Я к сожалению не дизайнер
- Код содержит в себе определнный ряд костылей в связи с нехваткой времени правильно раскидать это по экстеншенам и инкапсуляции логики в отдельный абстракции
- Работа с изображениями должна вестись с использование бекенда и этот момент был опушен и везде просто напрямую используются изображения из ассетов
- Работа с сетью и кешом опущена, хоть и подразумевается в коде
- DI и Раутинг упрощены до простых билдеров
- Ячейка с videoCapture написана плохо :(


