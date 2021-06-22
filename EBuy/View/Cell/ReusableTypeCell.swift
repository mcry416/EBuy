//
//  ReusableTypeCell.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/1.
//

import UIKit
import SnapKit

class ReusableTypeCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    var title: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        installImageView()
        installTitle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install Widget.
    private func installImageView(){
        imageView = UIImageView()
        imageView.tag = 1001
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints{ make in
            make.width.equalTo(80)
            make.height.equalTo(35)
            make.center.equalToSuperview()
        }
    }
    
    private func installTitle(){
        title = UILabel()
        title.tag = 1002
        self.addSubview(title)
        
        title.snp.makeConstraints{ make in
            make.width.equalTo(50)
            make.height.equalTo(27)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.imageView.snp.bottom).offset(3)
        }
    }
    
}
