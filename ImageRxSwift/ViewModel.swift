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
    private let alesURL = URL(string: "https://api.sampleapis.com/beers/ale")!
    
    
    func fetchItems() -> Observable<[CellViewModel]> {
        let alesObservable: Observable<Ales> = networkService.fetch(from: alesURL)
        
        return alesObservable.map{ $0.map { CellViewModel(ale: $0) } }
    }
    
}
