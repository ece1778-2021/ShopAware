//
//  ProductCountry.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-06.
//

import SwiftUI

struct ProductCountryView: View {
    @State private var width: CGFloat? = 100
    @State private var small_width: CGFloat? = 70
    
    var good: String
    var goodCountryList: [CountryGood]
    
    var lst: some View {
        ForEach(self.goodCountryList, id: \.country.name) { item in
            HStack{
                Text(item.country.name).font(.system(size:14)).frame(width: width, alignment: .leading)
                Text(item.child_labor).font(.system(size:14)).frame(width: small_width, alignment: .leading)
                Text(item.forced_labor).font(.system(size:14)).frame(width: small_width, alignment: .leading)
                Text(item.forced_child_labor).font(.system(size:14)).frame(width: small_width, alignment: .leading)
            }
        }
    }
    
    var body: some View {
        VStack {
            List {
                HStack{
                    Text(good).font(.system(size:14, weight: .heavy)).frame(width: width, alignment: .leading)
                    Text("Child labor").font(.system(size:14, weight: .heavy)).frame(width: small_width, alignment: .leading)
                    Text("Forced labor").font(.system(size:14, weight: .heavy)).frame(width: small_width, alignment: .leading)
                    Text("Forced Child labor").font(.system(size:14, weight: .heavy)).frame(width: small_width, alignment: .leading)
                }
                lst
                HStack{
                    Text("Other Countries").font(.system(size:14)).frame(width: width, alignment: .leading)
                    Text("No").font(.system(size:14)).frame(width: small_width, alignment: .leading)
                    Text("No").font(.system(size:14)).frame(width: small_width, alignment: .leading)
                    Text("No").font(.system(size:14)).frame(width: small_width, alignment: .leading)
                }
            }
        }
    }
    
    init(sat: SweatAndToil, good: String) {
        self.good = ProductCountryView.getGoodByKeyword(good: good, goods: sat.get_goods_by_name())
        let cgl  = sat.get_countryGoods_by_good(good: self.good)
        self.goodCountryList = cgl
    }
    
    static func getGoodByKeyword(good: String, goods: [String]) -> String {
        print(good)
        let modifiedGood = good.replacingOccurrences(of: "/", with: " ").replacingOccurrences(of: "-", with: " ").replacingOccurrences(of: ",", with: " ")
        print(modifiedGood)
        var array = modifiedGood.components(separatedBy: " ")
        array.reverse()
        print(array)
        for g in array{
            for gg in goods {
                if gg.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == g.lowercased().trimmingCharacters(in: .whitespacesAndNewlines){
                    print("Found matching: " + gg)
                    return gg
                }
            }
        }
        return ""
    }
}

