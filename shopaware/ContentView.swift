//
//  ContentView.swift
//  shopaware
//
//  Created by Julyan Baruch on 2021-02-27.
//

import SwiftUI
import Firebase
import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import SDWebImageSwiftUI
import Combine
import MLKitBarcodeScanning

struct ContentView: View {
    // Shopping list variables
    @ObservedObject var listItemStore = ListItemStore()
    @ State var newListItem : String = ""

    // Barcode scanner variables
    
    // Show shopping list at startup, use 1 for barcode scanner.
    @State var selection = 0

    
    func addNewListItem() {
        listItemStore.shoppingListItems.append(ListItem(id: String(listItemStore.shoppingListItems.count + 1), itemName: newListItem))
        self.newListItem = ""
    }
    
    
    func move(from source: IndexSet, to destination: Int){
        listItemStore.shoppingListItems.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets: IndexSet) {
        listItemStore.shoppingListItems.remove(atOffsets: offsets)
    }
    
    var searchBar : some View {
        HStack {
            TextField("Enter a new item", text: self.$newListItem)
            Button(action: self.addNewListItem, label: {Text("Add")})
        }
    }
    
    var body: some View {
        ZStack{
            VStack {
                VStack(spacing: 4){
                    HStack(spacing: 0){
                        Text("Shop")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(.purple)
                        Text("Aware")
                            .font(.system(size: 35, weight: .heavy))
                            .foregroundColor(.orange)
                    }
                }.padding(.top)
                Picker("", selection: $selection) {
                    Image(systemName: "cart.fill").tag(0)
                    Image(systemName: "barcode.viewfinder").tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
                
                if selection == 0 { // Shopping list
                    NavigationView{
                        VStack {
                            searchBar.padding()
                            List {
                                ForEach(self.listItemStore.shoppingListItems) {
                                    item in
                                    Text(item.itemName)
                                }.onMove(perform: self.move)
                                .onDelete(perform: self.delete)
                            }.navigationBarTitle("Shopping list")
                            .navigationBarItems(trailing: EditButton())
                        }
                    }
                }
                
                else { // Barcode scanner
                    NavigationView{
                        VStack {
                            Button(action: {}) {
                                Text("Scan a product")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.orange)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width-30)
                                    .background(Color.gray)
                                    .clipShape(Capsule())
                            }.padding(.top, 22)
                        }
                    }
                }
            }
        }
    }
}


