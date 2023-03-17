//
//  CreateViewController.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/17.
//

import UIKit

class CreateGroupViewController: UIViewController {
    
    @IBOutlet weak var groupName: UITextField!
    @IBOutlet weak var groupNumOfPeople: UITextField!
    @IBOutlet weak var groupCategory: UITextField!
    @IBOutlet weak var groupContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setUpView()
        groupContent.delegate = self
        groupContent.text =  "Grpup Content"
        groupContent.textColor = UIColor.systemGray3
    }
    
    func setUpView(){
        groupContent.layer.cornerRadius = 8
        groupContent.layer.borderWidth = 1
        groupContent.layer.borderColor = UIColor.systemGray6.cgColor
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func createButtonTapped(_ sender: UIButton) {
    }
}

extension CreateGroupViewController: UITextViewDelegate {
  func textViewDidBeginEditing(_ textView: UITextView) {
    if textView.textColor == UIColor.systemGray3 {
      textView.text = nil
      textView.textColor = UIColor.black
    }
  }

  func textViewDidEndEditing(_ textView: UITextView) {
    if textView.text.isEmpty {
      textView.text = "Grpup Content"
      textView.textColor = UIColor.systemGray3
    }
  }
}
