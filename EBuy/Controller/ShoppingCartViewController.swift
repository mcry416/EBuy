//
//  ShoppingCartViewController.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/5/31.
//

import UIKit
import Hero

class ShoppingCartViewController: UIViewController, UITableViewDelegate {
    
    let SHOP_CART_CELL_ID = "SHOP_CART_ID"
    
    var shopCartView: ShopCartView!
    var dataArray: Array<ShopCartModel>!
    var dataSource: ShopCartDataSource!
    
    private func initView(){
        shopCartView = ShopCartView(frame: self.view.frame)
        self.view.addSubview(shopCartView)
        
        dataArray = Array<ShopCartModel>()
        for _ in 0..<10{
            dataArray.append(ShopCartModel(selectButtonName: "select_no", commodityImageName: "opencv_android", commodityTitleText: "OpenCV Android开发实战", commodityPriceText: "¥ 29.9", purchaseAmount: "数量：1", operationStepperValue: 1))
        }
        
        dataSource = ShopCartDataSource(dataSource: dataArray)
        shopCartView.shopCartTableView.dataSource = dataSource
        shopCartView.shopCartTableView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initView()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Business block.
    @objc func stepperValueChanged(_ stepper: UIStepper, _ label: UILabel){
        label.text = "数量:\(stepper.value)"
    }
    
    func changeSelectImage(_ button: UIButton){
        button.setImage(UIImage(named: "select_yes"), for: UIControl.State.normal)
    }
    
    // MARK: - Delegate block.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        145
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("------> CLICK.")
        let cell = tableView.cellForRow(at: indexPath)
        /*
        let selectButton = cell.viewWithTag(1040) as? UIButton
        selectButton?.addTarget(self, action: #selector(changeSelectImage(selectButton!)), for: UIControl.Event.touchDown)
        */
        
        let operationStepper = cell!.viewWithTag(1044) as? UIStepper
        
        let purchaseAmount = cell!.viewWithTag(1045) as? UILabel
//        operationStepper?.addTarget(self, action: #selector(stepperValueChanged(operationStepper!, purchaseAmount!)), for: UIControl.Event.touchDown)
        
        let vc = OrderViewController()
        vc.isHeroEnabled = true
        vc.modalPresentationStyle = .fullScreen
        vc.hero.modalAnimationType = .selectBy(presenting: HeroDefaultAnimationType.pull(direction: HeroDefaultAnimationType.Direction.left), dismissing: HeroDefaultAnimationType.uncover(direction: HeroDefaultAnimationType.Direction.right))
        self.present(vc, animated: true, completion: nil)
    }
    
}
