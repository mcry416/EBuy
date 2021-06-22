//
//  ImageLoad.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/17.
//

import Foundation
import UIKit

extension UIImage {
    class func downloadFromURL(url: String) -> UIImage {
        let url = URL(string: url)!;
        var img = UIImage();
        
        do{
            let data = try Data(contentsOf: url);
            img = UIImage(data: data)!;
        } catch let err as NSError {
            print("下载图片出错：\\(err)");
        }
        
        return img;
    }
}
