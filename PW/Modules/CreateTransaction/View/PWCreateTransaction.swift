//
//  PWCreateTransaction.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import TableKit
import RxCocoa
import RxSwift

class PWCreateTransaction: PWViewController {

    
    @IBOutlet weak var usersSearchBar: UISearchBar!
    @IBOutlet weak var usersTableView: UITableView! {
        didSet {
            tableDirector = TableDirector(tableView: usersTableView, scrollDelegate: nil, shouldUseAutomaticCellRegistration: true, shouldUsePrototypeCellHeightCalculation: false)
        }
    }
    var viewModel: PWCreateTransactionVMProtocol
    
    
    
    var tableDirector: TableDirector!
    init(viewModel: PWCreateTransactionVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: PWCreateTransaction.className, bundle: nil)
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
        
        setTitle(string: "main.title.create".localized)
        displayTabBarWhenViewAppears(false)
        viewModel.binding(binder: binderUpdateUsers, searchTextBinder: usersSearchBar.rx.text )
       
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    private var binderUpdateUsers: Binder<[PWUser]>{
        return Binder(self.rx.base) { vc, items in
            self.tableDirector.clear()
            self.viewModel.arrayUsers?.removeAll()
            items.forEach({ (item) in
                self.viewModel.arrayUsers.append(item)
                let tableAction = TableRowAction<ItemCreateTransactionCell>(.click){
                    [weak self] (options) in
                    let user = self?.viewModel.arrayUsers[options.indexPath.row]
                    self?.viewModel.openSendTransactionScree(user: user!)
                }
                self.tableDirector.append(rows: [TableRow<ItemCreateTransactionCell>(item: item, actions: [tableAction])])
            })
            
            self.tableDirector.reload()
            
        }
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
