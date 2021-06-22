//
//  LoginViewModel.swift
//  EBuy
//
//  Created by Eldest's MacBook on 2021/6/10.
//

import Foundation
import UIKit

class LoginViewModel{
    private weak var accountTextField: UITextField!
    private weak var passwordTextField: UITextField!
    private weak var loginButtn: UIButton!
    private weak var reigsterButton: UIButton!
    
    init(accountTextField: UITextField, passwordTextField: UITextField, loginButtn: UIButton, reigsterButton: UIButton){
        self.accountTextField = accountTextField
        self.passwordTextField = passwordTextField
        self.loginButtn = loginButtn
        self.reigsterButton = reigsterButton
    }
    
    // MARK: - Observer.
    var accountTextFieldText: String?{
        set{
            accountTextField.text = newValue
        } get {
            return accountTextField.text
        }
    }
    
    var passwordTextFieldText: String?{
        set{
            passwordTextField.text = newValue
        } get {
            return passwordTextField.text
        }
    }
    
}
