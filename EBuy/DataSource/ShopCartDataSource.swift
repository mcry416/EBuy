//
//  ShopCartDataSource.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/5.
//

import UIKit

class ShopCartDataSource: NSObject, UITableViewDataSource {
    
    let SHOP_CART_CELL_ID = "SHOP_CART_ID"
    
    var dataSource: Array<ShopCartModel>!
    
    init(dataSource: Array<ShopCartModel>) {
        self.dataSource = dataSource
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SHOP_CART_CELL_ID, for: indexPath)
        
        let selectButton = cell.viewWithTag(1040) as? UIButton
 //       selectButton?.setImage(UIImage(named: dataSource[indexPath.row].selectButtonName), for: UIControl.State.normal)
        
        let commdityImage = cell.viewWithTag(1041) as? UIImageView
        commdityImage?.image = UIImage(named: dataSource[indexPath.row].commodityImageName)
        
        let commodityTitle = cell.viewWithTag(1042) as? UILabel
        commodityTitle?.text = dataSource[indexPath.row].commodityTitleText
        
        let commodityPrice = cell.viewWithTag(1043) as? UILabel
        commodityPrice?.text = dataSource[indexPath.row].commodityPriceText
        
        let operationStepper = cell.viewWithTag(1044) as? UIStepper
        operationStepper?.value = Double(dataSource[indexPath.row].operationStepperValue)
        
        let purchaseAmount = cell.viewWithTag(1045) as? UILabel
        purchaseAmount?.text = dataSource[indexPath.row].purchaseAmount
        
        return cell
    }

}
