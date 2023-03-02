//
//  NewGroupViewController.swift
//  Netwalk-iOS
//
//  Created by 지윤 on 2023/02/13.
//
import UIKit

class NewGroupViewController: UIViewController {
    
    @IBOutlet weak var groupTableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    var categorys = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setUpTableView()
        
    }
    
    func setUpTableView(){
        print("NewGroupViewController")
        print(#function)
        categorys.append(Category(imageName: "overseas", title: "overseas"))
        categorys.append(Category(imageName: "overseas", title: "overseas"))
        categorys.append(Category(imageName: "overseas", title: "overseas"))
        categorys.append(Category(imageName: "overseas", title: "overseas"))
        categorys.append(Category(imageName: "overseas", title: "overseas"))
        groupTableView.delegate = self
        groupTableView.dataSource = self
        groupTableView.register(UINib(nibName:"NewGroupTableViewCell", bundle:nil), forCellReuseIdentifier: "NewGroupTableViewCell")
        groupTableView.separatorStyle = .none
    }
    
    @IBAction func searchButton(_ sender: UIButton) {
        let detailGroupVC = storyboard?.instantiateViewController(withIdentifier: "DetailGroupVC") as! DetailGroupViewController
        navigationController?.pushViewController(detailGroupVC, animated: true)
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension NewGroupViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
    -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("NewGroupViewController")
        print(#function)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewGroupTableViewCell", for: indexPath) as! NewGroupTableViewCell
        
        cell.categoryTitle.text = "Category"
        cell.configure(with: categorys)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
}
