//
//  ListModel.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/8.
//

import Foundation

class ListModel{
    
    var commodityId: String!
    var commodityImageName: String!
    var commodityTitleText: String!
    var featuresOneText: String!
    var featuresTwoText: String!
    var featuresThreeText: String!
    var commodityPriceText: String!
    
    init(commodityId: String, commodityImageName: String, commodityTitleText: String, featuresOneText: String, featuresTwoText: String, featuresThreeText: String, commodityPriceText: String){
        self.commodityId = commodityId
        self.commodityImageName = commodityImageName
        self.commodityTitleText = commodityTitleText
        self.featuresOneText = featuresOneText
        self.featuresTwoText = featuresTwoText
        self.featuresThreeText = featuresThreeText
        self.commodityPriceText = commodityPriceText
    }
    
}
