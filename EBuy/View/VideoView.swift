//
//  VideoView.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/3.
//

import UIKit
import SnapKit

class VideoView: UIView {

    var videoThumbnailView: UICollectionView!
    
    // MARK: - Constant of cell id.
    let VIDEO_CELL_ID = "VIDEO_ID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.998, alpha: 1.0)
        
        installVideoCV()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install widget.
    
    private func installVideoCV(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: ((self.frame.width / 2) - 20), height: (self.frame.height / 3))
        
        videoThumbnailView = UICollectionView(frame: CGRect(x: 0, y: 150, width: self.frame.width, height: self.frame.height), collectionViewLayout: flowLayout)
        videoThumbnailView.backgroundColor = UIColor.white
        videoThumbnailView.register(VideoThumbnailCell.self, forCellWithReuseIdentifier: VIDEO_CELL_ID)
        videoThumbnailView.alwaysBounceVertical = true
        self.addSubview(videoThumbnailView)
        
        videoThumbnailView.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.width - 25)
            make.height.equalTo(self.frame.height)
            make.centerX.equalToSuperview()
        }
    }
}
