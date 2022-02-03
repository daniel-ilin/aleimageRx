//
//  NetworkService.swift
//  ImageRxSwift
//
//  Created by Daniel Ilin on 2/2/22.
//

import Foundation
import RxSwift
import UIKit

struct NetworkService {
    
    func fetchAles<T: Decodable>() -> Observable<T> {
        return Observable.create { observer in
            let task = URLSession.shared.dataTask(with: URL(string: "https://api.sampleapis.com/beers/ale")!) { data, response, error in
                guard let data = data, let decoded = try? JSONDecoder().decode(T.self, from: data) else { return }
                observer.onNext(decoded)
                observer.onCompleted()
            }
            task.resume()
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    func getImage(fromUrl url: URL) -> UIImage? {
        guard let data = try? Data(contentsOf: url) else { return nil }
        let image = UIImage(data: data)
        return image
    }
    
}
