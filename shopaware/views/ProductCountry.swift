//
//  ProductCountry.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-06.
//

import SwiftUI

struct ProductCountryView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var width: CGFloat? = 90
    @State private var small_width: CGFloat? = 60
    
    var good: String
    var origin: String
    var goodCountryList: [CountryGood]
    var brand: Brand
    var shoppingList: ListItemStore
    
    var lst: some View {
        ForEach(self.goodCountryList, id: \.country.name) { item in
            HStack{
                Text(item.country.name).font(.system(size:14)).frame(width: width, alignment: .leading)
                Text(item.child_labor).font(.system(size:14)).frame(width: small_width, alignment: .leading)
                Text(item.forced_labor).font(.system(size:14)).frame(width: small_width, alignment: .leading)
                Text(item.forced_child_labor).font(.system(size:14)).frame(width: small_width, alignment: .leading)
                Button("+") {
                    let i = shoppingList.shoppingListItems.firstIndex(where: {$0.itemName.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == good.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)})
                    shoppingList.shoppingListItems[i!].shoppingListItem.setCountryGood(countryGood: item)
                    saveList()
                }
            }.background(self.origin.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == item.country.name.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) ? Color.yellow : Color.white)
        }
    }
    
//    func getColor(country: String) -> View {
//        
//    }
    
    func saveList() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(shoppingList.shoppingListItems) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "shoppingList")
        }
        presentationMode.wrappedValue.dismiss()
    }
    
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
                        Button("+") {
                            let i = shoppingList.shoppingListItems.firstIndex(where: {$0.itemName.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == good.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)})
                            shoppingList.shoppingListItems[i!].shoppingListItem.setCountryGood(countryGood: CountryGood(id: "-1", assessment: Assessment(id: "-1", country: Country(id: "-1", name: "Other Country", region: Region(id: "-1", name: "-1"), num_territories: "-1"), year: "-1", advancement_level: AdvancementLevel(id: "-1", name: "-1"), description: "-1"), year: "-1", country: Country(id: "-1", name: "Other Country", region: Region(id: "-1", name: "-1"), num_territories: "-1"), good: Good(id: "-1", sector: Sector(id: "-1", name: "-1"), name: good), region_name: "-1", child_labor: "No", forced_labor: "No", forced_child_labor: "No"))
                            saveList()
                        }
                    }
                }
            }.tabItem { Label("Countries", systemImage: "globe") }
            if  self.brand.name != "" {
                VStack{
                    List{
                        HStack {
                            VStack {
                                Text("Brand: " + brand.name).font(.system(size:14, weight: .heavy))
                                Text("Rating: " + brand.rating).font(.system(size:14, weight: .heavy))
                                Button("Add to Cart") {
                                    shoppingList.shoppingListItems.append(ListItem(id: String(shoppingList.shoppingListItems.count + 1), itemName: good))
                                    let i = shoppingList.shoppingListItems.firstIndex(where: {$0.itemName.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == good.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)})
                                    shoppingList.shoppingListItems[i!].shoppingListItem.setBrand(brand: brand)
                                    saveList()
                                }
                            }
                            AsyncImage(url: URL(string: brand.image_url)!,
                                       placeholder: { Text("Loading ...") },
                                       image: { Image(uiImage: $0).resizable() })
                                .frame(idealHeight: 200).aspectRatio(contentMode: .fit) // 2:3 aspect ratio
                        }
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
    
    init(sat: SweatAndToil, good: String, origin: String, brand: Brand, shoppingList: ListItemStore) {
        self.good = ProductCountryView.getGoodByKeyword(good: good, goods: sat.get_goods_by_name())
        let cgl  = sat.get_countryGoods_by_good(good: self.good)
        self.goodCountryList = cgl
        self.origin = origin
        self.brand = brand
        self.shoppingList = shoppingList
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

