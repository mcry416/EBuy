//
//  OrderDataSource.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/8.
//

import UIKit

class OrderDataSource: NSObject, UICollectionViewDataSource {
    
    let ORDER_CELL_ID = "ORDER_CELL"
    
    var dataArray: Array<OrderModel>!
    
    init(dataArray: Array<OrderModel>){
        self.dataArray = dataArray
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ORDER_CELL_ID, for: indexPath)
        
        let orderImage = cell.viewWithTag(1070) as? UIImageView
        orderImage?.image = UIImage(named: dataArray[indexPath.row].orderImageName)
        
        let orderTitle = cell.viewWithTag(1071) as? UILabel
        orderTitle?.text = dataArray[indexPath.row].orderTitleText
        
        let orderPrice = cell.viewWithTag(1072) as? UILabel
        orderPrice?.text = dataArray[indexPath.row].orderPriceText

        let orderAmount = cell.viewWithTag(1073) as? UILabel
        orderAmount?.text = dataArray[indexPath.row].orderAmountText
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

}
