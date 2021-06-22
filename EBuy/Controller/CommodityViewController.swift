//
//  CommodityViewController.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/6.
//

import Hero
import UIKit
import SwiftyJSON
import NotificationBannerSwift

class CommodityViewController: UIViewController, UICollectionViewDelegate{

    var commodityView: CommodityView!
    var dataArray: Array<HorModel>!
    var dataSource: HorDataSource!
    var commodityId: String = "1"
    var userId: String = "1"
    
    private func initView(){
        commodityView = CommodityView(frame: self.view.frame)
        self.view.addSubview(commodityView)
        
        dataArray = Array<HorModel>()
 
        commodityView.horCollectionView.delegate = self
        
        commodityView.purchaseButton.addTarget(self, action: #selector(payListener), for: UIControl.Event.touchDown)
        commodityView.addShopCartButton.addTarget(self, action: #selector(addShopcartListener), for: UIControl.Event.touchDown)
        /*
        commodityView.commodityTitle.text = "OMEGA 碟飞系列机械男表 424.10.37.20.02.001"
        commodityView.commodityPrice.text = "¥ 17990.0"
        commodityView.commodityProspectus.text = "OMEGA 碟飞系列男表诞生于20世纪40年代末，其纤薄而典雅的金制表壳别具一格，内部搭载的30毫米机芯极富传奇色彩。半个多世纪后重生、甄品再现，搭载欧米加机芯的碟飞系列名典腕表优雅问世。"
 */
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
        
        initData()
    }
    
    // MARK: - Business block.
    func initData(){
        let url = "\(URLManager.getURL(type: "search_detail"))\(commodityId)/\(userId)"
        AlamofireUtil.requestData(.get, URLString: url){ result in
            print(result)
            
            let jsonData = JSON(result)
            self.dataArray.append(HorModel(commodityImageName: jsonData[0]["data"][0]["commodityDetailLinkOne"].string!))
            self.dataArray.append(HorModel(commodityImageName: jsonData[0]["data"][0]["commodityDetailLinkTwo"].string!))
            self.dataArray.append(HorModel(commodityImageName: jsonData[0]["data"][0]["commodityDetailLinkThree"].string!))
            self.dataArray.append(HorModel(commodityImageName: jsonData[0]["data"][0]["commodityDetailLinkFour"].string!))
            self.dataArray.append(HorModel(commodityImageName: jsonData[0]["data"][0]["commodityDetailLinkFive"].string!))
            
            self.dataSource = HorDataSource(dataArray: self.dataArray)
            self.commodityView.horCollectionView.dataSource = self.dataSource
            
            self.commodityView.commodityTitle.text = jsonData[0]["data"][0]["commodityName"].string!
            self.commodityView.commodityPrice.text = jsonData[0]["data"][0]["commodityPrice"].string!
            self.commodityView.commodityProspectus.text = jsonData[0]["data"][0]["commodityProspectus"].string!

        }
    }
    
    @objc func launchOrderVC(){
        let vc = OrderViewController()
        vc.isHeroEnabled = true
        vc.commodityId = self.commodityId
        vc.modalPresentationStyle = .fullScreen
        vc.hero.modalAnimationType = .selectBy(presenting: HeroDefaultAnimationType.pull(direction: HeroDefaultAnimationType.Direction.left), dismissing: HeroDefaultAnimationType.uncover(direction: HeroDefaultAnimationType.Direction.right))
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func payListener(){
        if (UserStatus.isUserExist()) {
            launchOrderVC()
        } else {
            let banner = GrowingNotificationBanner(title: "警告", subtitle: "请检查您先登陆以继续操作", style: .warning)
            banner.show()
        }
    }
    
    @objc func addShopcartListener(){
        if (UserStatus.isUserExist()) {
            
        } else {
            let banner = GrowingNotificationBanner(title: "警告", subtitle: "请检查您先登陆以继续操作", style: .warning)
            banner.show()
        }
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
    
    // MARK: - Delegate block.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }

}
