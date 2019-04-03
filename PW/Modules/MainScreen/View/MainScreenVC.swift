//
//  MainScreenVC.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainScreenVC: PWViewController {
    
    let viewModel: MainScreenVMProtocol
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var exitBtn: UIButton!
    init(viewModel: MainScreenVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: MainScreenVC.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView()
        setBindings()
    }
    
    func prepareView() {
        setTitle(string: "main.title.main".localized)
        emailLabel.text = "main.title.email".localized
        nameLabel.text = "main.title.name".localized
        balanceLabel.text = "main.title.balance".localized
        idLabel.text = "main.title.id".localized
        exitBtn.setTitle("main.title.logout".localized, for: .normal)
        
        
    }
    
    func setBindings() {
        
        viewModel.getUserInfo(email: emailLabel.rx.text, userName: nameLabel.rx.text, balance: balanceLabel.rx.text, id: idLabel.rx.text)
    }

    @IBAction func exit(_ sender: Any) {
        viewModel.exit()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
