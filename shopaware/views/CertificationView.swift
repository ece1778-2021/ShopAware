//
//  CertificationView.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-21.
//

import SwiftUI

struct CertificationView: View {
    
    var certification: Certification
    
    var title: some View {
        HStack{
            Image(certification.current_seal)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 72.0)
            Spacer()
            Text(certification.name).font(.system(size:16, weight: .heavy))
            
        }
    }
    
    var objectivesList: some View {
        ForEach(self.certification.objectives, id: \.self) { item in
            VStack(alignment: .leading){
                if item.title != "" {
                    Text(item.title).font(.system(size:14, weight: .heavy))
                }
                if item.body != "" {
                    Text(item.body).font(.system(size:14))
                }
                if item.link.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                    Link("Source", destination: URL(string: item.link.trimmingCharacters(in: .whitespacesAndNewlines))!).font(.system(size: 12)).foregroundColor(Color.blue)
                }
                Text("")
            }
        }
    }
    var benefitsList: some View {
        ForEach(self.certification.benefits, id: \.self) { item in
            VStack(alignment: .leading){
                if item.title != "" {
                    Text(item.title).font(.system(size:14, weight: .heavy))
                }
                if item.body != "" {
                    Text(item.body).font(.system(size:14))
                }
                if item.link.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                    Link("Source", destination: URL(string: item.link.trimmingCharacters(in: .whitespacesAndNewlines))!).font(.system(size: 12)).foregroundColor(Color.blue)
                }
                Text("")
            }
        }
    }
    var critisimsList: some View {
        ForEach(self.certification.critisims, id: \.self) { item in
            VStack(alignment: .leading){
                if item.title != "" {
                    Text(item.title).font(.system(size:14, weight: .heavy))
                }
                if item.body != "" {
                    Text(item.body).font(.system(size:14))
                }
                if item.link.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                    Link("Source", destination: URL(string: item.link.trimmingCharacters(in: .whitespacesAndNewlines))!).font(.system(size: 12)).foregroundColor(Color.blue)
                }
                Text("")
            }
        }
    }
    var updatesList: some View {
        ForEach(self.certification.updates, id: \.self) { item in
            VStack(alignment: .leading){
                if item.title != "" {
                    Text(item.title).font(.system(size:14, weight: .heavy))
                }
                if item.body != "" {
                    Text(item.body).font(.system(size:14))
                }
                if item.link.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                    Link("Source", destination: URL(string: item.link.trimmingCharacters(in: .whitespacesAndNewlines))!).font(.system(size: 12)).foregroundColor(Color.blue)
                }
                Text("")
            }
        }
    }
    
    var body: some View {
        VStack {
            self.title
            List {
                Text("Objectives").font(.system(size:14, weight: .heavy))
                VStack{
                    self.objectivesList
                }
                Text("Benefits").font(.system(size:14, weight: .heavy))
                VStack{
                    self.benefitsList
                }
                Text("Critisims").font(.system(size:14, weight: .heavy))
                VStack{
                    self.critisimsList
                }
                Text("Updates").font(.system(size:14, weight: .heavy))
                VStack{
                    self.updatesList
                }
            }
        }
    }
    
    init(certification: Certification) {
        self.certification = certification
        
    }
}
