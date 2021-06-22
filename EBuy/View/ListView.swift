//
//  ListView.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/8.
//

import UIKit
import SnapKit

class ListView: UIView {
    
    var LIST_CELL_ID = "LIST_CELL"

    var rootOfTop: UIImageView!
    var searchBar: UISearchBar!
    var backButton: UIButton!
    var listCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
  
        installRootOfTop()
        installSearchBar()
        installListCollecrtionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install widget.
    private func installRootOfTop(){
        rootOfTop = UIImageView()
        rootOfTop.backgroundColor = UIColor.systemRed
        rootOfTop.isUserInteractionEnabled = true
        self.addSubview(rootOfTop)
        
        rootOfTop.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(40)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func installSearchBar(){
        searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.layer.cornerRadius = 15
        searchBar.layer.masksToBounds = true
        self.rootOfTop.addSubview(searchBar)
        
        searchBar.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(30)
            make.centerY.equalToSuperview()
        }
    }
    
    private func installListCollecrtionView(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: (self.frame.width), height: (140))
        
        listCollectionView = UICollectionView(frame: CGRect(x: 0, y: 150, width: self.frame.width, height: self.frame.width), collectionViewLayout: flowLayout)
        listCollectionView.backgroundColor = UIColor.white
        listCollectionView.register(ListCell.self, forCellWithReuseIdentifier: LIST_CELL_ID)
        listCollectionView.alwaysBounceVertical = true
        listCollectionView.isPagingEnabled = true
        self.addSubview(listCollectionView)
        
        listCollectionView.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.width)
            make.height.equalTo(self.frame.height - 40)
            make.top.equalTo(self.rootOfTop.snp.bottom)
        }
    }

}
