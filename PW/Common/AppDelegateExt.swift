//
//  AppDelegateExt.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

extension AppDelegate {
    
    func setRootVc(vc: UIViewController, animated: Bool = false) {
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }
        let previousViewController = window?.rootViewController
        
        if animated {
            UIView.transition(with: window!, duration: 0.5, options: .transitionFlipFromRight, animations: { [weak self] in
                self?.window?.rootViewController = vc
                self?.window?.makeKeyAndVisible()
                }, completion: { _ in
                    previousViewController?.dealloc()
            })
        } else {
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
            previousViewController?.dealloc()
        }
    }
}
