//
//  UIApplicationExt.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

extension UIApplication {
    class func topViewController(rootController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = rootController as? UINavigationController {
            return topViewController(rootController: navigationController.visibleViewController)
        }
        if let tabController = rootController as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(rootController: selected)
            }
        }
        if let presented = rootController?.presentedViewController {
            return topViewController(rootController: presented)
        }
        return rootController
    }
    static var topMostViewController: UIViewController? {
        return UIApplication.shared.keyWindow?.rootViewController?.visibleController
    }
}
