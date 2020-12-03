//
//  CardDetails.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 14.11.2020.
//

import UIKit

enum CardDetailsBarCodeStyle {
    case barcode(code: String)
    case QRScan
}

struct CardDetails: FiledModel {
    
    var title: String
    
    var pointsObject: CardDetailsPointsObject?
    
    var shortDescription: String?
    
    var barcodeStyle: CardDetailsBarCodeStyle
    
    var colorSheme: ColorSheme
    
}

extension CardDetails {
    func cell(_ tableView: UITableView) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CardDetailtViewCell.identifier) as! CardDetailtViewCell
        cell.setUp(self)
        return cell
    }
    
    var height: CGFloat {
        return 500.0
    }
    
}

struct CardDetailsPointsObject {
    let value: Int
    let name: String
    
    let helpText: String?
    
    init(value: Int, name: String = "Баллов", helpText: String?=nil) {
        self.value = value
        self.name = name
        self.helpText = helpText
    }
    
}
