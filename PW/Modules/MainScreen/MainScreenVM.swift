//
//  MainScreenVM.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainScreenVM: PWViewModel, MainScreenVMProtocol {
    
    let wireframe: MainScreenWireframeProtocol
    let interactor: MainScreenInteractorProtocol
    
    init(wireframe: MainScreenWireframeProtocol, interactor: MainScreenInteractorProtocol) {
        self.wireframe = wireframe
        self.interactor = interactor
    }
    
    func getUserInfo(email: Binder<String?>,
                     userName: Binder<String?>,
                     balance: Binder<String?>,
                     id: Binder<String?>
        ) {
        
        let user = interactor.getUserInfoDB()
        
        if(user != nil) {
            setParams(email: email, userName: userName, balance: balance, id: id, user: user!)
        }
        
        interactor.getUserInfo().subscribe { (event) in
            if(event.element != nil) {
            
                let userInfo = event.element
              
                self.setParams(email: email, userName: userName, balance: balance, id: id, user: userInfo!.userInfoToken)
                self.interactor.updateUserInfo(user: userInfo!.userInfoToken)
                
            }
        }.disposed(by: disposeBag)
    }
    
    func setParams(email: Binder<String?>,
                   userName: Binder<String?>,
                   balance: Binder<String?>,
                   id: Binder<String?>, user: PWUserInfoToken) {
        let emailTitle = "main.title.email".localized
        let userNameTitle = "main.title.name".localized
        let balanceTitle = "main.title.balance".localized
        let idTitle = "main.title.id".localized
        
        
        let balanceFloat = NSString(format: "%.2f", (user.balance))
        
        let idInt = NSString(format: "%d", (user.id))
        
        email.onNext("\(emailTitle) : \(user.email ?? "")")
        userName.onNext("\(userNameTitle) : \(user.name ?? "")")
        balance.onNext("\(balanceTitle) : \(balanceFloat)")
        id.onNext("\(idTitle) : \(idInt)")
    }
    func exit() {
        wireframe.exit()
        interactor.clearSession()
    }

}
