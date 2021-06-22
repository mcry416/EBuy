//
//  AlamofireUtil.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/11.
//

import Foundation
import Alamofire
import UIKit

enum MethodType {
    case get
    case post
}

class AlamofireUtil{
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (_ result : Any) -> ()) {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.AF.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            
            /*
            // 3.获取结果
            guard let result = response.result.value else {
                print(error!)
                return
            }
 */
            
            switch response.result {
            case .success(let json):
                finishedCallback(json)
                break
            case .failure(let error):
                print("error:\(error)")
                break
            }
            
            // 4.将结果回调出去
       //     finishedCallback(result)
        }
    }
}
