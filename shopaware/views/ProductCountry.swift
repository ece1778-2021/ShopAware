//
//  ProductCountry.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-06.
//

import SwiftUI

struct ProductCountryView: View {
    var good: String
    var goodCountryList: [CountryGood]
    
    var lst: some View {
        ForEach(self.goodCountryList, id: \.country.name) { item in
            HStack{
                Text(item.country.name)
                let cl: String = "Child labor: " + item.child_labor
                let fl: String = "Forced labor: " + item.forced_labor
                let fcl: String = "Forced Child labor: " + item.forced_child_labor
                Text(cl)
                Text(fl)
                Text(fcl)
            }
        }
    }
    
    var body: some View {
        VStack {
            List {
                Text(good)
                lst
            }
        }
    }
    
    init(sat: SweatAndToil, good: String) {
        self.good = good
        self.goodCountryList = sat.get_countryGoods_by_good(good: good)
    }
}

