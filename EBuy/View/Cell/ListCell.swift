//
//  ListCell.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/8.
//

import UIKit
import SnapKit

class ListCell: UICollectionViewCell {
    
    var commodityImage: UIImageView!
    var commodityTitle: UILabel!
    var stackView: UIStackView!
    var featuresOne: UILabel!
    var featuresTwo: UILabel!
    var featuresThree: UILabel!
    var commodityPrice: UILabel!
    var bottomLine: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
  
        installCommodityImage()
        installCommodityTitle()
        installStackView()
        installFeaturesOne()
        installFeaturesTwo()
        installFeaturesThree()
        installCommodityPrice()
        installBottomLine()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install widget.
    private func installCommodityImage(){
        commodityImage = UIImageView()
        commodityImage.layer.masksToBounds = true
        commodityImage.layer.cornerRadius = 5
        commodityImage.tag = 1060
        self.contentView.addSubview(commodityImage)
        
        commodityImage.snp.makeConstraints{ make in
            make.size.equalTo(100)
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    private func installCommodityTitle(){
        commodityTitle = UILabel()
        commodityTitle.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.heavy)
        commodityTitle.numberOfLines = 2
        commodityTitle.tag = 1061
        self.contentView.addSubview(commodityTitle)
        
        commodityTitle.snp.makeConstraints{ make in
            make.width.equalTo(self.contentView.frame.width - self.commodityImage.frame.width - 40)
            make.top.equalTo(self.commodityImage.snp.top)
            make.left.equalTo(self.commodityImage.snp.right).offset(35)
        }
    }
    
    private func installStackView(){
        stackView = UIStackView()
        stackView.alignment = .bottom
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.tag = 1062
        self.contentView.addSubview(stackView)
        
        stackView.snp.makeConstraints{ make in
            make.width.equalTo(self.contentView.frame.width - self.commodityImage.frame.width - 40)
            make.top.equalTo(self.commodityTitle.snp.bottom).offset(10)
            make.left.equalTo(self.commodityImage.snp.right).offset(35)
        }
    }
    
    private func installFeaturesOne(){
        featuresOne = UILabel()
        featuresOne.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.thin)
        featuresOne.tag = 1063
        
        featuresOne.snp.makeConstraints{ make in
            make.width.equalTo(50)
            make.height.equalTo(20)
        }

        stackView.addArrangedSubview(featuresOne)
    }
    
    private func installFeaturesTwo(){
        featuresTwo = UILabel()
        featuresTwo.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.thin)
        featuresTwo.tag = 1064
        
        featuresTwo.snp.makeConstraints{ make in
            make.width.equalTo(50)
            make.height.equalTo(20)
        }

        stackView.addArrangedSubview(featuresTwo)
    }
    
    private func installFeaturesThree(){
        featuresThree = UILabel()
        featuresThree.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.thin)
        featuresThree.tag = 1065
        
        featuresThree.snp.makeConstraints{ make in
            make.width.equalTo(50)
            make.height.equalTo(20)
        }

        stackView.addArrangedSubview(featuresThree)
    }
    
    private func installCommodityPrice(){
        commodityPrice = UILabel()
        commodityPrice.textColor = UIColor.orange
        commodityPrice.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.heavy)
        commodityPrice.tag = 1066
        self.contentView.addSubview(commodityPrice)
        
        commodityPrice.snp.makeConstraints{ make in
            make.width.equalTo(80)
            make.height.equalTo(20)
            make.left.equalTo(self.commodityTitle.snp.left)
            make.bottom.equalTo(self.commodityImage.snp.bottom)
        }
    }
    
    private func installBottomLine(){
        bottomLine = UIView()
        bottomLine.tag = 1067
        bottomLine.backgroundColor = UIColor.gray
        self.contentView.addSubview(bottomLine)
        
        bottomLine.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(1)
            make.bottom.equalToSuperview()
        }
    }
}
