//
//  BarCode.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 14.11.2020.
//

import UIKit
import SnapKit
import RSBarcodes_Swift
import AVFoundation

/// Remark: = This wors only wie EAN13

final class BarCode: UIView {
    
    private var codeType: AVMetadataObject.ObjectType = .ean13
    
    // MARK: - UI
    
    private lazy var barCodeView: UIImageView = {
        $0.backgroundColor = .white
        
        return $0
    }(UIImageView())
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    // MARK: - API
    
    func setCode(with codestring: String) {
        guard let codeImage = RSUnifiedCodeGenerator.shared.generateCode(codestring, machineReadableCodeObjectType: codeType.rawValue) else {
            debugPrint("\(self.description) failed to init a barcode from string \(codestring)(characters:\(codestring.count)")
            return }
        barCodeView.image = codeImage
    }
    
}

// MARK: - Private UI

private extension BarCode {
    
    func commonInit() {
        addSubview(barCodeView)
        barCodeView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
    
}
