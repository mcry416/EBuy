//
//  FSDataSource.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/10.
//

import UIKit
import FSPagerView
import Kingfisher

class FSDataSource: NSObject, FSPagerViewDataSource {
    
    let FS_CELL_ID = "FS_CELL"
    
    var imagesArray: Array<String>!
    var images: Array<String> = ["f1", "f2"]
    
    init(imagesArray: Array<String>){
        self.imagesArray = imagesArray
    }
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return images.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: FS_CELL_ID, at: index)

        if(imagesArray.isEmpty){
            let imageName = images[index]
            cell.imageView?.image = UIImage(named: imageName)
        } else{
            /*
            let url = imagesArray[index]
            cell.imageView?.image = UIImage.loadWithURL(url:url)
 */
            let url = URL(string: imagesArray[index])
            cell.imageView?.kf.setImage(with: url)
        }
        
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        
        return cell
    }
    
}

extension UIImage {
    class func loadWithURL(url: String) -> UIImage {
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
