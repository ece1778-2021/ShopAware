//
//  FAQ.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-21.
//

import Foundation


class FAQ: Codable, Hashable {
    static func == (lhs: FAQ, rhs: FAQ) -> Bool {
        return lhs.field == rhs.field && lhs.question == rhs.question && lhs.answer == rhs.answer
    }
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(field)
            hasher.combine(question)
            hasher.combine(answer)
        }
    
    var field: String
    var question: String
    var answer: String
    
    init(field: String, question: String, answer: String) {
        self.field = field
        self.question = question
        self.answer =  answer
    }
}

