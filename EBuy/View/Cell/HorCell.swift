//
//  HorCell.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/6.
//

import UIKit
import SnapKit

class HorCell: UICollectionViewCell {
    
    var commodityImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
  
        installCommodityImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install widget.
    private func installCommodityImage(){
        commodityImage = UIImageView()
        commodityImage.tag = 1050
        self.contentView.addSubview(commodityImage)
        
        commodityImage.snp.makeConstraints{ make in
            make.size.equalToSuperview()
        }
    }
    
}
