//
//  PWHistoryTransactionVC.swift
//  PW
//
//  Created by Vladislav Novoseltsev on 02/04/2019.
//  Copyright © 2019 Vladislav Novoseltsev. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import TableKit

class PWHistoryTransactionVC: PWViewController {

    
    let viewModel: PWHistoryTransactionVMProtocol
    
    @IBOutlet weak var historyTableView: UITableView! {
        didSet {
            tableDirector = TableDirector(tableView: historyTableView, scrollDelegate: nil, shouldUseAutomaticCellRegistration: true, shouldUsePrototypeCellHeightCalculation: false)
        }
    }
    
    var tableDirector: TableDirector!
    init(viewModel: PWHistoryTransactionVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: PWHistoryTransactionVC.className, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView()
        setBindings()
        // Do any additional setup after loading the view.
    }

    func prepareView() {
        
        setTitle(string: "main.title.history".localized)
        viewModel.getHistory(binderItems: self.updateItems)
        
    }
    
    func setBindings() {
        
    }

    
    private var updateItems: Binder<[PWTransaction]>{
        return Binder(self.rx.base) { vc, items in
            
            
            items.forEach({ (item) in
                self.tableDirector.append(rows: [TableRow<PWItemHistory>(item: item)])
            })
            
            self.tableDirector.reload()
            
        }
    }

}

extension PWHistoryTransactionVC: UITableViewDelegate {
    
}


