//
//  SpecialPriceDataSource.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/1.
//

import Foundation
import UIKit
import Kingfisher

class SpecialPriceDataSource: NSObject, UICollectionViewDataSource{
    
    var dataSource: Array<SpecialPriceModel>!
    
    init(dataSource: Array<SpecialPriceModel>) {
        self.dataSource = dataSource
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SPECIAL_PRICE", for: indexPath)
        
        let imageView = cell.viewWithTag(1010) as? UIImageView
        /*
        if (dataSource.isEmpty) {
            imageView?.image = UIImage(named: "home_watch")
        } else {
            let url = URL(string: dataSource[indexPath.row].imageViewName!)
            imageView?.kf.setImage(with: url)
        }
 */
        imageView?.image = UIImage(named: "iphone")
        
        let currentPriceLabel = cell.viewWithTag(1011) as? UILabel
        currentPriceLabel?.text = dataSource[indexPath.row].currentPriceText
        
        let originalPriceLabel = cell.viewWithTag(1012) as? UILabel
        originalPriceLabel?.text = dataSource[indexPath.row].originalPriceText
        
        let saleProgress = cell.viewWithTag(1013) as? UIProgressView
        saleProgress?.progress = Float(dataSource[indexPath.row].saleProgress)
        
        let saleLabel = cell.viewWithTag(1014) as? UILabel
        saleLabel?.text = dataSource[indexPath.row].saleText
        
        return cell
    }
    
}
