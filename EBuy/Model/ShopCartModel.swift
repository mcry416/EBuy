//
//  ShopCartModel.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/5.
//

import Foundation

class ShopCartModel{
    
    var selectButtonName: String!
    var commodityImageName: String!
    var commodityTitleText: String!
    var commodityPriceText: String!
    var purchaseAmount: String!
    var operationStepperValue: Int!
    
    init(selectButtonName: String, commodityImageName: String, commodityTitleText: String, commodityPriceText: String, purchaseAmount: String, operationStepperValue: Int!){
        self.selectButtonName = selectButtonName
        self.commodityImageName = commodityImageName
        self.commodityTitleText = commodityTitleText
        self.commodityPriceText = commodityPriceText
        self.purchaseAmount = purchaseAmount
        self.operationStepperValue = operationStepperValue
    }
}
