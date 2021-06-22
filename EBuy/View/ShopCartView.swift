//
//  ShopCartView.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/5.
//

import UIKit
import SnapKit

class ShopCartView: UIView {
    
    let SHOP_CART_CELL_ID = "SHOP_CART_ID"
    
    var shopCartTableView: UITableView!
    var rootOfBottom: UIImageView!
    var selectButton: UIButton!
    var totalPrice: UILabel!
    var payButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        installRootOfBottom()
        installSelectButton()
        installTotalPrice()
        installPayButton()
        installShopCartTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     // MARK: - Install widget.
    private func installRootOfBottom(){
        rootOfBottom = UIImageView()
        rootOfBottom.isUserInteractionEnabled = true
        rootOfBottom.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.998, alpha: 1.0)
        self.addSubview(rootOfBottom)
        
        rootOfBottom.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func installSelectButton(){
        selectButton = UIButton(type: .custom)
        selectButton?.setImage(UIImage(named:"select_no"), for: UIControl.State.normal)
        selectButton?.setImage(UIImage(named:"select_yes"), for: UIControl.State.selected)
        selectButton?.setImage(UIImage(named:"select_yes"), for: UIControl.State.highlighted)
        self.rootOfBottom.addSubview(selectButton)
        
        selectButton.snp.makeConstraints{ make in
            make.size.equalTo(18)
            make.centerY.equalToSuperview()
            make.left.equalTo(self.rootOfBottom.snp.left).offset(25)
        }
    }
    
    private func installTotalPrice(){
        totalPrice = UILabel()
        totalPrice.text = "共计："
        totalPrice.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.heavy)
        self.rootOfBottom.addSubview(totalPrice)
        
        totalPrice.snp.makeConstraints{ make in
            make.width.equalTo(130)
            make.height.equalTo(35)
            make.centerY.equalToSuperview()
            make.left.equalTo(self.selectButton.snp.right).offset(20)
        }
    }
    
    private func installPayButton(){
        payButton = UIButton(type: .custom)
        payButton.setTitle("付款", for: UIControl.State.normal)
        payButton.layer.masksToBounds = true
        payButton.layer.cornerRadius = 10
        payButton.backgroundColor = UIColor.red
        payButton.setTitleColor(UIColor.gray, for: UIControl.State.highlighted)
        payButton.isUserInteractionEnabled = true
        self.rootOfBottom.addSubview(payButton)
        
        payButton.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(35)
            make.centerY.equalToSuperview()
            make.right.equalTo(self.rootOfBottom.snp.right).offset(-20)
        }
    }
    
    private func installShopCartTableView(){
        shopCartTableView = UITableView(frame: self.frame, style: .plain)
        shopCartTableView.register(ShopCartCell.self, forCellReuseIdentifier: SHOP_CART_CELL_ID)
        self.addSubview(shopCartTableView)
        
        shopCartTableView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.rootOfBottom.snp.top)
        }
    }
    
    
}
