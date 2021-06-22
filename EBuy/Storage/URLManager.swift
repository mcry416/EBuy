//
//  URLManager.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/16.
//

import Foundation

class URLManager{
    
    public static func getURL(type: String) -> String{
        let HOST_ADDRESS = "192.168.1.102"
        switch type {
        case "home":
            return "http://\(HOST_ADDRESS):8080/ebuy/home/"
        case "video":
            return "http://\(HOST_ADDRESS):8080/ebuy/video/"
        case "video_detail":
            return "http://\(HOST_ADDRESS):8080/ebuy/home/1"
        case "shopcart":
            return "http://\(HOST_ADDRESS):8080/ebuy/home/1"
        case "login":
            return "http://\(HOST_ADDRESS):8080/ebuy/login/"
        case "register":
            return "http://\(HOST_ADDRESS):8080/ebuy/register/"
        case "order_id":
            return "http://\(HOST_ADDRESS):8080/ebuy/order/id/"
        case "order_list":
            return "http://\(HOST_ADDRESS):8080/ebuy/home/1"
        case "search_detail":
            return "http://\(HOST_ADDRESS):8080/ebuy/id/search/"
        case "search_list":
            return "http://\(HOST_ADDRESS):8080/ebuy/search/"
        case "reusable":
            return "http://\(HOST_ADDRESS):8080/ebuy/home/1"
        default:
            return ""
        }
    }
    
}
