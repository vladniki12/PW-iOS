//
//  PWSignUpVC.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit


class PWSignUpVC: PWViewController, PWSignUpVCProtocol {

    
    @IBOutlet weak var emailEditText: UITextField!
    @IBOutlet weak var nameEditText: UITextField!
    @IBOutlet weak var passwordEditText: UITextField!
    @IBOutlet weak var confirmPasswordEditText: UITextField!
    @IBOutlet weak var signUpBtn: UIButton!
    
    
    
    let viewModel: PWSignUpVMProtocol
    
    init(viewModel: PWSignUpVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: PWSignUpVC.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        // Do any additional setup after loading the view.
    }
    
    private func prepareView() {
        self.setTitle(string: "main.title.signup".localized)
        
        emailEditText.placeholder = "main.title.email".localized
        nameEditText.placeholder = "main.title.name".localized
        passwordEditText.placeholder = "main.title.password".localized
        confirmPasswordEditText.placeholder = "main.title.confirm_password".localized
        
        signUpBtn.setTitle("main.title.signup".localized, for: .normal)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "bacBack"), style: .plain, target: self, action: #selector(onNavBackItemTap))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    
    
    // MARK: - Actions
    // MARK: -
    
    
    @objc func onNavBackItemTap() {
        viewModel.back()
    }

    @IBAction func signUp(_ sender: Any) {
        viewModel.signUp(emailEditText.text!,
                         nameEditText.text!,
                         passwordEditText.text!,
                         confirmPasswordEditText.text!)
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
