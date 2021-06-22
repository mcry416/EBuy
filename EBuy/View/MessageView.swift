//
//  MessageView.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/2.
//

import UIKit
import SnapKit

class MessageView: UIView {
    
    var rootOfTop: UIImageView!
    var tableView: UITableView!
    var backButtton: UIButton!
    var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        installRootOfTop()
        installBackButton()
        installTitleLabel()
        installTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Install widget.
    private func installRootOfTop(){
        rootOfTop = UIImageView()
        rootOfTop.isUserInteractionEnabled = true
        self.addSubview(rootOfTop)
        
        rootOfTop.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.height.equalTo(100)
            make.top.equalTo(self.snp.top).offset(5)
        }
    }
    
    private func installBackButton(){
        backButtton = UIButton()
        backButtton.setImage(UIImage(named: "close"), for: UIControl.State.normal)
        self.rootOfTop.addSubview(backButtton)
        
        backButtton.snp.makeConstraints{ make in
            make.size.equalTo(23)
            make.centerY.equalToSuperview()
            make.left.equalTo(self.rootOfTop.snp.left).offset(20)
        }
    }
    
    private func installTitleLabel(){
        titleLabel = UILabel()
        titleLabel.text = "消息中心"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        self.rootOfTop.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints{ make in
            make.width.equalTo(85)
            make.height.equalTo(35)
            make.center.equalToSuperview()
        }
    }
    
    private func installTableView(){
        tableView = UITableView(frame: self.frame, style: .plain)
        tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "MESSAGE_ID")
        self.addSubview(tableView)
        
        self.tableView.snp.makeConstraints{ make in
            make.width.equalToSuperview()
            make.top.equalTo(self.rootOfTop.snp.bottom)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}
