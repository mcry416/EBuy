//
//  VideoThumbnailCell.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/3.
//

import UIKit

class VideoThumbnailCell: UICollectionViewCell {
    
    var thumbImageView: UIImageView!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        
        installThumbImageView()
        installTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install widget.
    private func installThumbImageView(){
        thumbImageView = UIImageView()
        thumbImageView.tag = 1030
        self.addSubview(thumbImageView)
        
        thumbImageView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.center.equalToSuperview()
        }
    }
    
    private func installTitleLabel(){
        titleLabel = UILabel()
        titleLabel.tag = 1031
        titleLabel.textColor = UIColor.white
        self.thumbImageView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(28)
            make.left.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-15)
        }
    }
}
