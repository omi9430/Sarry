//
//  TabBarViewController.swift
//  SarryProject
//
//  Created by omair khan on 16/09/2021.
//

import UIKit

class TabBarViewController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let vc1 = UINavigationController(rootViewController: ViewController())
        let vc2 = UINavigationController(rootViewController: vc2())
        let vc3 = UINavigationController(rootViewController: vc3())
        let vc4 = UINavigationController(rootViewController: vc4())
        
        let controllers = [ vc1,vc2,vc3,vc4 ]
        self.viewControllers = controllers
        
        vc1.title = "Home"
        vc2.title = "Search"
        vc3.title = "Some"
        vc4.title = "Text"
        
        guard let items = tabBar.items else {
            return
            
        }
        
        for item in 0...items.count - 1 {
            let imageNames = ["house","magnifyingglass","person.circle","star"]
            items[item].image = UIImage(systemName: imageNames[item])
        }
        
    }
    
    
    

    
    

}
