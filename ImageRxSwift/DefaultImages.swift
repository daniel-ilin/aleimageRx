//
//  DefaultImages.swift
//  ImageRxSwift
//
//  Created by Maksim on 04/02/2022.
//

import UIKit.UIImage

class DefaultImages {
    static let shared = DefaultImages()
    
    var brokenImage: UIImage {
        UIImage(named: "brokenImage")!
    }
}
