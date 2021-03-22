//
//  InformationView.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-21.
//

import SwiftUI

struct InformationView: View {
    var certifications: [Certification]
    var faqs: [FAQ]
    var brands: [BrandHardcode]
    
    var body: some View {
        TabView {
            VStack {
                Text("Certifications").font(.system(size:18, weight: .heavy))
                List {
                    ForEach(self.certifications, id: \.name) { item in
                        NavigationLink(destination: CertificationView(certification: item)) {
                            HStack{
                                Image(item.current_seal)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 72.0)
                                Spacer()
                                Text(item.name).font(.system(size:12, weight: .heavy))
                                
                            }
                            
                        }
                    }
                }
            }.tabItem { Label("Certifications", systemImage: "checkmark.seal") }
            
            VStack {
                Text("Brands").font(.system(size:18, weight: .heavy))
                List {
                    ForEach(self.brands, id: \.name) { item in
                        NavigationLink(destination: BrandView(brand: item)) {
                            HStack{
                                Image(item.logo)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 72.0)
                                Spacer()
                                Text(item.name).font(.system(size:12, weight: .heavy))
                                
                            }
                            
                        }
                    }
                }
            }.tabItem { Label("Brands", systemImage: "tag") }
            
            VStack {
                Text("Frequently Asked Questions").font(.system(size:18, weight: .heavy))
                List {
                    ForEach(self.faqs, id: \.self) { item in
                        VStack (alignment: .leading){
                            Text(item.question).font(.system(size:12, weight: .heavy))
                            Text(item.answer).font(.system(size:12))
                        }
                    }
                }
            }.tabItem { Label("FAQ", systemImage: "info.circle") }
        }
    }
    
    init() {
        self.certifications = []
        self.faqs = []
        self.brands = []
        if let path = Bundle.main.path(forResource: "certifications", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                self.certifications = try JSONDecoder().decode([Certification].self, from: data)
              } catch {
                   // handle error
              }
        }else {
            print("path not found")
        }
        
        if let path = Bundle.main.path(forResource: "faq", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                self.faqs = try JSONDecoder().decode([FAQ].self, from: data)
              } catch {
                   // handle error
              }
        }else {
            print("path not found")
        }
        
        if let path = Bundle.main.path(forResource: "brands", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                self.brands = try JSONDecoder().decode([BrandHardcode].self, from: data)
              } catch {
                   // handle error
              }
        }else {
            print("path not found")
        }
    }
    
}




