//
//  GetCardDetailsModel.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 15.11.2020.
//

import Foundation
import UIKit

struct GetCardDetailsModel {
    
    let title: String
    let code: String
    let info: String?
    
    let status: Bool?
    let amount: Int?
    
    let colorSheme: GetCardDetailsModelColorSheme
    
}

struct GetCardDetailsModelColorSheme {
    let mainColor: UIColor
    let complementaryColor: UIColor
}

extension GetCardDetailsModel {
    
    func cardDetail() -> CardDetails {
        switch self.code {
        case "QR":
            return .init(title: self.title, pointsObject: makePoints(for: self.amount), shortDescription: info, barcodeStyle: .QRScan, colorSheme: self.colorSheme)
        default:
            return .init(title: self.title, pointsObject: makePoints(for: self.amount), shortDescription: self.info, barcodeStyle: .barcode(code: self.code), colorSheme: self.colorSheme)
        }
    }
    
    private func makePoints(for value: Int?) -> CardDetailsPointsObject? {
        guard let value = value else { return nil }
        
        return .init(value: value)
    }
    
}
