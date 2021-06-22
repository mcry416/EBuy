//
//  MessageModel.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/2.
//

import Foundation
class MessageModel{
    var imageViewName: String!
    var chatterText: String!
    var chatContentText: String!
    
    init(imageViewName: String, chatterText: String, chatContentText: String!){
        self.imageViewName = imageViewName
        self.chatterText = chatterText
        self.chatContentText = chatContentText
    }
}
