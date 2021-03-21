//
//  Certification.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-21.
//

import Foundation

class Certification {
    var name: String
    var old_seal: String
    var current_seal: String
    var objectives: [Content]
    var benefits: [Content]
    var critisims: [Content]
    var updates: [Content]

    init(name: String, old_seal: String, current_seal: String, objectives: [Content], benefits: [Content], critisims: [Content], updates: [Content]) {
        self.name = name
        self.old_seal = old_seal
        self.current_seal = current_seal
        self.objectives = objectives
        self.benefits = benefits
        self.critisims = critisims
        self.updates = updates
    }
}
