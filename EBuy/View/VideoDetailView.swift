//
//  VideoDetailView.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/2.
//

import UIKit
import SnapKit
import AVKit

class VideoDetailView: UIView {
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var commodityTitle: UILabel!
    var likeButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        installPlayer()
        installAVPlayerLayer()
        installCommodityTitle()
        installLikeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install widget.
    private func installPlayer(){
        let filePath = Bundle.main.path(forResource: "video1", ofType: "mp4")
        let videoURL = URL(fileURLWithPath: filePath!)
        player = AVPlayer(url: videoURL)
    }
    
    private func installAVPlayerLayer(){
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.frame
        self.layer.addSublayer(playerLayer)
    }
    
    private func installCommodityTitle(){
        commodityTitle = UILabel()
        commodityTitle.text = "这是一款超级好用的化妆品..."
        commodityTitle.textColor = UIColor.white
        commodityTitle.font = UIFont.systemFont(ofSize: 23, weight: UIFont.Weight.medium)
        self.addSubview(commodityTitle)
        
        commodityTitle.snp.makeConstraints{ make in
            make.width.equalTo(190)
            make.height.equalTo(40)
            make.left.equalTo(self.snp.left).offset(30)
            make.bottom.equalTo(self.snp.bottom).offset(-100)
        }
    }
    
    private func installLikeButton(){
        likeButton = UIButton(type: .custom)
        likeButton.setBackgroundImage(UIImage(named: "like"), for: UIControl.State.normal)
        likeButton.setBackgroundImage(UIImage(named: "like_select"), for: UIControl.State.highlighted)
        self.addSubview(likeButton)
        
        likeButton.snp.makeConstraints{ make in
            make.size.equalTo(65)
            make.right.equalTo(self.snp.right).offset(-10)
            make.centerY.equalToSuperview()
        }
    }
}
