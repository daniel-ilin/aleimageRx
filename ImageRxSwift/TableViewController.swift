//
//  TableViewController.swift
//  ImageRxSwift
//
//  Created by Daniel Ilin on 2/2/22.
//

import UIKit
import RxSwift
import RxCocoa

class TableViewController: UITableViewController {
    
    private let viewModel = ViewModel()
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTable()
    }
    
    
    private func configureTable() {
        tableView.dataSource = nil
        
        navigationItem.title = "Ales"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel.fetchItems()
            .bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: TableViewCell.self)) {
                index, ale, cell in
                cell.configureCell(for: ale)
            }.disposed(by: bag)
    }
}
