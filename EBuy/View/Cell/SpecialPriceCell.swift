//
//  SpecialPriceCell.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/1.
//

import UIKit

class SpecialPriceCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var currentPriceLabel: UILabel!
    var originalPriceLabel: UILabel!
    var saleProgress: UIProgressView!
    var saleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.white
        
        installImageView()
        installCurrentPriceLabel()
        installOriginalPriceLabel()
        installSaleProgress()
        installSaleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install widget.
    private func installImageView(){
        imageView = UIImageView()
        imageView.tag = 1010
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.top).offset(3)
        }
    }
    
    private func installCurrentPriceLabel(){
        currentPriceLabel = UILabel()
        currentPriceLabel.tag = 1011
        currentPriceLabel.textColor = UIColor.red
        currentPriceLabel.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium)
        self.addSubview(currentPriceLabel)
        
        currentPriceLabel.snp.makeConstraints{ make in
            make.width.equalTo(80)
            make.height.equalTo(26)
            make.left.equalTo(self.imageView.snp.left)
            make.top.equalTo(self.imageView.snp.bottom).offset(3)
        }
    }
    
    private func installOriginalPriceLabel(){
        originalPriceLabel = UILabel()
        originalPriceLabel.tag = 1012
        originalPriceLabel.textColor = UIColor.gray
        originalPriceLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
        self.addSubview(originalPriceLabel)
        
        originalPriceLabel.snp.makeConstraints{ make in
            make.width.equalTo(60)
            make.height.equalTo(23)
            make.left.equalTo(self.imageView.snp.left)
            make.top.equalTo(self.currentPriceLabel.snp.bottom).offset(3)
        }
    }
    
    private func installSaleProgress(){
        saleProgress = UIProgressView()
        saleProgress.tag = 1013
        saleProgress.layer.masksToBounds = true
        saleProgress.progressTintColor = UIColor.red
        saleProgress.trackTintColor = UIColor.gray
        saleProgress.layer.cornerRadius = 5
        self.addSubview(saleProgress)
        
        saleProgress.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(7)
            make.left.equalTo(self.imageView.snp.left)
            make.top.equalTo(self.originalPriceLabel.snp.bottom).offset(3)
        }
    }
    
    private func installSaleLabel(){
        saleLabel = UILabel()
        saleLabel.tag = 1014
        saleLabel.font = UIFont.systemFont(ofSize: 12)
        saleLabel.textColor = UIColor.gray
        self.addSubview(saleLabel)
        
        saleLabel.snp.makeConstraints{ make in
            make.width.equalTo(80)
            make.height.equalTo(23)
            make.left.equalTo(self.imageView.snp.left)
            make.top.equalTo(self.saleProgress.snp.bottom).offset(3)
        }
    }
}
