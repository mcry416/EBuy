//
//  OrderCell.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/8.
//

import UIKit

class OrderCell: UICollectionViewCell {
    
    var orderImage: UIImageView!
    var orderTitle: UILabel!
    var orderPrice: UILabel!
    var orderAmount: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
        
        installOrderImage()
        installOrderTitle()
        installOrderPrice()
        installOrderAmount()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration.
    private func initView(){
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
    }
    
    // MARK: - Install widget.
    private func installOrderImage(){
        orderImage = UIImageView()
        orderImage.tag = 1070
        orderImage.layer.masksToBounds = true
        orderImage.layer.cornerRadius = 5
        self.contentView.addSubview(orderImage)
        
        orderImage.snp.makeConstraints{ make in
            make.size.equalTo(100)
            make.centerY.equalToSuperview()
            make.left.equalTo(self.contentView.snp.left).offset(20)
        }
    }
    
    private func installOrderTitle(){
        orderTitle = UILabel()
        orderTitle.tag = 1071
        orderTitle.numberOfLines = 2
        orderTitle.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        self.contentView.addSubview(orderTitle)
        
        orderTitle.snp.makeConstraints{ make in
            make.width.equalTo(self.contentView.frame.width - 120)
            make.height.equalTo(40)
            make.left.equalTo(self.orderImage.snp.right).offset(20)
            make.top.equalTo(self.orderImage.snp.top)
        }
    }
    
    private func installOrderPrice(){
        orderPrice = UILabel()
        orderPrice.tag = 1072
        orderPrice.textColor = UIColor.orange
        orderPrice.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.heavy)
        self.contentView.addSubview(orderPrice)
        
        orderPrice.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.left.equalTo(self.orderImage.snp.right).offset(20)
            make.bottom.equalTo(self.orderImage.snp.bottom)
        }
    }
    
    private func installOrderAmount(){
        orderAmount = UILabel()
        orderAmount.tag = 1073
        self.contentView.addSubview(orderAmount)
        
        orderAmount.snp.makeConstraints{ make in
            make.width.equalTo(80)
            make.height.equalTo(30)
            make.bottom.equalTo(self.orderImage.snp.bottom)
            make.right.equalToSuperview().offset(-20)
        }
    }
}
