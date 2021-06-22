//
//  HomeReusableCell.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/10.
//

import UIKit
import SnapKit

class HomeReusableCell: UICollectionViewCell {
    
    var reusableImageView: UIImageView!
    var reusableTitle: UILabel!
    var reusableComment: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
        
        installReusableImageView()
        installReusableTitle()
        installReusableComment()
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
    private func installReusableImageView(){
        reusableImageView = UIImageView()
        reusableImageView.tag = 1080
        self.contentView.addSubview(reusableImageView)
        
        reusableImageView.snp.makeConstraints{ make in
            make.size.equalTo(100)
            make.centerY.equalToSuperview()
            make.left.equalTo(self.contentView.snp.left).offset(20)
        }
    }
    
    private func installReusableTitle(){
        reusableTitle = UILabel()
        reusableTitle.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular)
        reusableTitle.numberOfLines = 2
        reusableTitle.tag = 1081
        self.contentView.addSubview(reusableTitle)
        
        reusableTitle.snp.makeConstraints{ make in
            // 130 means reusableImageView's width plus its offset and plus itself's offset.
            make.width.equalTo(self.contentView.frame.width - 130)
            make.top.equalTo(self.reusableImageView.snp.top)
            make.left.equalTo(self.reusableImageView.snp.right).offset(10)
        }
    }
    
    private func installReusableComment(){
        reusableComment = UILabel()
        reusableComment.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.thin)
        reusableComment.tag = 1082
        self.contentView.addSubview(reusableComment)
        
        reusableComment.snp.makeConstraints{ make in
            make.width.equalTo(self.contentView.frame.width - 130)
            make.bottom.equalTo(self.reusableImageView.snp.bottom)
            make.left.equalTo(self.reusableImageView.snp.right).offset(10)
        }
    }
}
