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
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Ales"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureTable()
    }
    
    
    private func configureTable() {
        tableView.dataSource = nil
        
        viewModel.fetchItems()
            .bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: TableViewCell.self)) {
                index, cellVM, cell in
                cell.setViewModel(to: cellVM)
            }.disposed(by: disposeBag)
    }
}
