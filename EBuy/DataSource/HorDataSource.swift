//
//  HorDataSource.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/6.
//

import UIKit
import Kingfisher

class HorDataSource: NSObject, UICollectionViewDataSource {
    
    let HOR_CELL_ID = "HOR_CELL"
    
    var dataArray: Array<HorModel>!
    
    init(dataArray: Array<HorModel>) {
        self.dataArray = dataArray
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HOR_CELL_ID, for: indexPath)
        
        let commodityImage = cell.viewWithTag(1050) as? UIImageView
        
        if(dataArray.isEmpty){
            commodityImage?.image = UIImage(named: dataArray[indexPath.row].commodityImageName)
        } else {
            let url = URL(string: dataArray[indexPath.row].commodityImageName)
            commodityImage?.kf.setImage(with: url)
        }
        
        let indexIndicator = cell.viewWithTag(1052) as? UILabel
        indexIndicator?.text = "\(indexPath.row)/5"
        
        return cell
    }
}
