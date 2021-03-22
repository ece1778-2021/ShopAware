//
//  Content.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-21.
//

import Foundation


class Content: Codable, Hashable {
    static func == (lhs: Content, rhs: Content) -> Bool {
        return lhs.title == rhs.title && lhs.body == rhs.body && lhs.link == rhs.link
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(title)
            hasher.combine(body)
            hasher.combine(link)
        }
    
    var title: String
    var body: String
    var link: String
    
    init(title: String, body: String, link: String) {
        self.title = title
        self.body = body
        self.link =  link
    }
}
