//
//  OrderView.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/8.
//

import UIKit
import SnapKit

class OrderView: UIView {
    
    let ORDER_CELL_ID = "ORDER_CELL"
    
    var orderCollectionView: UICollectionView!
    var rootOfTop: UIImageView!
    var textView: UITextView!
    var rootOfBottom: UIImageView!
    var payButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initConfig()
        installRootOfTop()
        installTextView()
        installRootOfBottom()
        installPayButton()
        installOrderCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration block.
    private func initConfig(){
        self.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.998, alpha: 1.0)
    }
    
    // MARK: - Install widget.
    private func installRootOfTop(){
        rootOfTop = UIImageView()
        rootOfTop.layer.masksToBounds = true
        rootOfTop.layer.cornerRadius = 10
        rootOfTop.isUserInteractionEnabled = true
        rootOfTop.backgroundColor = UIColor.white
        self.addSubview(rootOfTop)
        
        rootOfTop.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.width - 30)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
        }
    }
    
    private func installTextView(){
        textView = UITextView()
        self.rootOfTop.addSubview(textView)
        
        textView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(75)
            make.center.equalToSuperview()
        }
    }
    
    private func installRootOfBottom(){
        rootOfBottom = UIImageView()
        rootOfBottom.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.998, alpha: 1.0)
        rootOfBottom.isUserInteractionEnabled = true
        self.addSubview(rootOfBottom)
        
        rootOfBottom.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(50)
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func installPayButton(){
        payButton = UIButton(type: .custom)
        payButton.setTitle("付款", for: UIControl.State.normal)
        payButton.setTitleColor(UIColor.gray, for: UIControl.State.highlighted)
        payButton.backgroundColor = UIColor.red
        payButton.layer.masksToBounds = true
        payButton.layer.cornerRadius = 5
        self.rootOfBottom.addSubview(payButton)
        
        payButton.snp.makeConstraints{ make in
            make.width.equalTo(60)
            make.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.right.equalTo(self.snp.right).offset(-20)
        }
    }
    
    private func installOrderCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: (self.frame.width), height: (180))
        flowLayout.minimumLineSpacing = 20
        
        orderCollectionView = UICollectionView(frame: CGRect(x: 0, y: 150, width: self.frame.width, height: self.frame.width), collectionViewLayout: flowLayout)
        orderCollectionView.backgroundColor = UIColor.white
        orderCollectionView.register(OrderCell.self, forCellWithReuseIdentifier: ORDER_CELL_ID)
        orderCollectionView.alwaysBounceVertical = true
        orderCollectionView.isPagingEnabled = true
        orderCollectionView.layer.masksToBounds = true
        orderCollectionView.layer.cornerRadius = 10
        orderCollectionView.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.998, alpha: 1.0)
        self.addSubview(orderCollectionView)
        
        orderCollectionView.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.width - 30)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.rootOfTop.snp.bottom).offset(20)
            make.bottom.equalTo(self.rootOfBottom.snp.top)
        }
    }
    
}
