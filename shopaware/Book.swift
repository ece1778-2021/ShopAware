//
//  Book.swift
//  shopaware
//
//  Created by Julyan Baruch on 2021-03-01.
//

import Foundation


struct Books: Decodable {
    var items: [BookItem]
}


struct BookItem: Decodable {
    let id: String
    let volumeInfo: VolumeInfo
}


struct VolumeInfo: Decodable {
    let title: String
    let subtitle: String?
    let authors: [String]
    let publishedDate: String
    let pageCount: Int
    let language: String
}
