//
//  BrandView.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-21.
//

import SwiftUI

struct BrandView: View {
    
    var brand: BrandHardcode
    var brands = ""
    
    var title: some View {
        HStack{
            Image(brand.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 72.0).padding()
            Spacer()
            Text(brand.name).font(.system(size:16, weight: .heavy)).padding()
            
        }
    }
    
    var body: some View {
        VStack {
            self.title
            List {
                Text("Rating: " + brand.ranking).font(.system(size: 12, weight: .heavy))
                Text("Sub-brands").font(.system(size: 12, weight: .heavy))
                Text(brands).font(.system(size: 12))
                Text("Lawsuits").font(.system(size: 12, weight: .heavy))
                ForEach(self.brand.lawsuits, id: \.name) { item in
                    if(item.link.trimmingCharacters(in: .whitespacesAndNewlines) != "") {
                        Link(item.name, destination: URL(string: item.link.trimmingCharacters(in: .whitespacesAndNewlines))!).font(.system(size: 12)).foregroundColor(Color.blue)
                    }
                }
                Text("Initiatives").font(.system(size: 12, weight: .heavy))
                ForEach(self.brand.initiatives, id: \.self) { item in
                    Text(item).font(.system(size: 12))
                }
                
            }
        }
    }
    
    init(brand: BrandHardcode) {
        self.brand = brand
        var x = false
        for b in brand.brands {
            if x {
                self.brands = self.brands +  ", " + b
            }else {
                x = true
                self.brands = self.brands + b
            }
            
        }
        
    }
}
