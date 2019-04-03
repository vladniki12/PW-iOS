//
//  UIViewControllerExt.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

extension UIViewController {
    func dealloc() {
        if let navVC = self as? UINavigationController {
            navVC.viewControllers.forEach { $0.dismiss(animated: false) }
            navVC.removeFromParent()
        }
        // Allow the view controller to be deallocated
        self.dismiss(animated: false) {
            // Remove the root view in case its still showing
            self.view.removeFromSuperview()
            self.removeFromParent()
        }
    }
    
    var visibleController: UIViewController? {
        if let navigationController = self as? UINavigationController {
            return navigationController.topViewController?.visibleController
        } else if let tabBarController = self as? UITabBarController {
            return tabBarController.selectedViewController?.visibleController
        } else if let presentedViewController = presentedViewController {
            return presentedViewController.visibleController
        } else {
            return self
        }
    }
}
