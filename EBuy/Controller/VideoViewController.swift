//
//  VideoViewController.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/5/31.
//

import UIKit
import Hero
import SwiftyJSON
//import MJRefresh

class VideoViewController: UIViewController, UICollectionViewDelegate {
    
    var dataArray: Array<VideoThumbnailModel>!
    var dataSource: VideoThumbnailDataSource!
    var videoView: VideoView!
    var refreshControl: UIRefreshControl!
    var index: Int = 0
    
    private func initView(){
        videoView = VideoView(frame: self.view.frame)
        self.view.addSubview(videoView)

        dataArray = Array<VideoThumbnailModel>()
        
        dataSource = VideoThumbnailDataSource(dataSource: dataArray)
        videoView.videoThumbnailView.dataSource = dataSource
        videoView.videoThumbnailView.delegate = self
        
        // Refresh data for UICollectionView.
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData),
                                 for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新数据")
        videoView.videoThumbnailView.addSubview(refreshControl)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        initData()

    }
    
    // MARK: - Business block.
    @objc func launch(){
        let vc = VideoDetailViewController()
        vc.isHeroEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.hero.modalAnimationType = .selectBy(presenting: HeroDefaultAnimationType.pull(direction: HeroDefaultAnimationType.Direction.left), dismissing: HeroDefaultAnimationType.uncover(direction: HeroDefaultAnimationType.Direction.right))
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func refreshData(){
        dataArray.removeAll()
        
        index = index + 1
        var tempIndex = String(index)
        print("------> INDEX:\(tempIndex)")
        
        AlamofireUtil.requestData(.get, URLString: "\(URLManager.getURL(type: "video"))\(tempIndex)") { result in
            print(result)
            
            let jsonData = JSON(result)
            
            for i in 0..<10{
                self.dataArray.append(VideoThumbnailModel(link: jsonData[0]["data"][i]["videoId"].string!, imageViewLink: jsonData[0]["data"][i]["videoThumbnailLink"].string!, titleText: jsonData[0]["data"][i]["videoTitle"].string!))
            }
            
            self.dataSource = VideoThumbnailDataSource(dataSource: self.dataArray)
            self.videoView.videoThumbnailView.dataSource = self.dataSource
            self.videoView.videoThumbnailView.reloadData()
        }
        
        self.refreshControl.endRefreshing()
    }
    
    func initData(){
        AlamofireUtil.requestData(.get, URLString: "\(URLManager.getURL(type: "video"))0") { result in
            print(result)
            let jsonData = JSON(result)
            
            self.dataArray.removeAll()
            for i in 0..<10{
                self.dataArray.append(VideoThumbnailModel(link: jsonData[0]["data"][i]["videoId"].string!, imageViewLink: jsonData[0]["data"][i]["videoThumbnailLink"].string!, titleText: jsonData[0]["data"][i]["videoTitle"].string!))
            }
 
            self.videoView.videoThumbnailView.reloadData()
            self.dataSource = VideoThumbnailDataSource(dataSource: self.dataArray)
            self.videoView.videoThumbnailView.dataSource = self.dataSource
            
        }
        
    }
    
    // MARK: - Delegate block.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        launch()
    }

}
