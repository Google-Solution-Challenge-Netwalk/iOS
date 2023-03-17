//
//  CreateViewController.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/17.
//

import UIKit

class CreateGroupViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
