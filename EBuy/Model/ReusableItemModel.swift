//
//  ReusableItemModel.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/1.
//

import Foundation

class ReusableItemModel{
    var imageViewName: String!
    var commodityText: String!
    var priceText: String!
    
    init(imageViewName: String, commodityText: String, priceText: String) {
        self.imageViewName = imageViewName
        self.commodityText = commodityText
        self.priceText = priceText
    }
}
