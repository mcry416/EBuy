//
//  HomeReusableModel.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/10.
//

import Foundation

class HomeReusableModel{
    
    var reusableImageName: String!
    var reusableTitleText: String!
    var reusableCommentText: String!
    
    init(reusableImageName: String, reusableTitleText: String, reusableCommentText: String){
        self.reusableImageName = reusableImageName
        self.reusableTitleText = reusableTitleText
        self.reusableCommentText = reusableCommentText
    }
}
