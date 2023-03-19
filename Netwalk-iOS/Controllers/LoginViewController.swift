//
//  LoginViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/02.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIImageView!
    
    @IBOutlet weak var googleLoginButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginButton()
    }
    
    private func setupLoginButton() {
        let appleLoginButtonRecognizer
        = UITapGestureRecognizer(target: self, action: #selector(appleLoginButtonTapped(tapGestureRecognizer:)))
        loginButton.isUserInteractionEnabled = true
        loginButton.addGestureRecognizer(appleLoginButtonRecognizer)
        
        let googleLoginButtonRecognizer = UITapGestureRecognizer(target: self, action: #selector(googleLoginButtonTapped(tapGestureRecognizer:)))
        googleLoginButton.isUserInteractionEnabled = true
        googleLoginButton.addGestureRecognizer(googleLoginButtonRecognizer)
    }
    
    
    @objc func appleLoginButtonTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        // 로그인 네트워킹 시작
        var user = User(email: "test1@naver.com", name: "test1")
        
        UserNetManager.shared.login(user: user) { no in
            user.user_no = no
            
            UserDefaults.standard.setLoginUser(user: user)
            
            GroupNetManager.shared.readPartGroup(user.user_no!) { groups in
                GroupManager.shared.groups = groups
            }
            
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tabBarVC = storyboard.instantiateViewController(identifier: "TabBarVC")
                
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBarVC)
            }
        }
    }
    
    @objc func googleLoginButtonTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)

        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            
            guard error == nil else { print("Google Login Error"); return }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else { print("User authentication, idToken Error"); return }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                guard error == nil else { print("Google Auth Error"); return }
                
                guard let authResult = authResult else { print("Err"); return }
                
                var user = User(email: authResult.user.email!, name: authResult.user.displayName!)
                
                UserNetManager.shared.login(user: user) { userNo in
                    user.user_no = userNo
                    UserDefaults.standard.setLoginUser(user: user)
                    print(user)
                    
                    GroupNetManager.shared.readPartGroup(user.user_no!) { groups in
                        GroupManager.shared.groups = groups
                    }
                    
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let tabBarVC = storyboard.instantiateViewController(identifier: "TabBarVC")
                        
                        // Root View Controller 변경
                        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(tabBarVC)
                    }
                }
            }
            
        }
    }
}
