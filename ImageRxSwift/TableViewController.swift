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
        let alesObservable = viewModel.fetchItems()
        alesObservable.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: TableViewCell.self)) { index, ale, cell in
            cell.viewModel = CellViewModel(title: ale.name, description: ale.price)
            cell.configureCell()
            let url = URL(string: ale.image)
            if url != nil {
                cell.viewModel?.getImage(forUrl: url!)
                cell.setImage()
            }
        }.disposed(by: bag)
    }
}