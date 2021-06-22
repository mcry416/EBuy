//
//  ReusableItemDataSource.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/1.
//

import Foundation
import UIKit
import Kingfisher

class ReusableItemDataSource: NSObject, UICollectionViewDataSource{
    
    var dataSource: Array<ReusableItemModel>!
    
    init(dataSource: Array<ReusableItemModel>) {
        self.dataSource = dataSource
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "REUSABLE_ITEM", for: indexPath)
        
        let imageView = cell.viewWithTag(1020) as? UIImageView
        /*
        if (dataSource.isEmpty) {
            imageView?.image = UIImage(named: "home_watch")
        } else {
            let url = URL(string: dataSource[indexPath.row].imageViewName!)
            imageView?.kf.setImage(with: url)
        }
    */
        imageView?.image = UIImage(named: "vivo")
        
        let commodityTitle = cell.viewWithTag(1021) as? UILabel
        commodityTitle?.text = dataSource[indexPath.row].commodityText
        
        let priceLabel = cell.viewWithTag(1022) as? UILabel
        priceLabel?.text = dataSource[indexPath.row].priceText
        
        return cell
    }
    
}
