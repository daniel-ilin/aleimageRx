//
//  TableViewCell.swift
//  ImageRxSwift
//
//  Created by Daniel Ilin on 2/2/22.
//

import UIKit
import RxSwift
import RxCocoa

class TableViewCell: UITableViewCell {

    private var viewModel: CellViewModel?
    private var disposeBag = DisposeBag()
    
    @IBOutlet weak var aleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
        
    
    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        
        aleImageView.image = nil
        disposeBag = DisposeBag()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        activityIndicator.hidesWhenStopped = true
    }
    
    // MARK: - ViewModel related
    func setViewModel(to viewModel: CellViewModel) {
        self.viewModel = viewModel
        
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.description
        initializeImageDownload()
    }
    
    private func initializeImageDownload() {
        activityIndicator.startAnimating()
        
        self.viewModel?.getImage()
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { [aleImageView, activityIndicator] image in
                aleImageView?.image = image
                activityIndicator?.stopAnimating()
            }).disposed(by: disposeBag)
    }

}
