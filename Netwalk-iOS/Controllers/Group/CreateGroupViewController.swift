//
//  CreateViewController.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/03/17.
//

import UIKit

class CreateGroupViewController: UIViewController {
    
    @IBOutlet weak var groupCapacity: UITextField!
    @IBOutlet weak var groupName: UITextField!
    @IBOutlet weak var groupCategory: UITextField!
    @IBOutlet weak var groupContent: UITextView!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    var categoryPicker: UIPickerView!
    var exitBtn: UIBarButtonItem!
    var list = ["Overseas", "Mountain", "Sea", "Dawn", "Morning", "Lunch", "Evening", "Night", "Student"]
    var selectCity = "overseas"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        setUpView()
        setUpPicker()
    }
    
    func setUpPicker(){
        categoryPicker = UIPickerView()
        categoryPicker.delegate = self
        groupCategory.inputView = categoryPicker
        
        let pickerToolbar : UIToolbar = UIToolbar()
        let btnDone = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(onPickDone))
        let btnCancel = UIBarButtonItem(title: "Exit", style: .done, target: self, action: #selector(onPickCancel))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        pickerToolbar.barStyle = .default
        pickerToolbar.isTranslucent = true
        pickerToolbar.backgroundColor = .lightGray
        pickerToolbar.sizeToFit()
        pickerToolbar.setItems([btnCancel , space , btnDone], animated: true)
        pickerToolbar.isUserInteractionEnabled = true
        groupCategory.inputAccessoryView = pickerToolbar
    }
    
    @objc func onPickDone() {
        groupCategory.text = selectCity
        groupCategory.resignFirstResponder()
    }
       
    @objc func onPickCancel() {
        groupCategory.resignFirstResponder()
    }
    
    func setUpView(){
        groupContent.delegate = self
        groupContent.text =  "Grpup Content"
        groupContent.textColor = UIColor.systemGray3
        createButton.layer.cornerRadius = 8
        backButton.layer.borderColor = UIColor.systemBrown.cgColor
        backButton.layer.borderWidth = 1
        backButton.layer.cornerRadius = 8
        groupContent.layer.cornerRadius = 8
        groupContent.layer.borderWidth = 1
        groupContent.layer.borderColor = UIColor.systemGray6.cgColor
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func createButtonTapped(_ sender: UIButton) {
        guard let user = UserDefaults.standard.getLoginUser() else { return }
        let group = Group(groupNo: 0, userNo: user.user_no!, name: groupName.text!, capacity: Int(groupCapacity.text!)!, participant: 1, category: groupCategory.text!.lowercased())
        requestCreateGroup(group)
//        let newGroupVC = storyboard?.instantiateViewController(withIdentifier: "NewGroupVC") as! NewGroupViewController
//        newGroupVC.tableView.reloadData()
//        navigationController?.pushViewController(newGroupVC, animated: true)
        
    }
    
    func requestCreateGroup(_ group: Group) {
        GroupNetManager.shared.createGroup(group) {
            DispatchQueue.main.async {
                guard let viewControllerStack =
                        self.navigationController?.viewControllers else { return }
                for viewController in viewControllerStack {
                    if let newGroupView = viewController as? NewGroupViewController {
                        newGroupView.requestNewGroup("")
                        newGroupView.tableView.reloadData()
                        self.navigationController?.popToViewController(newGroupView, animated: true)
                    }
                }
            }
        }
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

extension CreateGroupViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectCity = list[row]
    }
    
}
