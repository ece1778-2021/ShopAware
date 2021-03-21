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
    var origin: String
    var goodCountryList: [CountryGood]
    var brand: Brand
    
    var lst: some View {
        ForEach(self.goodCountryList, id: \.country.name) { item in
            HStack{
                Text(item.country.name).font(.system(size:14)).frame(width: width, alignment: .leading)
                Text(item.child_labor).font(.system(size:14)).frame(width: small_width, alignment: .leading)
                Text(item.forced_labor).font(.system(size:14)).frame(width: small_width, alignment: .leading)
                Text(item.forced_child_labor).font(.system(size:14)).frame(width: small_width, alignment: .leading)
            }.background(self.origin.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == item.country.name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) ? Color.yellow : Color.white)
        }
    }
    
//    func getColor(country: String) -> View {
//        
//    }
    
    var body: some View {
        TabView {
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
            }.tabItem { Label("Countries", systemImage: "globe") }
            if  self.brand.name != "" {
                VStack{
                    List{
                        Text("Brand: " + brand.name).font(.system(size:14, weight: .heavy))
                        Text("Rating: " + brand.rating).font(.system(size:14, weight: .heavy))
                        Text("Praises").font(.system(size:14, weight: .heavy))
                        ForEach(self.brand.praises, id: \.self) { praise in
                            Text(praise).font(.system(size:14))
                        }
                        Text("Critisims").font(.system(size:14, weight: .heavy))
                        ForEach(self.brand.critisims, id: \.self) { critisim in
                            Text(critisim).font(.system(size:14))
                        }
                        Text("Information").font(.system(size:14, weight: .heavy))
                        ForEach(self.brand.information, id: \.self) { info in
                            Text(info).font(.system(size:14))
                        }
                    }
                }.tabItem { Label("Brand", systemImage: "tag") }
            }
            
        }
    }
    
    init(sat: SweatAndToil, good: String, origin: String, brand: Brand) {
        self.good = ProductCountryView.getGoodByKeyword(good: good, goods: sat.get_goods_by_name())
        let cgl  = sat.get_countryGoods_by_good(good: self.good)
        self.goodCountryList = cgl
        self.origin = origin
        self.brand = brand
        print(brand.name)
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

