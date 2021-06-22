//
//  ReusableView.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/1.
//

import Foundation
import UIKit
import SnapKit

class ReusableView: UIView{
    
    var scrollView: UIScrollView!
    var panicBuyLabel: UILabel!
    var selectedLabel: UILabel!
    var reusableTypeCollectionView: UICollectionView!
    var specialPriceCollectionView: UICollectionView!
    var reusableItemCollectionView: UICollectionView!
    
    // MARK: - Constants of cell id.
    let REUSABLE_TYPE_ID = "REUSABLE_TYPE"
    let SPECIAL_PRICE_ID = "SPECIAL_PRICE"
    let REUSABLE_ITEM_ID = "REUSABLE_ITEM"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configView()
        
        installScrollView()
        installReusableTypeCV()
        installPaincBuyLabel()
        installSpecialPriceCV()
        installSlectedLabel()
        installReusableItemCV()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuartion.
    private func configView(){
        self.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.998, alpha: 1.0)
    }
    
    // MARK: - Install widget.
    private func installScrollView(){
        scrollView = UIScrollView()
        scrollView.frame = self.frame
        scrollView.contentSize = CGSize(width: self.frame.width, height: (self.frame.height * 2))
        scrollView.alwaysBounceVertical = true
        scrollView.isScrollEnabled = true
        scrollView.delaysContentTouches = true
        self.addSubview(scrollView)
        
        /*
        scrollView.snp.makeConstraints{ make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            make.width.equalToSuperview()
            make.height.equalTo(self.frame.height * 2)
        }
 */
    }
    
    private func installReusableTypeCV(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 90, height: 65)
        
        reusableTypeCollectionView = UICollectionView(frame: CGRect(x: 0, y: 150, width: self.frame.width, height: self.frame.height), collectionViewLayout: flowLayout)
        reusableTypeCollectionView.backgroundColor = UIColor.white
        reusableTypeCollectionView.register(ReusableTypeCell.self, forCellWithReuseIdentifier: REUSABLE_TYPE_ID)
        reusableTypeCollectionView.isScrollEnabled = false
        reusableTypeCollectionView.layer.masksToBounds = true
        reusableTypeCollectionView.layer.cornerRadius = 15
        self.scrollView.addSubview(reusableTypeCollectionView)
        
        reusableTypeCollectionView.snp.makeConstraints{ make in
            make.width.equalTo(self.scrollView.frame.width - 20)
            make.height.equalTo(165)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.scrollView.snp.top)
        }

    }
    
    private func installPaincBuyLabel(){
        panicBuyLabel = UILabel()
        panicBuyLabel.text = "限时抢购"
        panicBuyLabel.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.medium)
        self.scrollView.addSubview(panicBuyLabel)
        
        panicBuyLabel.snp.makeConstraints{ make in
            make.width.equalTo(130)
            make.height.equalTo(35)
            make.top.equalTo(self.reusableTypeCollectionView.snp.bottom).offset(30)
            make.left.equalTo(self.snp.left).offset(15)
        }
    }
    
    private func installSpecialPriceCV(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 150, height: 200)
        
        specialPriceCollectionView = UICollectionView(frame: CGRect(x: 0, y: 150, width: self.frame.width, height: self.frame.height), collectionViewLayout: flowLayout)
        specialPriceCollectionView.backgroundColor = UIColor.white
        specialPriceCollectionView.register(SpecialPriceCell.self, forCellWithReuseIdentifier: SPECIAL_PRICE_ID)
        specialPriceCollectionView.layer.masksToBounds = true
        specialPriceCollectionView.layer.cornerRadius = 15
        self.scrollView.addSubview(specialPriceCollectionView)
        
        specialPriceCollectionView.snp.makeConstraints{ make in
            make.width.equalTo(self.scrollView.frame.width - 20)
            make.centerX.equalToSuperview()
            make.height.equalTo(230)
            make.top.equalTo(self.panicBuyLabel.snp.bottom).offset(3)
        }
    }
    
    private func installSlectedLabel(){
        selectedLabel = UILabel()
        selectedLabel.text = "为您精选"
        selectedLabel.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.medium)
        self.scrollView.addSubview(selectedLabel)
        
        selectedLabel.snp.makeConstraints{ make in
            make.width.equalTo(130)
            make.height.equalTo(35)
            make.top.equalTo(self.specialPriceCollectionView.snp.bottom).offset(30)
            make.left.equalTo(self.snp.left).offset(15)
        }
    }
    
    private func installReusableItemCV(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: (self.frame.width / 2) - 20, height: 230)
        
        reusableItemCollectionView = UICollectionView(frame: CGRect(x: 0, y: 150, width: self.frame.width, height: self.frame.height), collectionViewLayout: flowLayout)
        reusableItemCollectionView.backgroundColor = UIColor.white
        reusableItemCollectionView.register(ReusableItemCell.self, forCellWithReuseIdentifier: REUSABLE_ITEM_ID)
        reusableItemCollectionView.alwaysBounceVertical = true
        reusableItemCollectionView.layer.masksToBounds = true
        reusableItemCollectionView.layer.cornerRadius = 15
        
        self.scrollView.addSubview(reusableItemCollectionView)
        
        reusableItemCollectionView.snp.makeConstraints{ make in
            make.width.equalTo(self.scrollView.frame.width - 20)
            make.centerX.equalToSuperview()
            make.height.equalTo(self.frame.height - 44)
            make.top.equalTo(self.selectedLabel.snp.bottom).offset(3)
            make.bottom.equalTo(self.scrollView.snp.bottom).offset(-44)
        }
    }

}
