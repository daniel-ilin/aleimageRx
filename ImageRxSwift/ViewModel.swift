//
//  ViewModel.swift
//  ImageRxSwift
//
//  Created by Daniel Ilin on 2/2/22.
//

import Foundation
import RxSwift
import UIKit

struct ViewModel {
        
    private var networkService = NetworkService()
    
    func fetchItems() -> Observable<Ales> {
        return networkService.fetchAles()
    }
    
}

class CellViewModel {
    private var networkService = NetworkService()
    
    var image: UIImage?
    var title: String?
    var description: String?
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
    
    func getImage(forUrl url: URL, completion: @escaping ()->Void) {
        networkService.getImage(fromUrl: url, completion: { image in
            self.image = image
            completion()
        })
    }
}
