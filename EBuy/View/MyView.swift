//
//  MyView.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/4.
//

import UIKit
import SnapKit

class MyView: UIView {
    
    let CONFIG_CELL_ID = "CONFIG_ID"
    
    var rootOfTop: UIImageView!
    var userImageView: UIImageView!
    var userName: UILabel!
    var messageButton: UIButton!
    var obligationButton: UIButton!
    var orderListButton: UIButton!
    var configTableView: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initConfig()
        
        installRootOfTop()
        installUserImageView()
        installUserName()
        installMessageButton()
        installObligation()
        installOrderList()
        installConfigTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install widget.
    private func initConfig(){
        self.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.998, alpha: 1.0)
    }
    
    private func installRootOfTop(){
        rootOfTop = UIImageView()
        rootOfTop.layer.cornerRadius = 10
        rootOfTop.backgroundColor = UIColor.white
        rootOfTop.isUserInteractionEnabled = true
        self.addSubview(rootOfTop)
        
        rootOfTop.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.width - 30)
            make.height.equalTo(93)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
        }
    }
    
    private func installUserImageView(){
        userImageView = UIImageView()
        userImageView.isUserInteractionEnabled = true
        userImageView.image = UIImage(named: "user")
        self.rootOfTop.addSubview(userImageView)
        
        userImageView.snp.makeConstraints{ make in
            make.size.equalTo(50)
            make.centerY.equalToSuperview()
            make.left.equalTo(self.snp.left).offset(30)
        }
    }
    
    private func installUserName(){
        userName = UILabel()
        userName.text = "爱吃苹果的拿铁"
        userName.font = UIFont.systemFont(ofSize: 14)
        self.rootOfTop.addSubview(userName)
        
        userName.snp.makeConstraints{ make in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.center.equalToSuperview()
        }
    }
    
    private func installMessageButton(){
        messageButton = UIButton(type: .system)
        messageButton.setBackgroundImage(UIImage(named: "message"), for: UIControl.State.normal)
        messageButton.setBackgroundImage(UIImage(named: "message_select"), for: UIControl.State.selected)
        self.rootOfTop.addSubview(messageButton)
        
        messageButton.snp.makeConstraints{ make in
            make.width.equalTo(30)
            make.height.equalTo(26)
            make.centerY.equalToSuperview()
            make.right.equalTo(self.rootOfTop.snp.right).offset(-15)
        }
    }
    
    private func installObligation(){
        obligationButton = UIButton(type: .custom)
        obligationButton.layer.cornerRadius = 10
        obligationButton.setBackgroundImage(UIImage(named: "red_back"), for: UIControl.State.normal)
        obligationButton.layer.masksToBounds = true
        self.addSubview(obligationButton)
        
        obligationButton.snp.makeConstraints{ make in
            make.width.equalTo((self.frame.width / 2) - 35)
            make.height.equalTo(93)
            make.top.equalTo(self.rootOfTop.snp.bottom).offset(20)
            make.centerX.equalToSuperview().offset(-100)
        }
    }
    
    private func installOrderList(){
        orderListButton = UIButton(type: .custom)
        orderListButton.layer.cornerRadius = 10
        orderListButton.layer.masksToBounds = true
        orderListButton.setImage(UIImage(named: "red_back"), for: UIControl.State.normal)
        
        self.addSubview(orderListButton)
        
        orderListButton.snp.makeConstraints{ make in
            make.width.equalTo((self.frame.width / 2) - 35)
            make.height.equalTo(93)
            make.top.equalTo(self.rootOfTop.snp.bottom).offset(20)
            make.centerX.equalToSuperview().offset(100)
        }
    }
    
    private func installConfigTableView(){
        configTableView = UITableView(frame: self.frame, style: .plain)
        configTableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: CONFIG_CELL_ID)
        configTableView.layer.cornerRadius = 10
        self.addSubview(configTableView)
        
        configTableView.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.width - 30)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.orderListButton.snp.bottom).offset(20)
            make.height.equalTo(235)
        }
    }
}
