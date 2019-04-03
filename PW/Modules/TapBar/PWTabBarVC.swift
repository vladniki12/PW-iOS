//
//  PWTabBarVC.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxSwift
import RealmSwift

class PWTabBarVC: UITabBarController, UITabBarControllerDelegate {
    
    private let wireframe = PWWireframe()
    //private var settings = SIUserSettings()
    private let userToken: String
    
    
    init() {
        
        self.userToken = PWUserDefaults.shared.tokenId ?? ""
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("+++++++++++++++++++++++++++++++++++++++++++")
        prepareTabBar()
        preprareItems()
        selectedIndex = 0
        UIApplication.shared.isStatusBarHidden = false
        
    }
    
   
    
    
    
    private func prepareTabBar() {
        
        self.delegate = self
        tabBar.barTintColor = UIColor(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
        tabBar.tintColor = UIColor(red: 74.0 / 255.0, green: 118.0 / 255.0, blue: 186.0 / 255.0, alpha: 1.0)
        if #available(iOS 10.0, *) {
            tabBar.unselectedItemTintColor = UIColor(red: 182.0 / 255.0, green: 188.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
        }
        
        tabBar.isHidden = true
    }
    
    private func preprareItems() {
        let emptyVc = PWViewController()
        
        let mainScreen = PWNavigationController(rootViewController: MainScreenWireframe.createModule())
        
        let historyTransaction = PWNavigationController(rootViewController: PWHistoryTransactionWireframe.createModule())
        
        let createTransaction = PWNavigationController(rootViewController: PWCreateTransactionWireframe.createModule())
        
        
        let controllers = [mainScreen, historyTransaction, createTransaction]
        controllers.forEach {
            let tabItem = PWTabBarItem(rawValue: controllers.firstIndex(of: $0)!)
            //tabItem?.title = tabItem?.title.lowercased()
            
            $0.visibleViewController?.navigationController?.navigationItem.title = tabItem?.title.lowercased().capitalizingFirstLetter()
            $0.tabBarItem = tabItem?.item
            
            $0.tabBarItem.title = $0.tabBarItem.title?.lowercased().capitalizingFirstLetter()
        }
        
        viewControllers = controllers
    }
    
    
    
    
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        (viewControllers?[selectedIndex] as? UINavigationController)?.popToRootViewController(animated: false)
        //        NotificationCenter.default.post(name: Notification.Name("update"), object: nil)
        
    }
}

