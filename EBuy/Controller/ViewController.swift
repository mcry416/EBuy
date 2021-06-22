//
//  ViewController.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/5/31.
//

import UIKit
import Pageboy
import Tabman

class ViewController: TabmanViewController, PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "首页")
        case 1:
            return TMBarItem(title: "手机")
        case 2:
            return TMBarItem(title: "零食")
        case 3:
            return TMBarItem(title: "腕表珠宝")
        case 4:
            return TMBarItem(title: "办公耗材")
        case 5:
            return TMBarItem(title: "奢侈品")
        case 6:
            return TMBarItem(title: "家电")
        case 7:
            return TMBarItem(title: "酒类")
        case 8:
            return TMBarItem(title: "蛋糕")
        default:
            return TMBarItem(title: "饮品")
        }
    }
    
    // MARK: - Data source.
    private var viewControllers = [HomeViewController(),
                                   ReusableViewController(),
                                   ReusableViewController(),
                                   ReusableViewController(),
                                   ReusableViewController(),
                                   ReusableViewController(),
                                   ReusableViewController(),
                                   ReusableViewController(),
                                   ReusableViewController()]
    
    // MARK: - Init the view.
    private func initView(){
        self.view.backgroundColor = UIColor.white

        self.dataSource = self

        // Create bar and set style.
        let bar = TMBar.ButtonBar()
        bar.layout.transitionStyle = .progressive
        bar.buttons.customize { (button) in
            button.tintColor = .black
            button.selectedTintColor = .systemBlue
        }
        bar.indicator.overscrollBehavior = .compress
        bar.indicator.weight = .light
 
        addBar(bar, dataSource: self, at: .top)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()

    }
    
}
