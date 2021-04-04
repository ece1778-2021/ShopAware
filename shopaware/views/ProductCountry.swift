//
//  ProductCountry.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-06.
//

import SwiftUI

struct ProductCountryView: View {
    @Binding var barcodeString: String
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var width: CGFloat? = 90
    @State private var small_width: CGFloat? = 60
    
    @State var selection = 0
    @State var praise = "Praises"
    @State var critisims = "Critisims"
    @State var information = "Facts"
    
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
    func getColor(rating: String) -> Color {
        if rating == "A" || rating == "B" {
            return Color.green
        } else if rating == "C" {
            return Color.yellow
        } else if rating == "D" {
            return Color.orange
        }else if rating == "F" {
            return Color.red
        }else {
            return Color.gray
        }
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
                            print(good)
                            print(shoppingList.shoppingListItems)
                            let i = shoppingList.shoppingListItems.firstIndex(where: {$0.itemName == good})
                            shoppingList.shoppingListItems[i!].shoppingListItem.setCountryGood(countryGood: CountryGood(id: "-1", assessment: Assessment(id: "-1", country: Country(id: "-1", name: "Other Country", region: Region(id: "-1", name: "-1"), num_territories: "-1"), year: "-1", advancement_level: AdvancementLevel(id: "-1", name: "-1"), description: "-1"), year: "-1", country: Country(id: "-1", name: "Other Country", region: Region(id: "-1", name: "-1"), num_territories: "-1"), good: Good(id: "-1", sector: Sector(id: "-1", name: "-1"), name: good), region_name: "-1", child_labor: "No", forced_labor: "No", forced_child_labor: "No"))
                            saveList()
                        }
                    }
                }
            }.tabItem { Label("Countries", systemImage: "globe") }
            if  self.brand.name != "" {
                VStack{
                    HStack {
                        VStack(alignment: .center){
                            Spacer()
                            Text(brand.name).font(.system(size:36, weight: .heavy)).frame(alignment: .center)
                            HStack {
                                Text("Rating: ").font(.system(size:24, weight: .heavy))
                                Text(brand.rating).font(.system(size:24, weight: .heavy)).foregroundColor(getColor(rating: brand.rating))
                            }.frame(alignment: .center)
                            Spacer()
                            Button {
                                print("tapped")
                                let x = shoppingList.shoppingListItems.firstIndex(where: {$0.itemName.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == good.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)})
                                print("found x")
                                if x == nil  {
                                    print("not found")
                                    shoppingList.shoppingListItems.append(ListItem(id: String(shoppingList.shoppingListItems.count + 1), itemName: good))
                                }else {
                                    print("found")
                                }
                                print("finding element")
                                let i = shoppingList.shoppingListItems.firstIndex(where: {$0.itemName.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) == good.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)})
                                shoppingList.shoppingListItems[i!].shoppingListItem.setBrand(brand: brand)
                                print("before saving")
                                saveList()
                                print("after saving")
                                barcodeString = ""
                                print("Done")
                            } label: {
                                Text("Add to Cart")
                            }.contentShape(Rectangle())
                            .frame(alignment: .center)
                        }.frame(minWidth: 0,
                                maxWidth: .infinity,
                                minHeight: 0,
                                maxHeight: .infinity,
                                alignment: .center
                        )
                        AsyncImage(url: URL(string: brand.image_url)!,
                                   placeholder: { Text("Loading ...") },
                                   image: { Image(uiImage: $0).resizable() })
                            .frame(minWidth: 80, idealWidth: 160, maxWidth: 200, minHeight: 120, idealHeight: 200, maxHeight: 280, alignment: .center).aspectRatio(0.66, contentMode: .fit)
                    }
                    Picker("Please choose a color", selection: $selection) {
                        Text(self.praise + " (" + self.brand.praises.count.description + ")").font(.system(size:10)).tag(0)
                        Text(self.critisims + " (" + self.brand.critisims.count.description + ")").font(.system(size:10)).tag(1)
                        Text(self.information + " (" + self.brand.information.count.description + ")").font(.system(size:10)).tag(2)
                    }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
                    List{
                        if selection == 0 {
                            ForEach(self.brand.praises, id: \.self) { praise in
                                Text(praise).font(.system(size:14))
                            }
                        }else if selection == 1 {
                            ForEach(self.brand.critisims, id: \.self) { critisim in
                                Text(critisim).font(.system(size:14))
                            }
                        } else {
                            ForEach(self.brand.information, id: \.self) { info in
                                Text(info).font(.system(size:14))
                            }
                        }
                        
                    }.frame(maxWidth: 300)
                }.tabItem { Label("Brand", systemImage: "tag") }
            }
            
        }
    }
    
    init(sat: SweatAndToil, good: String, origin: String, brand: Brand, shoppingList: ListItemStore, barcodeString: Binding<String>) {
        self._barcodeString = barcodeString
        self.good = ProductCountryView.getGoodByKeyword(good: good, goods: sat.get_goods_by_name())
        let cgl  = sat.get_countryGoods_by_good(good: self.good)
        self.goodCountryList = cgl
        self.origin = origin
        self.brand = brand
        self.shoppingList = shoppingList
//        self.praise = self.praise + " (" + self.brand.praises.count.description + ")"
//        self.critisims = self.critisims + " (" + self.brand.critisims.count.description + ")"
//        self.information = self.information + " (" + self.brand.information.count.description + ")"
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

