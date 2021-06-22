//
//  VideoDetailViewController.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/2.
//

import UIKit
import AVKit
import Hero
import AVFoundation

class VideoDetailViewController: UIViewController {
    
    var videoDetailView: VideoDetailView!
    var videoModel: VideoThumbnailModel!
    
    private func initView(){
        videoDetailView = VideoDetailView(frame: self.view.frame)
        self.view.addSubview(videoDetailView)
        
        /*
        let filePath = Bundle.main.path(forResource: "video1", ofType: "mp4")
        let videoURL = URL(fileURLWithPath: filePath!)
 */
        videoDetailView.player.play()
    }
    
    //  Add gesture.
    private func addGesture(){
        let scrennEdgePanGR = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlerInPan))
        scrennEdgePanGR.edges = .left
        self.view.addGestureRecognizer(scrennEdgePanGR)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        
        addGesture()

    }
    
    // MARK: - Function block.
    @objc func handlerInPan(gesture: UIPanGestureRecognizer){
        switch gesture.state {
        case .began:
            self.dismiss(animated: true, completion: nil)
        case .changed:
            let progress = gesture.translation(in: nil).x / self.view.bounds.width
            Hero.shared.update(progress)
        default:
            if(gesture.translation(in: nil).x + gesture.velocity(in: nil).x) / self.view.bounds.width > 0.5{
                Hero.shared.finish()
            } else {
                Hero.shared.cancel()
            }
        }
    }
    

}
