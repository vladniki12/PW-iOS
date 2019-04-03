//
//  PWWireframe.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class PWWireframe {
    
    var topVC: UIViewController? {
        return UIApplication.topViewController()
    }
    
    func setNewRootVc(vc: UIViewController, animated: Bool = false) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            
            return
        }
        appDelegate.setRootVc(vc: vc, animated: animated)
    }
}

extension PWWireframe {
    
    // MARK: - Navigation
    // MARK: -
    
    func push(vc: UIViewController) {
        topVC?.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pop() {
        topVC?.navigationController?.popViewController(animated: true)
    }
    
    func present(vc: UIViewController) {
        topVC?.present(vc, animated: true)
    }
}

extension PWWireframe {
    
    // MARK: - Alert Views
    // MARK: -
    
    func showAlertViewWithOKButton(message: String, title: String, okAction: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            okAction?()
        }))
        DispatchQueue.main.async { [weak self] in
            self?.topVC?.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertViewWithButtons(message: String, title: String, buttons: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        for action in buttons {
            alert.addAction(action)
        }
        DispatchQueue.main.async { [weak self] in
            self?.topVC?.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertViewWithOKButton(message: NSAttributedString, title: NSAttributedString, okAction: (() -> Void)? = nil) {
        let alert = UIAlertController(title: "", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.setValue(title, forKey: "attributedTitle")
        alert.setValue(message, forKey: "attributedMessage")
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
            okAction?()
        }))
        DispatchQueue.main.async { [weak self] in
            self?.topVC?.present(alert, animated: true, completion: nil)
        }
    }
}

extension PWWireframe {
    func shareText(texts: [String], _ sender: AnyObject, isSuccess: (() -> Void)? = nil) {
        let activityVC = UIActivityViewController(activityItems: texts, applicationActivities: nil)
        
        //New Excluded Activities Code
        activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
        //
        
        let sourceObject = sender as! UIButton
        activityVC.popoverPresentationController?.sourceView = sourceObject
        activityVC.popoverPresentationController?.sourceRect = sourceObject.bounds
        activityVC.completionWithItemsHandler = {
            (activity, success, items, error) in
            if success {
                isSuccess?()
            }
        }
        topVC!.present(activityVC, animated: true, completion: nil)
    }
}

