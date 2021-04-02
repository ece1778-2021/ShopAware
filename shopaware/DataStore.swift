//
//  DataStore.swift
//  shopaware
//
//  Created by Julyan Baruch on 2021-03-01.
//

import Foundation
import SwiftUI
import Combine

class ListItem: Identifiable, Codable {
    var id = String()
    var itemName = String()
    // Add other features later
    var isChecked = false
    var shoppingListItem = ShoppingListItem()
    
    init(id: String, itemName: String, isChecked: Bool, shoppingListItem: ShoppingListItem) {
        self.id = id
        self.itemName = itemName
        self.isChecked = isChecked
        self.shoppingListItem = shoppingListItem
    }
    
    init(id: String, itemName: String, shoppingListItem: ShoppingListItem) {
        self.id = id
        self.itemName = itemName
        self.shoppingListItem = shoppingListItem
    }
    
    init(id: String, itemName: String) {
        self.id = id
        self.itemName = itemName
    }
}

class ListItemStore : ObservableObject {
    @Published var shoppingListItems = [ListItem]()
}
