//
//  LoginViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/02.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIImageView!
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        // 로그인 네트워킹 시작
        let user = User(email: "test@naver.com", name: "tester")
        
        UserNetManager.shared.login(user: user) {
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tabBarVC = storyboard.instantiateViewController(identifier: "TabBarVC")
                
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBarVC)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapImageViewRecognizer
        = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        loginButton.isUserInteractionEnabled = true
        loginButton.addGestureRecognizer(tapImageViewRecognizer)
        
    }
}
