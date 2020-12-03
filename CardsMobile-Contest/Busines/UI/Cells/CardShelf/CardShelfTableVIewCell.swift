//
//  CardShelfTableVIewCell.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 18.11.2020.
//

import UIKit

protocol CardShelfDelegate: class {
    func didSelectedCard(with index: Int)
}

final class CardShelfTableViewCell: UITableViewCell, Delegatable {
    
    weak var delegate: AnyObject?
    
    private var pageSize: CGSize {
        let layout = self.collectionView.collectionViewLayout as! CardCarouselLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    var currentIndex: Int = 0
    var isSetupCompleted: Bool = false
    
    var rows: [CarouselItem] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let layout = CardCarouselLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: bounds.width/5, height: bounds.height)
        print(layout.itemSize)
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        
        layout.sideItemScale = 0.5
        layout.sideItemAlpha = 1.0
        layout.spacingMode = .fixed(spacing: 40)

        collectionView.collectionViewLayout = layout
        
        registerCells()
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
    }
    
    func setup(_ model: CardShelf) {
        
        rows = model.cardTems
        collectionView.reloadData()
        
        if !isSetupCompleted {
            isSetupCompleted = true
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(at: IndexPath(row: 1, section: 0), at: .centeredHorizontally, animated: false)
        }
        }
    }
    
}

extension CardShelfTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardShelfItemCollectionViewCell.identifier, for: indexPath) as! CardShelfItemCollectionViewCell
        cell.setup(rows[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        guard let delegate = delegate as? CardShelfDelegate else { return }
        
        let pageSide = self.pageSize.width
        let offset = scrollView.contentOffset.x
        
        currentIndex = Int(floor((offset - pageSide / 2) / pageSide) + 1)
        delegate.didSelectedCard(with: currentIndex)
    }
    
}

extension CardShelfTableViewCell {
    
    func registerCells() {
        collectionView.register(UINib(nibName: "CardShelfItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: CardShelfItemCollectionViewCell.identifier)
    }
    
}
