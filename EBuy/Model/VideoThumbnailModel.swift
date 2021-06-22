//
//  VideoThumbnailModel.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/3.
//

import Foundation

class VideoThumbnailModel{
    
    var link: String!
    var imageViewLink: String!
    var titleText: String!
    
    init(link: String, imageViewLink: String, titleText: String){
        self.link = link
        self.imageViewLink = imageViewLink
        self.titleText = titleText
    }
}
