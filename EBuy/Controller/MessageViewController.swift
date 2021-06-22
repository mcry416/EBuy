//
//  MessageViewController.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/2.
//

import UIKit
import Hero

class MessageViewController: UIViewController {
    
    var messageView: MessageView!
    var messageDataSource: MessageDataSource!
    var data: Array<MessageModel>!
    
    private func initView(){
        messageView = MessageView(frame: self.view.frame)
        self.view.addSubview(messageView)
        
        data = Array<MessageModel>()
        for _ in 0..<10{
            data.append(MessageModel(imageViewName: "wait", chatterText: "宜购客服", chatContentText: "您好！您反映的问题正在处理中。"))
        }
        
        messageDataSource = MessageDataSource(dataSource: data)
        messageView.tableView.dataSource = messageDataSource
        
        messageView.backButtton.addTarget(self, action: #selector(backListener), for: UIControl.Event.touchDown)
    }
    
    // Add gesture.
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
    
    // MARK: - Listener block.
    @objc func backListener(){
        self.dismiss(animated: true, completion: nil)
    }
    
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
