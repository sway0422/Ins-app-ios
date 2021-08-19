//
//  HomeViewController.swift
//  Instagram
//
//  Created by Wei Si on 8/17/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad HomeVC")
        handNotAuthenticated()
        // Do any additional setup after loading the view.
    }
    
    private func handNotAuthenticated() {
        if !AuthManager.shared.isUserLoggedIn() {
            let loginVC =  LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
        
    }

}
