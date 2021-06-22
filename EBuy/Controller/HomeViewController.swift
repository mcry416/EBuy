//
//  HomeViewController.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/5/31.
//

import UIKit
import Hero
import SwiftyJSON

class HomeViewController: UIViewController, UISearchBarDelegate {
    
    private var homeView: HomeView!
    private var fsDataSource: FSDataSource!
    private var homeReusableDS: HomeReusableDataSource!
    private var homeReusableDSTwo: HomeReusableDataSource!
    private var homeReusableDSThree: HomeReusableDataSource!
    private var dataArray: Array<HomeReusableModel>!
    private var dataArrayTwo: Array<HomeReusableModel>!
    private var dataArrayThree: Array<HomeReusableModel>!
    private var bannerArray: Array<String>!

    private func initView(){
        homeView = HomeView(frame: self.view.frame)
        self.view.addSubview(homeView)
        homeView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
        //   make.height.equalTo(self.view.frame.height + 46)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.snp.bottom)
        }
        
        bannerArray = Array<String>()
        dataArray = Array<HomeReusableModel>()
        dataArrayTwo = Array<HomeReusableModel>()
        dataArrayThree = Array<HomeReusableModel>()
   
        homeView.messaageButton.addTarget(self, action: #selector(launchMessageVC), for: UIControl.Event.touchDown)
        homeView.searchBar.delegate = self
   //     homeView.fsPagerView.dataSource = fsDataSource
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()
        
        initData()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Listener block.
    @objc func launchMessageVC(){
        let vc = MessageViewController()
        vc.isHeroEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.hero.modalAnimationType = .selectBy(presenting: HeroDefaultAnimationType.pull(direction: HeroDefaultAnimationType.Direction.left), dismissing: HeroDefaultAnimationType.uncover(direction: HeroDefaultAnimationType.Direction.right))
        self.present(vc, animated: true, completion: nil)
    }
    
    // MARK: - Network block.
    func initData(){
        let url = "\(URLManager.getURL(type: "home"))/\(UserStatus.getUserId() ?? "0")"
        AlamofireUtil.requestData(.get, URLString: url) { result in
            print(result)
            
            let jsonData = JSON(result)
            
            for i in 0..<5{
                self.bannerArray.append(jsonData[0]["data"]["bannerList"][i]["bannerThumbLink"].string!)
            }
            
            for i in 0..<7{
                self.dataArray.append(HomeReusableModel(reusableImageName: jsonData[0]["data"]["cellList"][i]["cellThumbLink"].string!, reusableTitleText: jsonData[0]["data"]["cellList"][i]["cellTitle"].string!, reusableCommentText: "OMEGA机芯 月历 星历 持久陀螺。准确体现"))
            }
            
            for i in 7..<14{
                self.dataArrayTwo.append(HomeReusableModel(reusableImageName: jsonData[0]["data"]["cellList"][i]["cellThumbLink"].string!, reusableTitleText: jsonData[0]["data"]["cellList"][i]["cellTitle"].string!, reusableCommentText: "OMEGA机芯 月历 星历 持久陀螺。准确体现"))
            }
            
            for i in 14..<20{
                print("------> ERROR: \(i)")
                self.dataArrayThree.append(HomeReusableModel(reusableImageName: jsonData[0]["data"]["cellList"][i]["cellThumbLink"].string!, reusableTitleText: jsonData[0]["data"]["cellList"][i]["cellTitle"].string!, reusableCommentText: "OMEGA机芯 月历 星历 持久陀螺。准确体现"))
            }
            
            self.fsDataSource = FSDataSource(imagesArray: self.bannerArray)
            self.homeView.fsPagerView.dataSource = self.fsDataSource
            self.homeView.fsPagerView.reloadData()
            
            self.homeReusableDS = HomeReusableDataSource(dataArray: self.dataArray)
            self.homeView.reusableCVOne.dataSource = self.homeReusableDS
            
            self.homeReusableDSTwo = HomeReusableDataSource(dataArray: self.dataArrayTwo)
            self.homeView.reusableCVTwo.dataSource = self.homeReusableDS
            
            self.homeReusableDSThree = HomeReusableDataSource(dataArray: self.dataArrayThree)
            self.homeView.reusableCVThree.dataSource = self.homeReusableDS
        }
    }
    
    // MARK: - Delegate block.
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {

    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let vc = ListViewController()
        vc.isHeroEnabled = true
        vc.sentence = searchBar.text!
        vc.modalPresentationStyle = .fullScreen
        vc.hero.modalAnimationType = .selectBy(presenting: HeroDefaultAnimationType.pull(direction: HeroDefaultAnimationType.Direction.left), dismissing: HeroDefaultAnimationType.uncover(direction: HeroDefaultAnimationType.Direction.right))
        self.present(vc, animated: true, completion: nil)
    }

}
