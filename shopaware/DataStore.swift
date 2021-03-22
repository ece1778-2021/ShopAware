//
//  DataStore.swift
//  shopaware
//
//  Created by Julyan Baruch on 2021-03-01.
//

import Foundation
import SwiftUI
import Combine

struct ListItem: Identifiable {
    var id = String()
    var itemName = String()
    // Add other features later
    var isChecked = false
}

class ListItemStore : ObservableObject {
    @Published var shoppingListItems = [ListItem]()
}
