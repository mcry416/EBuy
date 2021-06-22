//
//  ShopCartCell.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/5.
//

import UIKit
import SnapKit

class ShopCartCell: UITableViewCell {
    
    var selectButton: UIButton!
    var commodityImage: UIImageView!
    var commodityTitle: UILabel!
    var commodityPrice: UILabel!
    var purchaseAmount: UILabel!
    var operationStepper: UIStepper!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.isUserInteractionEnabled = true
         
        installSelectButton()
        installCommodityImage()
        installCommodityTitle()
        installCommodityPrice()
        installOperationStepper()
        installPurchaseAmount()
    }
    
    // MARK: - Install widget.
    private func installSelectButton(){
        selectButton = UIButton(type: .custom)
        selectButton?.setImage(UIImage(named:"select_no"), for: UIControl.State.normal)
        selectButton?.setImage(UIImage(named:"select_yes"), for: UIControl.State.selected)
        selectButton?.setImage(UIImage(named:"select_yes"), for: UIControl.State.highlighted)
        selectButton.tag = 1040
        self.contentView.addSubview(selectButton)
        
        selectButton.snp.makeConstraints{ make in
            make.size.equalTo(18)
            make.centerY.equalToSuperview()
            make.left.equalTo(self.snp.left).offset(25)
        }
    }
    
    private func installCommodityImage(){
        commodityImage = UIImageView()
        commodityImage.tag = 1041
        self.contentView.addSubview(commodityImage)
        
        commodityImage.snp.makeConstraints{ make in
            make.size.equalTo(90)
            make.centerY.equalToSuperview()
            make.left.equalTo(self.selectButton.snp.right).offset(10)
        }
    }
    
    private func installCommodityTitle(){
        commodityTitle = UILabel()
        commodityTitle.tag = 1042
        commodityTitle.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        self.contentView.addSubview(commodityTitle)
        
        commodityTitle.snp.makeConstraints{ make in
            make.width.equalTo(200)
            make.height.equalTo(55)
            make.top.equalTo(self.commodityImage.snp.top)
            make.left.equalTo(self.commodityImage.snp.right).offset(20)
        }
    }
    
    private func installCommodityPrice(){
        commodityPrice = UILabel()
        commodityPrice.tag = 1043
        commodityPrice.textColor = UIColor.orange
        self.contentView.addSubview(commodityPrice)
        
        commodityPrice.snp.makeConstraints{ make in
            make.width.equalTo(50)
            make.height.equalTo(27)
            make.left.equalTo(self.commodityTitle.snp.left)
            make.bottom.equalTo(self.commodityImage.snp.bottom)
        }
    }
    
    private func installOperationStepper(){
        operationStepper = UIStepper()
        operationStepper.minimumValue = 1
        operationStepper.value = 1
        operationStepper.tag = 1044
        operationStepper.isUserInteractionEnabled = true
        self.contentView.addSubview(operationStepper)
        
        operationStepper.snp.makeConstraints{ make in
            make.right.equalTo(self.snp.right).offset(-18)
            make.bottom.equalTo(self.commodityImage.snp.bottom)
        }
    }
    
    private func installPurchaseAmount(){
        purchaseAmount = UILabel()
        purchaseAmount.text = "数量:1"
        purchaseAmount.tag = 1045
        self.contentView.addSubview(purchaseAmount)
        
        purchaseAmount.snp.makeConstraints{ make in
            make.width.equalTo(65)
            make.height.equalTo(27)
            make.right.equalTo(self.operationStepper.snp.left).offset(-10)
            make.bottom.equalTo(self.commodityImage.snp.bottom)
        }
    }

    // MARK: - Default settings.
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
