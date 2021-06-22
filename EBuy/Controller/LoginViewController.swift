//
//  LoginViewController.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/10.
//

import UIKit
import Hero
import Alamofire
import SwiftyJSON
import NotificationBannerSwift

class LoginViewController: UIViewController {
    
    var loginView: LoginView!
    var viewModel: LoginViewModel!
    
    private func initView(){
        loginView = LoginView(frame: self.view.frame)
        self.view.addSubview(loginView)
        
        viewModel = LoginViewModel(accountTextField: self.loginView.accountTextField, passwordTextField: self.loginView.passwordTextField, loginButtn: self.loginView.loginButton, reigsterButton: self.loginView.registerButton)
        loginView.loginButton.addTarget(self, action: #selector(loginListener), for: UIControl.Event.touchDown)
        loginView.registerButton.addTarget(self, action: #selector(registerListener), for: UIControl.Event.touchDown)
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
        
        addGesture()
    }
    
    // MARK: - Listener block.
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
    
    @objc func registerListener(){
        if(loginView.accountTextField.text!.count == 0) && (loginView.passwordTextField.text!.count == 0){
            let banner = GrowingNotificationBanner(title: "警告", subtitle: "不允许填写空的表单信息", style: .warning)
            banner.show()
        } else {
            AlamofireUtil.requestData(.get, URLString: "\(URLManager.getURL(type: "register"))\(loginView.accountTextField.text!)/\(loginView.passwordTextField.text!)/\(loginView.passwordTextField.text!)") { result in
                let jsonData = JSON(result)
                if (jsonData[0]["message"].string! == "1"){
                    let banner = GrowingNotificationBanner(title: "恭喜", subtitle: "您的账号已注册成功", style: .success)
                    banner.show()
                } else {
                    let banner = GrowingNotificationBanner(title: "错误", subtitle: "请检查您的账号及密码是否符合要求", style: .warning)
                    banner.show()
                }
                
            }
        }
        
    }
    
    @objc func loginListener(){
        if(loginView.accountTextField.text!.count == 0) && (loginView.passwordTextField.text!.count == 0){
            let banner = GrowingNotificationBanner(title: "警告", subtitle: "不允许填写空的表单信息", style: .warning)
            banner.show()
        } else {
            AlamofireUtil.requestData(.get, URLString: "\(URLManager.getURL(type: "login"))\(loginView.accountTextField.text!)/\(loginView.passwordTextField.text!)") { result in
                let jsonData = JSON(result)

                if(jsonData[0]["message"] == "1"){
                    self.dismiss(animated: true, completion: nil)
                    let userDefaults = UserDefaults.standard
                    userDefaults.setValue(jsonData[0]["data"]["userId"].string!, forKey: "user_id")
                    userDefaults.setValue(jsonData[0]["data"]["userPassword"].string!, forKey: "user_password")
                    userDefaults.synchronize()
                } else {
                    let banner = GrowingNotificationBanner(title: "错误", subtitle: "请检查您的账号及密码是否正确", style: .warning)
                    banner.show()
                }
            }
            
        }

    }
    
    

}
