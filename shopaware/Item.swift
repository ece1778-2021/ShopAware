//
//  Item.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-28.
//

import Foundation

class ShoppingListItem: Codable{
    var countryGood: CountryGood?
    var brand: Brand?
    
    init(brand: Brand) {
        self.brand = brand
    }
    
    init(countryGood: CountryGood) {
        self.countryGood = countryGood
    }
    
    init() {}
    
    func setCountryGood(countryGood: CountryGood) {
        self.countryGood = countryGood
    }
    
    func setBrand(brand: Brand) {
        self.brand = brand
    }
    
    func getRank() -> String {
        if let b = brand {
            return b.rating
        }else if let gc = countryGood {
            var i = 0
            if gc.child_labor == "Yes" {
                i = i + 2
            }
            if gc.forced_labor == "Yes" {
                i = i + 1
            }
            if gc.forced_child_labor == "Yes" {
                i = i + 3
            }

            if i == 0  {
                return "A"
            }else if i == 1 {
                return "C"
            }else if i == 2 {
                return "D"
            }else if i == 3 {
                return "F"
            }
            
        }else {
            return ""
        }
        return ""
    }
}
