//
//  ReusableViewController.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/5/31.
//

import UIKit
import SnapKit
import Hero

class ReusableViewController: UIViewController, UIScrollViewDelegate, UICollectionViewDelegate{
    
    var reusableView: ReusableView!
    var reusableTypeDS: ReusableTypeDataSource!
    var specialPriceDS: SpecialPriceDataSource!
    var reusableItemDS: ReusableItemDataSource!
    
    var dataType: Array<ReusableTypeModel>!
    var dataItem: Array<ReusableItemModel>!
    var dataPrice: Array<SpecialPriceModel>!
    
    private func initView(){
        reusableView = ReusableView(frame: self.view.frame)
        self.view.addSubview(reusableView)
        
        reusableView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalToSuperview().offset(46)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
        
        dataType = Array<ReusableTypeModel>()
        dataItem = Array<ReusableItemModel>()
        dataPrice = Array<SpecialPriceModel>()
        
        for _ in 0..<10 {
            dataType.append(ReusableTypeModel(imageName: "honor", titleName: "Honor"))
            dataPrice.append(SpecialPriceModel(imaViewName: "iphone", currentPriceText: "$ 588", originalPriceText: "$ 649", saleProgress: 2, saleText: "66"))
            dataItem.append(ReusableItemModel(imageViewName: "vivo", commodityText: "IQOO全新高端旗舰机", priceText: "$ 388"))
        }
        
        reusableView.scrollView.delegate = self
        
        reusableTypeDS = ReusableTypeDataSource(dataSource: dataType)
        specialPriceDS = SpecialPriceDataSource(dataSource: dataPrice)
        reusableItemDS = ReusableItemDataSource(dataSource: dataItem)
        reusableView.reusableTypeCollectionView.dataSource = reusableTypeDS
        reusableView.specialPriceCollectionView.dataSource = specialPriceDS
        reusableView.specialPriceCollectionView.delegate = self
        reusableView.reusableItemCollectionView.dataSource = reusableItemDS

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - UIScrollView delegate block.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("------> OFFSET Y:\(scrollView.contentOffset.y)")
        /*
        if(scrollView.contentOffset.y > 731){
            scrollView.isScrollEnabled = false
            reusableView.reusableItemCollectionView.isScrollEnabled = true
            reusableView.selectedLabel.snp.remakeConstraints{ make in
                make.width.equalTo(130)
                make.height.equalTo(35)
                make.top.equalTo(reusableView.specialPriceCollectionView.snp.bottom).offset(-scrollView.contentOffset.y)
                make.left.equalTo(reusableView.snp.left).offset(15)
            }
            reusableView.reusableItemCollectionView.contentOffset.y
        } else {
            scrollView.isScrollEnabled = true
            reusableView.reusableItemCollectionView.isScrollEnabled = false
        }
 */
        // FIXME: - TEMP UPDATE.
   //     reusableView.reusableItemCollectionView.isScrollEnabled = false
        if(scrollView.contentOffset.y > 731){
            scrollView.isScrollEnabled = false
            reusableView.reusableItemCollectionView.isScrollEnabled = true
        } else {
            scrollView.isScrollEnabled = true
            reusableView.reusableItemCollectionView.isScrollEnabled = false
        }
        
        
    }
 
    // MARK: - UICollectionView delegate block.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CommodityViewController()
        vc.isHeroEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.hero.modalAnimationType = .selectBy(presenting: HeroDefaultAnimationType.pull(direction: HeroDefaultAnimationType.Direction.left), dismissing: HeroDefaultAnimationType.uncover(direction: HeroDefaultAnimationType.Direction.right))
        self.present(vc, animated: true, completion: nil)
    }

}
