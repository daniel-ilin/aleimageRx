//
//  TableViewCell.swift
//  ImageRxSwift
//
//  Created by Daniel Ilin on 2/2/22.
//

import UIKit
import RxSwift

class TableViewCell: UITableViewCell {

    private var viewModel: CellViewModel?
    private var disposable: Disposable?
    
    @IBOutlet weak var aleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
        
    func setViewModel(to viewModel: CellViewModel) {
        aleImageView.image = nil
        disposable?.dispose()
        
        self.viewModel = viewModel
        
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        initializeImageDownload()
    }
    
    private func initializeImageDownload() {
        activityIndicator.startAnimating()
        
        disposable = self.viewModel?.getImage()
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] image in
                self?.aleImageView.image = image
                self?.activityIndicator.stopAnimating()
            })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.hidesWhenStopped = true
    }    

}
