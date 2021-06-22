//
//  LoginView.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/10.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    var accountTextField: UITextField!
    var passwordTextField: UITextField!
    var label: UILabel!
    var loginButton: UIButton!
    var registerButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configView()
    
        installLabel()
        installAccountTextField()
        installPasswordTextField()
        installLoginButton()
        installRegisterButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration.
    private func configView(){
        self.backgroundColor = UIColor(red: 0.958, green: 0.958, blue: 0.998, alpha: 1.0)
    }
    
    // MARK: - Install widget.
    private func installLabel(){
        label = UILabel()
        label.text = "账号通行"
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.medium)
        self.addSubview(label)
        
        label.snp.makeConstraints{ make in
            make.width.equalTo(130)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func installAccountTextField(){
        accountTextField = UITextField()
        accountTextField.placeholder = "请输入账号"
        accountTextField.backgroundColor = UIColor.white
        accountTextField.layer.masksToBounds = true
        accountTextField.layer.cornerRadius = 10
        self.addSubview(accountTextField)
        
        accountTextField.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.width - 140)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.centerY.equalTo(self.snp.centerY).offset(-200)
        }
    }
    
    private func installPasswordTextField(){
        passwordTextField = UITextField()
        passwordTextField.placeholder = "请输入密码"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.backgroundColor = UIColor.white
        self.addSubview(passwordTextField)
        
        passwordTextField.snp.makeConstraints{ make in
            make.width.equalTo(self.frame.width - 140)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.accountTextField.snp.bottom).offset(20)
        }
    }
    
    private func installLoginButton(){
        loginButton = UIButton(type: .custom)
        loginButton.setTitle("登陆", for: UIControl.State.normal)
        loginButton.setTitleColor(UIColor.gray, for: UIControl.State.highlighted)
        loginButton.backgroundColor = UIColor.systemBlue
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 10
        self.addSubview(loginButton)
        
        loginButton.snp.makeConstraints{ make in
            make.width.equalTo(90)
            make.height.equalTo(37)
            make.right.equalTo(self.snp.centerX).offset(-40)
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(25)
        }
    }
    
    private func installRegisterButton(){
        registerButton = UIButton(type: .custom)
        registerButton.setTitle("注册", for: UIControl.State.normal)
        registerButton.setTitleColor(UIColor.gray, for: UIControl.State.highlighted)
        registerButton.backgroundColor = UIColor.systemBlue
        registerButton.layer.masksToBounds = true
        registerButton.layer.cornerRadius = 10
        self.addSubview(registerButton)
        
        registerButton.snp.makeConstraints{ make in
            make.width.equalTo(90)
            make.height.equalTo(37)
            make.left.equalTo(self.snp.centerX).offset(40)
            make.top.equalTo(self.passwordTextField.snp.bottom).offset(25)
        }
    }
}
