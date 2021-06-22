//
//  ReusableTypeDataSource.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/1.
//

import Foundation
import UIKit
import Kingfisher

class ReusableTypeDataSource: NSObject, UICollectionViewDataSource{
    
    var dataSource: Array<ReusableTypeModel>!
    
    init(dataSource: Array<ReusableTypeModel>) {
        self.dataSource = dataSource
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "REUSABLE_TYPE", for: indexPath)
        
        let imageView = cell.viewWithTag(1001) as? UIImageView
        /*
        if (dataSource.isEmpty) {
            imageView?.image = UIImage(named: "home_watch")
        } else {
            let url = URL(string: dataSource[indexPath.row].imageName!)
            imageView?.kf.setImage(with: url)
        }
 */
        imageView?.image = UIImage(named: "honor")
        
        
        let label = cell.viewWithTag(1002) as? UILabel
        label?.text = dataSource[indexPath.row].titleName
        
        return cell
    }
    
}
