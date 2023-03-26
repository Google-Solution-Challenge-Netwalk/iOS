//
//  TabManViewController.swift
//  Netwalk-iOS
//
//  Created by 이정동 on 2023/03/15.
//

import UIKit
import Tabman
import Pageboy

class TabManViewController: TabmanViewController {
    
    private var viewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabMan()
    }
    
    private func setupTabMan() {
        
        let timeRankVC = storyboard?.instantiateViewController(withIdentifier: "TimeRankViewController") as! TimeRankViewController
        let kmRankVC = storyboard?.instantiateViewController(withIdentifier: "KmRankViewController") as! KmRankViewController
        let trashRankVC = storyboard?.instantiateViewController(withIdentifier: "TrashRankViewController") as! TrashRankViewController
        
        viewControllers.append(timeRankVC)
        viewControllers.append(kmRankVC)
        viewControllers.append(trashRankVC)
        
        self.dataSource = self
        let bar = TMBar.ButtonBar()
        
        bar.backgroundView.style = .blur(style: .light)
        
        bar.layout.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        
        bar.buttons.customize { button in
            button.tintColor = .systemGray4
            button.selectedTintColor = .black
            button.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
            button.selectedFont = UIFont.systemFont(ofSize: 18, weight: .semibold)
        }
        
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.tintColor = .black
        addBar(bar, dataSource: self, at: .top)
    }

}

extension TabManViewController: PageboyViewControllerDataSource, TMBarDataSource {
    func numberOfViewControllers(in pageboyViewController: Pageboy.PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: Pageboy.PageboyViewController, at index: Pageboy.PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: Pageboy.PageboyViewController) -> Pageboy.PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "Time")
        case 1:
            return TMBarItem(title: "Distance")
        case 2:
            return TMBarItem(title: "Waste")
        default:
            return TMBarItem(title: "Test")
        }
    }
    
    
}
