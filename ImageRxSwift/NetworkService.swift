//
//  NetworkService.swift
//  ImageRxSwift
//
//  Created by Daniel Ilin on 2/2/22.
//

import Foundation
import RxSwift
import UIKit

enum NetworkError: Error {
    case someError
}

struct NetworkService {
    
    func fetch<T: Decodable>(from URL: URL) -> Observable<T> {
        return Observable.create { observer in
            let task = URLSession.shared.dataTask(with: URL) { data, response, error in
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
    
    func getImage(fromUrl url: URL) -> Single<UIImage> {
        return Single.create { observer in
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data,
                   let image = UIImage(data: data) else {
                       observer(.failure(NetworkError.someError))
                       return
                }
                
                observer(.success(image))
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
}
