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

    @ObservedObject static var shoppingListList: ShoppingListList = ShoppingListList()
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
        }
    }
    
    func saveShoppingList() {

        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(SavedItemsView.shoppingListList.shoppingList) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "SavedShoppingList")
        }
    }
    
    
    
    var body: some View {
//        TabView {
            VStack {
                Text("Shopping Lists").font(.system(size:18, weight: .heavy))
                List {
                    ForEach(SavedItemsView.shoppingListList.shoppingList) { item in
                        HStack {
                        getShoppingList(list: item.shoppingListItems)
                            Button(action: {}) {
                                Text("Delete").foregroundColor(.red)
                            }.frame(minWidth: 0).onTapGesture {
                                if let index = SavedItemsView.shoppingListList.shoppingList.firstIndex(of: item) {
                                    SavedItemsView.shoppingListList.objectWillChange.send()
                                    SavedItemsView.shoppingListList.shoppingList[index].objectWillChange.send()
                                    SavedItemsView.shoppingListList.shoppingList.remove(at: index)
                                }
                                saveShoppingList()
                                presentationMode.wrappedValue.dismiss()
                                
                            }.padding()
                            Spacer()
                            Button(action: {}) {
                                Text("Load").foregroundColor(.blue)
                            }.frame(minWidth: 0).onTapGesture {
                                self.currentShoppingList.shoppingListItems = item.shoppingListItems
                                presentationMode.wrappedValue.dismiss()
                            }.padding()
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
                SavedItemsView.shoppingListList.shoppingList = list
            }else {
                SavedItemsView.shoppingListList.shoppingList = []
            }
        }else {
            SavedItemsView.shoppingListList.shoppingList = []
        }
    }
    
    static func reloadData() -> Void {
        let defaults = UserDefaults.standard
        if let savedList = defaults.object(forKey: "SavedShoppingList") as? Data {
            let decoder = JSONDecoder()
            if let list = try? decoder.decode([ListItemStore].self, from: savedList) {
                SavedItemsView.shoppingListList.shoppingList = list
            }else {
                SavedItemsView.shoppingListList.shoppingList = []
            }
        }else {
            SavedItemsView.shoppingListList.shoppingList = []
        }
    }
    
}




