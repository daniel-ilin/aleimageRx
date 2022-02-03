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
    
    func configureCell() {
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

        guard let image = viewModel.image else { return }
        aleImageView.image = image
    }        
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }    

}
