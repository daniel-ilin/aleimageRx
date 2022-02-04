//
//  TableViewCell.swift
//  ImageRxSwift
//
//  Created by Daniel Ilin on 2/2/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var viewModel: CellViewModel?
    
    @IBOutlet weak var aleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    func configureCell(for ale: Ale) {
        viewModel = CellViewModel(title: ale.name, description: ale.price)
        showLoading()
        
        guard let url = URL(string: ale.image) else { return }
        viewModel?.getImage(forUrl: url, completion: { [weak self] in
            self?.setImage()
        })
        
        guard let viewModel = viewModel else {
            return
        }
        
        guard let title = viewModel.title,
              let description = viewModel.description else { return }
        titleLabel.text = title
        descriptionLabel.text = description
    }
    
    func setImage() {
        guard let viewModel = viewModel else {
            return
        }
        
        guard let image = viewModel.image else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.aleImageView.image = image
            self?.hideLoading()
        }
    }
    
    func showLoading() {
        aleImageView.image = nil
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.isHidden = false
            self?.activityIndicator.startAnimating()
        }
    }
    
    private func hideLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
            self?.activityIndicator.isHidden = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
