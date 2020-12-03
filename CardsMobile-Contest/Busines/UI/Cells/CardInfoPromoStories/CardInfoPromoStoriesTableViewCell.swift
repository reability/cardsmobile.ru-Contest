//
//  CardInfoPromoStoriesTableViewCell.swift
//  CardsMobile-Contest
//
//  Created by Ванурин Алексей Максимович on 02.12.2020.
//

import UIKit

final class CardInfoPromoStoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var items: [CardInfoPromoStory]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140.0, height: 280.0)
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        layout.scrollDirection = .horizontal
        
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(UINib(nibName: "PromoStoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: PromoStoryCollcectionViewCell.identifier)
        
    }
    
    func setUp(_ model: CardInfoPromoStories) {
        items = model.items
    }
    
}

extension CardInfoPromoStoriesTableViewCell:  UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoStoryCollcectionViewCell.identifier, for: indexPath) as! PromoStoryCollcectionViewCell
        cell.setUp(items[indexPath.row])
        return cell
    }
    
}
