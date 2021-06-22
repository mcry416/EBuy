//
//  SpecialPriceModel.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/1.
//

import Foundation

class SpecialPriceModel {
    var imageViewName: String!
    var currentPriceText: String!
    var originalPriceText: String!
    var saleProgress: Int!
    var saleText: String!
    
    init(imaViewName: String, currentPriceText: String, originalPriceText: String, saleProgress: Int, saleText: String){
        self.imageViewName = imaViewName
        self.currentPriceText = currentPriceText
        self.originalPriceText = originalPriceText
        self.saleProgress = saleProgress
        self.saleText = saleText
    }
}
