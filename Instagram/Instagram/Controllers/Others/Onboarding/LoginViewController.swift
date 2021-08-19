//
//  LoginViewController.swift
//  Instagram
//
//  Created by Wei Si on 8/17/21.
//

import SafariServices
import UIKit

class LoginViewController: UIViewController {

    struct Constants {
        static let cornerRadius : CGFloat = 8.0
    }
    
    private let usernameEmailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username or email"
        field.returnKeyType = .next
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = true
        field.placeholder = "Password"
        field.returnKeyType = .continue
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.layer.masksToBounds = true
        field.layer.cornerRadius = Constants.cornerRadius
        field.backgroundColor = .secondarySystemBackground
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let loginBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    
    private let privacyBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Privacy policies", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let termsBtn: UIButton = {
        let button = UIButton()
        button.setTitle("Terms of Service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        return button
    }()
    
    private let createAcctBtn: UIButton = {
        let button = UIButton()
        button.setTitleColor(.label, for: .normal)
        button.setTitle("New User? Create an Account", for: .normal)
        return button
    }()
    
    private let headerView: UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImageView = UIImageView(image: UIImage(named:"gradient"))
        header.addSubview(backgroundImageView)
        return header
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginVC viewDidLoad")
        usernameEmailTextField.delegate = self
        passwordField.delegate = self
        loginBtn.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        createAcctBtn.addTarget(self, action: #selector(didTapCreateAcctButton), for: .touchUpInside)
        termsBtn.addTarget(self, action: #selector(didTapTermsButton), for: .touchUpInside)
        privacyBtn.addTarget(self, action: #selector(didTapPrivacyButton), for: .touchUpInside)
        addSubViews()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //assign frames
        headerView.frame = CGRect(x: 0,
                                  y: 0.0,
                                  width: view.width,
                                  height: view.height/3.0)
        
        usernameEmailTextField.frame = CGRect(
            x: 25,
            y: headerView.bottom + 10,
            width: view.width - 50,
            height: 52.0)
        
        passwordField.frame = CGRect(
            x: 25,
            y: usernameEmailTextField.bottom + 10,
            width: view.width - 50,
            height: 52.0)
        
        loginBtn.frame = CGRect(
            x: 25,
            y: passwordField.bottom + 10,
            width: view.width - 50,
            height: 52.0)
        
        createAcctBtn.frame = CGRect(
            x: 25,
            y: loginBtn.bottom + 10,
            width: view.width - 50,
            height: 52.0)
        
        termsBtn.frame = CGRect(x: 10,
                                y: view.height - view.safeAreaInsets.bottom - 100,
                                width: view.width - 20,
                                height: 50)
        
        privacyBtn.frame = CGRect(x: 10,
                                y: view.height - view.safeAreaInsets.bottom - 50,
                                width: view.width - 20,
                                height: 50)
        
        configureHeaderView()
        
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else {
            return
        }
        
        
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        backgroundView.frame = headerView.bounds
        
        // add instagram logi
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: view.width/4.0,
                                 y: view.safeAreaInsets.top,
                                 width: headerView.width/2.0,
                                 height: headerView.height - view.safeAreaInsets.top)
    }
    
    private func addSubViews() {
        view.addSubview(usernameEmailTextField)
        view.addSubview(passwordField)
        view.addSubview(loginBtn)
        view.addSubview(privacyBtn)
        view.addSubview(termsBtn)
        view.addSubview(createAcctBtn)
        view.addSubview(headerView)
    }
    
    @objc private func didTapLoginButton() {
        passwordField.resignFirstResponder()
        usernameEmailTextField.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailTextField.text, !usernameEmail.isEmpty,
              let password = passwordField.text, !password.isEmpty, password.count >= 8 else {
            //UIAlert
            
            return
        }
        
        //login functionality
        
    }
    
    @objc private func didTapTermsButton() {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapPrivacyButton() {
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: true)
    }
    
    @objc private func didTapCreateAcctButton() {
        let vc = RegistrationViewController()
        present(vc, animated: true)
    }
    

}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == usernameEmailTextField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapLoginButton()
        }
        
        return true
    }
    
}
