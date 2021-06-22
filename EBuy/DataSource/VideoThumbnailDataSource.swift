//
//  VideoThumbnailDataSource.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/3.
//

import Foundation
import UIKit
import Kingfisher

class VideoThumbnailDataSource: NSObject, UICollectionViewDataSource{
    
    let VIDEO_CELL_ID = "VIDEO_ID"
    
    var dataSource: Array<VideoThumbnailModel>!
    
    init(dataSource: Array<VideoThumbnailModel>) {
        self.dataSource = dataSource
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("------> SIZE:\(dataSource.count)")
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VIDEO_CELL_ID, for: indexPath)
        
        let imageView = cell.viewWithTag(1030) as? UIImageView
        
        if(dataSource.isEmpty){
            imageView?.image = UIImage(named: "load_back")
        } else{
            // FIXME: TEMP BLOCK.
            /*
            let url = dataSource[indexPath.row].imageViewLink
            imageView?.image = UIImage.loadWithURL(url:url!)
 */
            let url = URL(string: dataSource[indexPath.row].imageViewLink)
            imageView?.kf.setImage(with: url)
        }
        
        let title = cell.viewWithTag(1031) as? UILabel
        title?.text = dataSource[indexPath.row].titleText

        return cell
    }
    
}
