//
//  ContentView.swift
//  shopaware
//
//  Created by Julyan Baruch on 2021-02-27.
//

import SwiftUI
//import Firebase
import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import SDWebImageSwiftUI
//import Combine
//import MLKitBarcodeScanning
import CarBode
import AVFoundation
import CodeScanner


struct ContentView: View {
    // Shopping list variables
    @ObservedObject var listItemStore = ListItemStore()
    @State var newListItem : String = ""

    // Barcode scanner variables
    @State var barcode_value = ""
    @State var torchIsOn = false
    @State var isShowingProductCountry = false
    
    @State var barcodeItemString = ""
    
    // Show shopping list at startup, use 1 for barcode scanner.
    @State var selection = 0
    
    @State var selectedProduct = false
    @State var product = ""
    
    @State var sweatAndToil: SweatAndToil = SweatAndToil()
    @State var goodsList: [String] = []
    
    func createGoodsList() {
        self.goodsList = []
        for good in sweatAndToil.goods{
            goodsList.append(good.name)
        }
    }
    
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
            TextField("Add a new item", text: self.$newListItem)
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
                                    if self.goodsList.contains(item.itemName){
                                    //if item.itemName == "Tea"{
                                    NavigationLink(destination: ProductCountryView(sat: sweatAndToil, good: item.itemName)) {
                                            HStack{
                                                Text(item.itemName)
                                                Image(systemName: "exclamationmark.triangle.fill")
                                                Text("Tap for more info")
                                                Image(systemName: "arrow.right")
                                            }
                                        }
                                    }
                                        else {
                                            Text(item.itemName)
                                    }
                                }.onMove(perform: self.move)
                                .onDelete(perform: self.delete)
                            }.navigationBarTitle("Shopping list")
                            .navigationBarItems(trailing: EditButton())
                        }
                    }.onAppear{
                        self.createGoodsList()
                    }
                }
                
                else { // Barcode scanner
                    NavigationView{
                        VStack {
                            Button(action: {
                                self.torchIsOn.toggle() //Toggle On/Off
                            }) {
                                HStack{
                                Text("Toggle torch")
                                }
                            }
                            Spacer()
                            CBScanner(
                                supportBarcode: .constant([.ean8, .ean13]), //Set type of barcode you want to scan
                                torchLightIsOn: $torchIsOn, scanInterval: .constant(5.0) // Bind a Bool to enable/disable torch light
                                ){
                                    //When the scanner found a barcode
                                    print("BarCodeType =",$0.type.rawValue, "Value =",$0.value)
                                    barcode_value = $0.value
                                    BarcodeApi.fetchProduct(barcode: barcode_value) { (keywords) in
                                        self.barcodeItemString = keywords
                                        print(self.barcodeItemString)
                                        //self.isShowingProductCountry = true
                                    }
                                    
                                }
                                onDraw: {
                                    //print("Preview View Size = \($0.cameraPreviewView.bounds)")
                                    //print("Barcode Corners = \($0.corners)")
                                    //print(barcode_value)

                                    //line width
                                    let lineWidth = 2

                                    //line color
                                    let lineColor = UIColor.red

                                    //Fill color with opacity
                                    //You also can use UIColor.clear if you don't want to draw fill color
                                    let fillColor = UIColor(red: 0, green: 1, blue: 0.2, alpha: 0.4)

                                    //Draw box
                                    $0.draw(lineWidth: CGFloat(lineWidth), lineColor: lineColor, fillColor: fillColor)
                                }
                        }.navigationBarTitle("Barcode scanner")
                    }
                }
            }
        }.sheet(isPresented: Binding<Bool>(get: { self.barcodeItemString != "" }, set: { _ in }), onDismiss: {
            self.barcodeItemString = ""
        }) {
            ProductCountryView(sat: sweatAndToil, good: self.barcodeItemString)
        }
    }
}


class BarcodeApi {
    static var DOMAIN_URL = "https://world.openfoodfacts.org/api/v0/product/"
    static func fetchProduct(barcode: String, completionHandler: @escaping (String) -> Void) {
        let url = URL(string: DOMAIN_URL + barcode + ".json")!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching product: \(error)")
            return
          }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                if let response = response {
                    print("Error with the response, unexpected status code: \(response) ")
                    return
                } else {
                    print("Error with the response, no status code")
                    return
                }
          }
            do {
                let myJson = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                // Added this to make sure that app doesn't crash when product isn't found.
                // Will use this to display a message to user.
                if myJson ["status_verbose"] as! String == "product not found"{
                    completionHandler("Product not found")
                }
                else{
                let product = myJson["product"] as! NSDictionary
                // stick these together and return
                let product_name = product["product_name"] as? String ?? ""
                let product_name_en = product["product_name_en"] as? String ?? ""
                let product_brands = product["brands"] as? String ?? ""
                let categories_old = product["categories_old"] as? String ?? ""
                let name_en = product["name_en"] as? String ?? ""
                let keywords = product_name + " " + product_name_en + " " + product_brands + " " + categories_old + " " + name_en
                completionHandler(keywords)
                }
                
            } catch {
            }
        })
        task.resume()
    }
}
