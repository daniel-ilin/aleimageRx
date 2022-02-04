//
//  CellViewModel.swift
//  ImageRxSwift
//
//  Created by Maksim on 04/02/2022.
//

import Foundation
import RxSwift

class CellViewModel {
    private var networkService = NetworkService()
    
    private(set) var title: String?
    private(set) var description: String?
    private var imageURL: URL?
    
    init(ale: Ale) {
        self.title = ale.name
        self.description = ale.price
        self.imageURL = URL(string: ale.image)
    }
    
    func getImage() -> Single<UIImage> {
        guard let imageURL = imageURL else {
            return Single.just(DefaultImages.shared.brokenImage)
        }

        return networkService.getImage(fromUrl: imageURL)
            .catchAndReturn(DefaultImages.shared.brokenImage)
    }
}
