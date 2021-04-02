//
//  SavedItemsView.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-04-02.
//

import SwiftUI

class ShoppingListList: ObservableObject {
    @Published var shoppingList: [ListItemStore]
    init() {
        shoppingList = []
    }
    init(shoppingList: [ListItemStore]) {
        self.shoppingList = shoppingList
    }
}

struct SavedItemsView : View {
    let defaults = UserDefaults.standard
    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var shoppingListList: ShoppingListList = ShoppingListList()
//    @StateObject var shoppingList: [ListItemStore]
    var currentShoppingList: ListItemStore
    
    func getShoppingList(list :[ListItem]) -> some View {
        return VStack {
            ForEach(list, id: \.id) { item in
                HStack {
                    Text(item.itemName)
                    Spacer()
                    if let shoppingListBrand = item.shoppingListItem.brand {
                        Text(shoppingListBrand.name);
                        Text(item.shoppingListItem.getRank()).font(.system(size:14, weight: .heavy))
                    }
                    if let shoppingListCountryGood = item.shoppingListItem.countryGood {
                        Text(shoppingListCountryGood.country.name);
                        Text(item.shoppingListItem.getRank()).font(.system(size:14, weight: .heavy))
                    }
                }
            }
        }.onTapGesture {
            
        }
    }
    
    func saveShoppingList() {

        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self.shoppingListList.shoppingList) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedShoppingList")
        }
    }
    
    var body: some View {
//        TabView {
            VStack {
                Text("Shopping Lists").font(.system(size:18, weight: .heavy))
                List {
                    ForEach(self.shoppingListList.shoppingList) { item in
                        getShoppingList(list: item.shoppingListItems)
                        HStack {
                            Button(action: {}) {
                                Text("Delete List")
                            }.frame(minWidth: 0).onTapGesture {
                                if let index = self.shoppingListList.shoppingList.firstIndex(of: item) {
                                    self.shoppingListList.shoppingList.remove(at: index)
                                }
                                saveShoppingList()
                            }
                            Spacer()
                            Button(action: {}) {
                                Text("Load List")
                            }.frame(minWidth: 0).onTapGesture {
                                self.currentShoppingList.shoppingListItems = item.shoppingListItems
                                presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                }
                
                
            }.tabItem { Label("Shopping Lists", systemImage: "doc") }
            
//            VStack {
//                Text("Products").font(.system(size:18, weight: .heavy))
//
//            }.tabItem { Label("Products", systemImage: "tag") }
//        }
    }
    
    init(currentShoppingList: ListItemStore) {
        self.currentShoppingList = currentShoppingList
            
        if let savedList = defaults.object(forKey: "SavedShoppingList") as? Data {
            let decoder = JSONDecoder()
            if let list = try? decoder.decode([ListItemStore].self, from: savedList) {
                self.shoppingListList.shoppingList = list
            }else {
                self.shoppingListList.shoppingList = []
            }
        }else {
            self.shoppingListList.shoppingList = []
        }
        
        
    }
    
}



