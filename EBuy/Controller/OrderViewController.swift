//
//  OrderViewController.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/8.
//

import Hero
import UIKit
import SwiftyJSON
import NotificationBannerSwift

class OrderViewController: UIViewController, UICollectionViewDelegate {
    
    var orderView: OrderView!
    var dataSource: OrderDataSource!
    var dataArray: Array<OrderModel>!
    var commodityId: String = "1"
    
    private func initView(){
        orderView = OrderView(frame: self.view.frame)
        self.view.addSubview(orderView)
        
        dataArray = Array<OrderModel>()
        for _ in 0..<2{
            dataArray.append(OrderModel(orderImageName: "jsdd", orderTitleText: "江斯丹顿 纵横四海 男士腕表", orderPriceText: "¥68900", orderAmountText: "数量:1"))
        }
        
        dataSource = OrderDataSource(dataArray: dataArray)
        self.orderView.orderCollectionView.dataSource = dataSource
        self.orderView.textView.text = "南京市江宁区东善桥社区德信星辰6栋 505室 张先生"
        self.orderView.payButton.addTarget(self, action: #selector(orderListener), for: UIControl.Event.touchDown)
        
    }
    
    // Add gesture.
    private func addGesture(){
        let scrennEdgePanGR = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handlerInPan))
        scrennEdgePanGR.edges = .left
        self.view.addGestureRecognizer(scrennEdgePanGR)
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

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
        
        addGesture()
    }
    
    // MARK: - Business block.
    @objc func orderListener(){
        print("------> EXECUTE PAY.")
        let url = "\(URLManager.getURL(type: "order_id"))\(UserStatus.getUserId())/\(commodityId)/1"
        AlamofireUtil.requestData(.get, URLString: url){ result in
            print(result)
            
            let jsonData = JSON(result)
            if(jsonData[0]["data"]["status"].string! == "1"){
                let banner = GrowingNotificationBanner(title: "恭喜", subtitle: "您的·订单操作成功", style: .success)
                banner.show()
            } else {
                let banner = GrowingNotificationBanner(title: "警告", subtitle: "您的订单没有操作成功，请联系客服人员", style: .warning)
                banner.show()
            }
        }
    }
    
    
    // MARK: - Delegate block.

}
