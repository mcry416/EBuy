//
//  OrderModel.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/8.
//

import Foundation

class OrderModel{
    
    var orderImageName: String!
    var orderTitleText: String!
    var orderPriceText: String!
    var orderAmountText: String!
    
    init(orderImageName: String, orderTitleText: String ,orderPriceText: String, orderAmountText: String){
        self.orderImageName = orderImageName
        self.orderTitleText = orderTitleText
        self.orderPriceText = orderPriceText
        self.orderAmountText = orderAmountText
    }
}
