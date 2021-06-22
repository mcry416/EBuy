//
//  HomeView.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/5/31.
//

import Foundation
import UIKit
import SnapKit
import FSPagerView

class HomeView: UIView{
    
    let FS_CELL_ID = "FS_CELL"
    let HOME_REUSABLE_CELL_ID = "HOME_REUSABLE_CELL"
    
    var scrollView: UIScrollView!
    var rootOfTop: UIImageView!
    var searchBar: UISearchBar!
    var messaageButton: UIButton!
    var fsPagerView: FSPagerView!
    var reusableCVOne: UICollectionView!
    var reusableCVTwo: UICollectionView!
    var reusableCVThree: UICollectionView!
    var recommendBest: UILabel!
    var communityFashion: UILabel!
    var worthPurchase: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        installScrollView()
        installRootOfTop()
        installSearchBar()
        installMessageButton()
        installFSPagerView()
        installRecommendBest()
        installReusableCVOne()
        installCommunityFashion()
        installReusableCVTwo()
        installWorthPurchase()
        installReusableCVThree()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install widget.
    private func installScrollView(){
        scrollView = UIScrollView()
        scrollView.frame = self.frame
        scrollView.contentSize = CGSize(width: self.frame.width, height: 1001)
        scrollView.alwaysBounceVertical = true
        scrollView.isScrollEnabled = true
        scrollView.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.998, alpha: 1.0)
        self.addSubview(scrollView)
    }
    
    private func installRootOfTop(){
        rootOfTop = UIImageView()
        rootOfTop.backgroundColor = UIColor.systemRed
        rootOfTop.isUserInteractionEnabled = true
        self.scrollView.addSubview(rootOfTop)
        
        rootOfTop.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(40)
            make.top.equalToSuperview()
        }
    }
    
    private func installSearchBar(){
        searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.layer.cornerRadius = 15
        searchBar.layer.masksToBounds = true
        self.rootOfTop.addSubview(searchBar)
        
        searchBar.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.width - 90)
            make.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.left.equalTo(self.rootOfTop.snp.left).offset(10)
        }
    }
    
    private func installMessageButton(){
        messaageButton = UIButton(type: .system)
        messaageButton.setBackgroundImage(UIImage(named: "message"), for: UIControl.State.normal)
        messaageButton.setBackgroundImage(UIImage(named: "message_select"), for: UIControl.State.selected)
        self.rootOfTop.addSubview(messaageButton)
        
        messaageButton.snp.makeConstraints{ make in
            make.width.equalTo(30)
            make.height.equalTo(26)
            make.centerY.equalToSuperview()
            make.right.equalTo(self.rootOfTop.snp.right).offset(-15)
        }
    }
    
    private func installFSPagerView(){
        fsPagerView = FSPagerView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 200))
        fsPagerView.automaticSlidingInterval = 3.0
        fsPagerView.isInfinite = true
        fsPagerView.transformer = FSPagerViewTransformer(type: .zoomOut)
        fsPagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: FS_CELL_ID)
        self.scrollView.addSubview(fsPagerView)
        
        fsPagerView.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.width - 20)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.rootOfTop.snp.bottom).offset(15)
            make.height.equalTo(200)
        }
    }
    
    private func installRecommendBest(){
        recommendBest = UILabel()
        recommendBest.text = "最佳推荐"
        recommendBest.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.heavy)
        self.scrollView.addSubview(recommendBest)
        
        recommendBest.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.top.equalTo(self.fsPagerView.snp.bottom).offset(30)
            make.left.equalTo(self.scrollView.snp.left).offset(10)
        }
    }
    
    private func installReusableCVOne(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: self.frame.width - 20, height: 150)
        
        reusableCVOne = UICollectionView(frame: CGRect(x: 0, y: 150, width: self.frame.width, height: self.frame.height), collectionViewLayout: flowLayout)
        reusableCVOne.backgroundColor = UIColor.white
        reusableCVOne.register(HomeReusableCell.self, forCellWithReuseIdentifier: HOME_REUSABLE_CELL_ID)
        reusableCVOne.layer.masksToBounds = true
        reusableCVOne.layer.cornerRadius = 10
        reusableCVOne.isPagingEnabled = true
        
        self.scrollView.addSubview(reusableCVOne)
        
        reusableCVOne.snp.makeConstraints{ make in
            make.width.equalTo(self.scrollView.frame.width - 20)
            make.centerX.equalToSuperview()
            make.height.equalTo(160)
            make.top.equalTo(self.recommendBest.snp.bottom).offset(15)
        }
    }
    
    private func installCommunityFashion(){
        communityFashion = UILabel()
        communityFashion.text = "社区潮流"
        communityFashion.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.heavy)
        self.scrollView.addSubview(communityFashion)
        
        communityFashion.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.top.equalTo(self.reusableCVOne.snp.bottom).offset(30)
            make.left.equalTo(self.scrollView.snp.left).offset(10)
        }
    }
    
    private func installReusableCVTwo(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: self.frame.width - 20, height: 150)
        
        reusableCVTwo = UICollectionView(frame: CGRect(x: 0, y: 150, width: self.frame.width, height: self.frame.height), collectionViewLayout: flowLayout)
        reusableCVTwo.backgroundColor = UIColor.white
        reusableCVTwo.register(HomeReusableCell.self, forCellWithReuseIdentifier: HOME_REUSABLE_CELL_ID)
        reusableCVTwo.layer.masksToBounds = true
        reusableCVTwo.layer.cornerRadius = 10
        reusableCVTwo.isPagingEnabled = true
        
        self.scrollView.addSubview(reusableCVTwo)
        
        reusableCVTwo.snp.makeConstraints{ make in
            make.width.equalTo(self.scrollView.frame.width - 20)
            make.centerX.equalToSuperview()
            make.height.equalTo(160)
            make.top.equalTo(self.communityFashion.snp.bottom).offset(15)
        }
    }
    
    private func installWorthPurchase(){
        worthPurchase = UILabel()
        worthPurchase.text = "值得购买"
        worthPurchase.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.heavy)
        self.scrollView.addSubview(worthPurchase)
        
        worthPurchase.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.top.equalTo(self.reusableCVTwo.snp.bottom).offset(30)
            make.left.equalTo(self.scrollView.snp.left).offset(10)
        }
    }
    
    private func installReusableCVThree(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: self.frame.width - 20, height: 150)
        
        reusableCVThree = UICollectionView(frame: CGRect(x: 0, y: 150, width: self.frame.width, height: self.frame.height), collectionViewLayout: flowLayout)
        reusableCVThree.backgroundColor = UIColor.white
        reusableCVThree.register(HomeReusableCell.self, forCellWithReuseIdentifier: HOME_REUSABLE_CELL_ID)
        reusableCVThree.layer.masksToBounds = true
        reusableCVThree.layer.cornerRadius = 10
        reusableCVThree.isPagingEnabled = true
        
        self.scrollView.addSubview(reusableCVThree)
        
        reusableCVThree.snp.makeConstraints{ make in
            make.width.equalTo(self.scrollView.frame.width - 20)
            make.centerX.equalToSuperview()
            make.height.equalTo(160)
            make.top.equalTo(self.worthPurchase.snp.bottom).offset(15)
        }
    }
    
}
