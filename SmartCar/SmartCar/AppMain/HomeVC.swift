//
//  HomeVC.swift
//  SmartCar
//
//  Created by Thomas Lau on 2020/7/18.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class HomeVC: UITabBarController {
    
    static let shared = HomeVC()
    
    var tabArray = [UIViewController]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        
        setupVCs()
    }
    
    func setupVCs() {
        
        let firstNavCon = NavVC(rootViewController: setupTabbarCons(controller: ControllVC.shared,
                                                                    title: "control",
                                                                    barTitle: "",
                                                                    image: "",
                                                                    selectImage: ""))
        
        let secNavCon = NavVC(rootViewController: setupTabbarCons(controller: SettingsVC.shared,
                                                                  title: "settings",
                                                                  barTitle: "",
                                                                  image: "",
                                                                  selectImage: ""))
        

        tabArray.append(firstNavCon)
        tabArray.append(secNavCon)
        
        self.setViewControllers(tabArray, animated: true)
    }

    func setupTabbarCons(controller: UIViewController, title: String, barTitle: String, image: String, selectImage: String) -> UIViewController {
        
        controller.title = title
        controller.tabBarItem.title = barTitle
        controller.tabBarItem.image = UIImage.init(named: image)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage.init(named: selectImage)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.hex(0x8DC64F)], for: .selected)
        
        return controller
    }
}
