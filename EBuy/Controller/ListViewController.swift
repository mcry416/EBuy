//
//  ListViewController.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/8.
//

import Hero
import UIKit
import SnapKit
import SwiftyJSON

class ListViewController: UIViewController, UICollectionViewDelegate {
    
    var listView: ListView!
    var listDataSource: ListDataSource!
    var dataArray: Array<ListModel>!
    var sentence: String = ""
    var index: Int = 0
    
    private func initView(){
        listView = ListView(frame: self.view.frame)
        self.view.addSubview(listView)
        
        dataArray = Array<ListModel>()
        
        listDataSource = ListDataSource(dataArray: dataArray)
        self.listView.listCollectionView.dataSource = listDataSource
        self.listView.listCollectionView.delegate = self
        self.listView.searchBar.text = sentence
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
        
        initData()
        
        addGesture()
    }
    
    // MARK: - Business block.
    func initData(){
        /*
        let url = "http://192.168.1.101:8080/ebuy/search/江/0"
        AlamofireUtil.requestData(.get, URLString: url) { result in
            print(result)
            
            let jsonData = JSON(result)
            
            for i in 0..<10 {
                var model: ListModel = ListModel()
                model.commodityImageName = jsonData[0]["data"][i]["commodityThumbnailLink"].string!
                model.commodityPriceText = jsonData[0]["data"][i]["commodityPrice"].string!
                model.commodityTitleText = jsonData[0]["data"][i]["commodityTitle"].string!
                model.featuresOneText = jsonData[0]["data"][i]["commodityFeaturesOne"].string!
                model.featuresTwoText = jsonData[0]["data"][i]["commodityFeaturesTwo"].string!
                model.featuresThreeText = jsonData[0]["data"][i]["commodityFeaturesThree"].string!
                self.dataArray.append(model)
            }
            
            self.listDataSource = ListDataSource(dataArray: self.dataArray)
            self.listView.listCollectionView.dataSource = self.listDataSource
        }
 */
        let para = ["sentence":self.sentence, "index":"0"]
        AlamofireUtil.requestData(.post, URLString: "http://192.168.0.102:8080/ebuy/search/", parameters: para) { result in
            print(result)
            
            let jsonData = JSON(result)
            print("------> LISTVIEW: FEATURES1:\(jsonData[0]["data"][0]["commodityId"].string!)")
            
            for i in 0..<2 {
                let model = ListModel(commodityId: jsonData[0]["data"][i]["commodityId"].string!,
                                      commodityImageName: jsonData[0]["data"][i]["commodityThumbnailLink"].string!, commodityTitleText: jsonData[0]["data"][i]["commodityName"].string!, featuresOneText: jsonData[0]["data"][i]["commodityFeaturesOne"].string!, featuresTwoText: jsonData[0]["data"][i]["commodityFeaturesTwo"].string!, featuresThreeText: jsonData[0]["data"][i]["commodityFeaturesThree"].string!, commodityPriceText: jsonData[0]["data"][i]["commodityPrice"].string!)

                self.dataArray.append(model)
            }
            
            self.listDataSource = ListDataSource(dataArray: self.dataArray)
            self.listView.listCollectionView.dataSource = self.listDataSource
        }
    }
    
    func refreshData(){
        
    }
    
    @objc func launchCommodityVC(index: String){
        let vc = CommodityViewController()
        vc.commodityId = dataArray[Int(index)!].commodityId
        vc.isHeroEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.hero.modalAnimationType = .selectBy(presenting: HeroDefaultAnimationType.pull(direction: HeroDefaultAnimationType.Direction.left), dismissing: HeroDefaultAnimationType.uncover(direction: HeroDefaultAnimationType.Direction.right))
        self.present(vc, animated: true, completion: nil)
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
        launchCommodityVC(index: String(indexPath.row))
    }
    

}
