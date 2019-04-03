//
//  PWLoginVC.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 01/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit

class PWLoginVC: PWViewController, PWLoginVCProtocol {

    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    let viewModel: PWLoginVMProtocol
    
    init(viewModel: PWLoginVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: PWLoginVC.className, bundle: nil)
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
        signInBtn.setTitle("main.title.signin".localized, for: .normal)
        signUpBtn.setTitle("main.title.signup".localized, for: .normal)
        
        emailTextField.placeholder = "main.title.email".localized
        passwordTextField.placeholder = "main.title.password".localized
    }

    @IBAction func signUp(_ sender: Any) {
        viewModel.openSignUpVC()
    }
    
    @IBAction func signIn(_ sender: Any) {
        viewModel.login(email: emailTextField.text!, password: passwordTextField.text!)
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
