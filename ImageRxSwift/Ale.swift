//
//  Ale.swift
//  ImageRxSwift
//
//  Created by Daniel Ilin on 2/2/22.
//

import Foundation

// MARK: - Ale
struct Ale: Codable {
    let price, name: String
    let rating: Rating
    let image: String
    let id: Int
}

// MARK: - Rating
struct Rating: Codable {
    let average: Double
    let reviews: Int
}

typealias Ales = [Ale]
