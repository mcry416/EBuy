//
//  HomeReusableDataSource.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/10.
//

import UIKit

class HomeReusableDataSource: NSObject, UICollectionViewDataSource {
    
    let HOME_REUSABLE_CELL_ID = "HOME_REUSABLE_CELL"
    
    var dataArray: Array<HomeReusableModel>!
    
    init(dataArray: Array<HomeReusableModel>){
        self.dataArray = dataArray
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HOME_REUSABLE_CELL_ID, for: indexPath)
        
        let reusableImageView = cell.viewWithTag(1080) as? UIImageView
        if (dataArray.isEmpty) {
            reusableImageView?.image = UIImage(named: "home_watch")
        } else {
            let url = URL(string: dataArray[indexPath.row].reusableImageName!)
            reusableImageView?.kf.setImage(with: url)
        }
        
        let reusableTitle = cell.viewWithTag(1081) as? UILabel
        reusableTitle?.text = dataArray[indexPath.row].reusableTitleText
        
        let reusableComment = cell.viewWithTag(1082) as? UILabel
        reusableComment?.text = dataArray[indexPath.row].reusableCommentText
        
        return cell
    }
}
