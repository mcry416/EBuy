//
//  CommodityView.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/6.
//

import UIKit
import SnapKit

class CommodityView: UIView {
    
    let HOR_CELL_ID = "HOR_CELL"
    
    var horCollectionView: UICollectionView!
    var commodityTitle: UILabel!
    var commodityPrice: UILabel!
    var commodityProspectus: UILabel!
    var rootOfBottom: UIImageView!
    var addShopCartButton: UIButton!
    var purchaseButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    //    self.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.998, alpha: 1.0)
        self.backgroundColor = UIColor.white
        
        installHorCollectionView()
        installCommodityTitle()
        installCommodityPrice()
        installCommodityProspectus()
        installRootOfBottom()
        installPurchaseButton()
        installAddShopCartButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install widget.
    private func installHorCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: (self.frame.width), height: (self.frame.width))
        
        horCollectionView = UICollectionView(frame: CGRect(x: 0, y: 150, width: self.frame.width, height: self.frame.width), collectionViewLayout: flowLayout)
        horCollectionView.backgroundColor = UIColor.white
        horCollectionView.register(HorCell.self, forCellWithReuseIdentifier: HOR_CELL_ID)
        horCollectionView.alwaysBounceVertical = true
        horCollectionView.isPagingEnabled = true
        horCollectionView.alwaysBounceVertical = false
        self.addSubview(horCollectionView)
        
        horCollectionView.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.width)
            make.height.equalTo(self.frame.width)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func installRootOfBottom(){
        rootOfBottom = UIImageView()
        rootOfBottom.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.998, alpha: 1.0)
        rootOfBottom.isUserInteractionEnabled = true
        self.addSubview(rootOfBottom)
        
        rootOfBottom.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func installCommodityTitle(){
        commodityTitle = UILabel()
        commodityTitle.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(commodityTitle)
        
        commodityTitle.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.width - 30)
            make.height.equalTo(30)
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(self.horCollectionView.snp.bottom).offset(10)
        }
    }
    
    private func installCommodityPrice(){
        commodityPrice = UILabel()
        commodityPrice.textColor = UIColor.orange
        self.addSubview(commodityPrice)
        
        commodityPrice.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(16)
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(self.commodityTitle.snp.bottom).offset(10)
        }
    }
    
    private func installCommodityProspectus(){
        commodityProspectus = UILabel()
        commodityProspectus.numberOfLines = 0
        commodityProspectus.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        self.addSubview(commodityProspectus)
        
        commodityProspectus.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.width - 30)
            make.left.equalToSuperview().offset(15)
            make.top.equalTo(self.commodityPrice.snp.bottom).offset(10)
        }
    }
    
    private func installPurchaseButton(){
        purchaseButton = UIButton(type: .custom)
        purchaseButton.setTitle("购买", for: UIControl.State.normal)
        purchaseButton.layer.masksToBounds = true
        purchaseButton.layer.cornerRadius = 10
        purchaseButton.backgroundColor = UIColor.red
        purchaseButton.setTitleColor(UIColor.gray, for: UIControl.State.highlighted)
        purchaseButton.isUserInteractionEnabled = true
        self.rootOfBottom.addSubview(purchaseButton)
        
        purchaseButton.snp.makeConstraints{ make in
            make.width.equalTo(90)
            make.height.equalTo(35)
            make.centerY.equalToSuperview()
            make.right.equalTo(self.rootOfBottom.snp.right).offset(-20)
        }
    }
    
    private func installAddShopCartButton(){
        addShopCartButton = UIButton(type: .custom)
        addShopCartButton.setTitle("加入购物车", for: UIControl.State.normal)
        addShopCartButton.layer.masksToBounds = true
        addShopCartButton.layer.cornerRadius = 10
        addShopCartButton.backgroundColor = UIColor.orange
        addShopCartButton.setTitleColor(UIColor.gray, for: UIControl.State.highlighted)
        addShopCartButton.isUserInteractionEnabled = true
        self.rootOfBottom.addSubview(addShopCartButton)
        
        addShopCartButton.snp.makeConstraints{ make in
            make.width.equalTo(110)
            make.height.equalTo(35)
            make.centerY.equalToSuperview()
            make.right.equalTo(self.purchaseButton.snp.left).offset(-20)
        }
    }
}
