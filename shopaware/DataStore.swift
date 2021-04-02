//
//  DataStore.swift
//  shopaware
//
//  Created by Julyan Baruch on 2021-03-01.
//

import Foundation
import SwiftUI
import Combine

class ListItem: Identifiable, Codable, Equatable {
    static func == (lhs: ListItem, rhs: ListItem) -> Bool {
        return lhs.itemName == rhs.itemName
    }
    
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

class ListItemStore : ObservableObject, Identifiable, Codable, Equatable {
    static func == (lhs: ListItemStore, rhs: ListItemStore) -> Bool {
        return lhs.shoppingListItems == rhs.shoppingListItems
    }
    
    var id: String? = UUID().uuidString
    @Published var shoppingListItems = [ListItem]()
    
    init() {
        
    }
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case id = "Id"
        case shoppingListItems = "ShoppingListItems"
      }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let response = try container.nestedContainer(keyedBy:
        CodingKeys.self, forKey: .response)
        self.id = try response.decode(String.self, forKey: .id)
        self.shoppingListItems = try response.decode([ListItem].self, forKey: .shoppingListItems)
      }

      func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var response = container.nestedContainer(keyedBy: CodingKeys.self, forKey: .response)
        try response.encode(self.id, forKey: .id)
        try response.encode(self.shoppingListItems, forKey: .shoppingListItems)
       }
    
}
