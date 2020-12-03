//
//  CardDetailsViewCell.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 14.11.2020.
//

import UIKit.UITableViewCell

fileprivate let instructionsBardcode: String = "Отсканируйте штрихкод"
fileprivate let instructionsScanQR: String = "Наведите сканер на QR-код"

final class CardDetailtViewCell: UITableViewCell {
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var barCodeHolderView: UIView!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var pontsLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    private var QRView: QRReaderView?
    
    
    func setUp(_ model: CardDetails) {
        mainTitleLabel.text = model.title
        setUpBarCodeView(for: model.barcodeStyle)
        
        if let points = model.pointsObject {
            pontsLabel.isHidden = false
            setUpPointsScore(with: points.value, and: points.name)
        } else {
            pontsLabel.isHidden = true
        }
        
        infoLabel.text = model.shortDescription ?? ""
        infoLabel.sizeToFit()
        
        let color = UIColor(red: 0.0, green: 84.0/255.0, blue: 41.0/255.0, alpha: 1.0).cgColor
        
        let gLayer = gradient(for: model.colorSheme.mainColor.cgColor, reverse: false)
        
        mainTitleLabel.textColor = model.colorSheme.complementaryColor
        pontsLabel.textColor = model.colorSheme.complementaryColor
        
        gLayer.frame = contentView.frame
        self.layer.addSublayer(gLayer)
        self.bringSubviewToFront(contentView)
        
        
        contentView.layer.cornerRadius = 12.0
        contentView.layer.masksToBounds = true
    }
    
    deinit {
        if QRView != nil {
            QRView?.stop()
        }
    }
    
    func gradient(for color: CGColor, reverse: Bool) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        gradient.colors = [
            color,
            UIColor.white.cgColor,
            UIColor.white.cgColor,
        ]
        gradient.locations = [0.0, 0.15, 1.0]
        return gradient
    }
    
}

private extension CardDetailtViewCell {
    
    func setUpBarCodeView(for barcodeStyle: CardDetailsBarCodeStyle) {
        switch barcodeStyle {
        case let .barcode(code):
            setUpBarCode(with: code)
            configureForBarCode()
        case .QRScan:
            setUpQRReader()
            configureQRReader()
        }
    }
    
    func setUpPointsScore(with value: Int, and name: String) {
        pontsLabel.text = "\(value) \(name)"
    }
    
    func setUpBarCode(with code: String) {
        let view = BarCode()
        barCodeHolderView.addSubview(view)
        view.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
        
        view.setCode(with: code)
    }
    
    func configureForBarCode() {
        instructionsLabel.text = instructionsBardcode
    }
    
    func setUpQRReader() {
        let view = QRReaderView()
        barCodeHolderView.addSubview(view)
        view.snp.makeConstraints { maker in
            maker.leading.equalToSuperview().offset(0.0)
            maker.trailing.equalToSuperview().offset(0.0)
            maker.top.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        view.commomInit()
        QRView = view
    }
    
    
    
    
    func configureQRReader() {
        instructionsLabel.text = instructionsScanQR
    }
}
