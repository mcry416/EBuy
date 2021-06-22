//
//  ReusableItemCell.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/1.
//

import UIKit

class ReusableItemCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var commodityTitle: UILabel!
    var price: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        installImageView()
        installCommodityTitle()
        installPrice()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install widget.
    private func installImageView(){
        imageView = UIImageView()
        imageView.tag = 1020
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints{ make in
            make.size.equalTo(150)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
    }
    
    private func installCommodityTitle(){
        commodityTitle = UILabel()
        commodityTitle.tag = 1021
        commodityTitle.numberOfLines = 2
        commodityTitle.adjustsFontSizeToFitWidth = true
        commodityTitle.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.ultraLight)
        self.addSubview(commodityTitle)
        
        commodityTitle.snp.makeConstraints{ make in
            make.width.equalTo(150)
            make.height.equalTo(40)
        //    make.left.equalTo(self.imageView.snp.left).offset(0)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.imageView.snp.bottom).offset(6)
        }
    }
    
    private func installPrice(){
        price = UILabel()
        price.tag = 1022
        price.textColor = UIColor.orange
        price.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(price)
        
        price.snp.makeConstraints{ make in
            make.width.equalTo(55)
            make.height.equalTo(25)
            make.top.equalTo(self.commodityTitle.snp.bottom).offset(6)
     //       make.left.equalTo(self.snp.left).offset(30)
            make.centerX.equalToSuperview()
        }
    }
}
