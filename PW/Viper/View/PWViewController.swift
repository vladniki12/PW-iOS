//
//  PWViewController.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import SVProgressHUD

class PWViewController: UIViewController {
    
    private var isTabBarHidden = false
    
    
    
    var isShowTitleLabel = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.title = self.title?.uppercased()
        
       
        
        self.navigationController?.title = self.title?.uppercased()
        self.title = self.title?.lowercased().capitalizingFirstLetter()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = self.isTabBarHidden
        
        self.navigationController?.title = self.title?.uppercased()
        self.title = self.title?.lowercased().capitalizingFirstLetter()
        
        
        
        super.viewWillAppear(animated)
    }
    

    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.title = self.title?.lowercased().capitalizingFirstLetter()
    }
    
    func displayTabBarWhenViewAppears(_ hidden: Bool) {
        self.isTabBarHidden = hidden
    }
    
    func showLoader() {
        SVProgressHUD.show()
    }
    
    func hideLoader() {
        SVProgressHUD.dismiss()
    }
    
    func setTitle(string: String) {
        let label = UILabel(frame: CGRect.zero)
        label.backgroundColor = .clear
        label.font = UIFont(name: "Rubik-Regular", size: 17)
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.text = string.uppercased()
        self.navigationItem.titleView = label
        label.adjustsFontSizeToFitWidth = true
        label.sizeToFit()
    }
        
}
