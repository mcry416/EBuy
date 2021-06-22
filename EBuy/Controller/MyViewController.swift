//
//  MyViewController.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/5/31.
//

import UIKit
import NotificationBannerSwift
import Hero

class MyViewController: UIViewController , UITableViewDelegate{
    
    var myView: MyView!
    var configDataSource: ConfigDataSource!
    
    private func initView(){
        myView = MyView(frame: self.view.frame)
        self.view.addSubview(myView)
        
        configDataSource = ConfigDataSource()
        myView.configTableView.dataSource = configDataSource
        myView.configTableView.delegate = self
        /*
        let banner = GrowingNotificationBanner(title: "Test info.", subtitle: "This is a long test information for subtitle.", style: .success)
        banner.show()
 */
    
        
    }
    
    private func addLoginGesture(){
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(launchLoginVC))
        singleTap.numberOfTapsRequired = 1
        singleTap.numberOfTouchesRequired = 1
        self.myView.userImageView.addGestureRecognizer(singleTap)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        addLoginGesture()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Listener block.
    @objc func launchLoginVC(){
        let vc = LoginViewController()
        vc.isHeroEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.hero.modalAnimationType = .selectBy(presenting: HeroDefaultAnimationType.pull(direction: HeroDefaultAnimationType.Direction.left), dismissing: HeroDefaultAnimationType.uncover(direction: HeroDefaultAnimationType.Direction.right))
        self.present(vc, animated: true, completion: nil)
    }

}
