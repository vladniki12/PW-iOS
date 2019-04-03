//
//  PWSendTransactionVC.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 03/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class PWSendTransactionVC: PWViewController {

    
    let viewModel: PWSendTransactionVMProtocol
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var amountTextEdit: UITextField!
    @IBOutlet weak var toNameLabel: UILabel!
    init(viewModel: PWSendTransactionVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: PWSendTransactionVC.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView()
        // Do any additional setup after loading the view.
    }

    func prepareView() {
        setTitle(string: "main.title.send".localized)
        displayTabBarWhenViewAppears(false)
        sendButton.setTitle("main.title.send".localized, for: .normal)
        amountTextEdit.placeholder = "main.title.amount".localized
        
        let toTitle = "main.title.amount_to".localized
        
        toNameLabel.text = "\(toTitle) : \(self.viewModel.user.name ?? "")"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "bacBack"), style: .plain, target: self, action: #selector(onNavBackItemTap))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }

    @IBAction func sendMoney(_ sender: Any) {
        viewModel.sendMoney(amount: amountTextEdit.text!)
    }
    
    @objc func onNavBackItemTap() {
        viewModel.back()
    }
   

}
