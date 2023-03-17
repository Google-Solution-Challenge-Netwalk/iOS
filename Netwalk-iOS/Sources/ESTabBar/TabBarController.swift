//
//  TabBarController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/02/02.
//

import UIKit
import ESTabBarController_swift

class TabBarController: ESTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.tabBar.shadowImage = UIImage(named: "transparent")
        //self.tabBar.backgroundImage = UIImage(named: "background_dark")
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = storyboard.instantiateViewController(withIdentifier: "GroupVC")
        let vc2 = storyboard.instantiateViewController(withIdentifier: "ReviewVC")
        let vc3 = storyboard.instantiateViewController(withIdentifier: "PloggingVC")
        let vc4 = storyboard.instantiateViewController(withIdentifier: "RankingVC")
        let vc5 = storyboard.instantiateViewController(withIdentifier: "ProfileVC")
        
        vc1.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Group", image: UIImage(named: "group"), selectedImage: UIImage(named: "group"))
        vc2.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Review", image: UIImage(named: "review"), selectedImage: UIImage(named: "reivew"))
        vc3.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: nil, image: UIImage(named: "photo_verybig"), selectedImage: UIImage(named: "photo_verybig_1"))
        vc4.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Rank", image: UIImage(named: "rank"), selectedImage: UIImage(named: "rank"))
        vc5.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Profile", image: UIImage(named: "profile"), selectedImage: UIImage(named: "profile"))
        
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        self.selectedIndex = 2
    }

}
