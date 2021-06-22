//
//  ListDataSource.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/8.
//

import UIKit
import Kingfisher

class ListDataSource: NSObject, UICollectionViewDataSource {
    
    var LIST_CELL_ID = "LIST_CELL"
    
    var dataArray: Array<ListModel>!
    
    init(dataArray: Array<ListModel>){
        self.dataArray = dataArray
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LIST_CELL_ID, for: indexPath)
        
        let commodityImage = cell.viewWithTag(1060) as? UIImageView
     //   commodityImage?.image = UIImage(named: dataArray[indexPath.row].commodityImageName)
        if(dataArray.isEmpty){
            commodityImage?.image = UIImage(named: dataArray[indexPath.row].commodityImageName)
        } else {
            let url = URL(string: dataArray[indexPath.row].commodityImageName)
            commodityImage?.kf.setImage(with: url)
        }
        
        let commodityTitle = cell.viewWithTag(1061) as? UILabel
        commodityTitle?.text = dataArray[indexPath.row].commodityTitleText
        
        _ = cell.viewWithTag(1062) as? UIStackView
        
        let featuresOne = cell.viewWithTag(1063) as? UILabel
        featuresOne?.text = dataArray[indexPath.row].featuresOneText
        
        let featuresTwo = cell.viewWithTag(1064) as? UILabel
        featuresTwo?.text = dataArray[indexPath.row].featuresTwoText
        
        let featuresThree = cell.viewWithTag(1065) as? UILabel
        featuresThree?.text = dataArray[indexPath.row].featuresThreeText
        
        let commodityPrice = cell.viewWithTag(1066) as? UILabel
        commodityPrice?.text = dataArray[indexPath.row].commodityPriceText
        
        _ = cell.viewWithTag(1067)
        
        return cell
    }

}
