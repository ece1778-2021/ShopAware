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

struct ContentView: View {
    @State var selection = 0
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
                Button {
                    SweatAndToil.fetchCountries { (countries) in
                        if countries.count != 0 {
                            print(countries)
                        }else {
                            print("Nothing returned")
                        }
                    }
                } label : {
                    Text("Call API")
                }
                
                Picker("", selection: $selection) {
                    Image(systemName: "cart.fill").tag(0)
                    Image(systemName: "barcode.viewfinder").tag(1)
                }.pickerStyle(SegmentedPickerStyle()).padding(.horizontal)
                
                if selection == 0 {
                    Button(action: {}) {
                        Text("Add a product")
                            .fontWeight(.bold)
                            .foregroundColor(Color.orange)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width-30)
                            .background(Color.gray)
                            .clipShape(Capsule())
                    }.padding(.top, 22)
                }
                else {
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
