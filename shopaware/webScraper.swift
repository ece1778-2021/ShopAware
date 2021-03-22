//
//  webScraper.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-20.
//

import Foundation
import SwiftSoup

class WebScraper {
    
    static let CODE_F_STRING: String = "icon_red.png"
    static let CODE_D_STRING: String = "icon_orange.png"
    static let CODE_C_STRING: String = "icon_yellow.png"
    static let CODE_UNKNOWN_STRING: String = "icon_gray.png"
    static let CODE_B_STRING: String = "icon_ltgreen.png"
    static let CODE_A_STRING: String = "icon_green.png"
    
    static let CODE_F: String = "F"
    static let CODE_D: String = "D"
    static let CODE_C: String = "C"
    static let CODE_UNKNOWN: String = "?"
    static let CODE_B: String = "B"
    static let CODE_A: String = "A"
    
    
    static func getInitiatives(company: String, completionHandler: @escaping ([String], [String], [String], String) -> Void) {
        print("Searching " + company)
        getPage(url: "https://guide.ethical.org.au/guide/browse/companies/") { (doc) in
            do {
                let links = try doc.select("a")
                for link in links{
                    let l = try link.text()
                    if l == company {
                        let linkHref = try link.attr("href")
                        getPage(url: linkHref) {(companyDoc) in
                            do {
                                var praises: [String] = []
                                var criticisms: [String] = []
                                var informations: [String] = []
                                var rating: String = "?"
                                
                                let praise: Element = try companyDoc.getElementsByClass("companyPraise").first()!
                                let praiseElements = praise.children()
                                for p in praiseElements {
                                    if try p.select("table").size() != 0 {
                                        let element = try p.select("a").first()!.text()
                                        praises.append(element)
                                    }
                                }
                                let criticism: Element = try companyDoc.getElementsByClass("companyCriticism").first()!
                                let criticismElements = criticism.children()
                                for c in criticismElements {
                                    if try c.select("table").size() != 0 {
                                        let element = try c.select("a").first()!.text()
                                        criticisms.append(element)
                                    }
                                }
                                let information: Element = try companyDoc.getElementsByClass("companyInformation").first()!
                                let informationElements = information.children()
                                for i in informationElements {
                                    if try i.select("table").size() != 0 {
                                        let element = try i.select("a").first()!.text()
                                        informations.append(element)
                                    }
                                }
                                
                                
                                if companyDoc.description.contains(CODE_F_STRING) {
                                    rating = CODE_F
                                }else if companyDoc.description.contains(CODE_D_STRING) {
                                    rating = CODE_D
                                }else if companyDoc.description.contains(CODE_C_STRING) {
                                    rating = CODE_C
                                }else if companyDoc.description.contains(CODE_B_STRING) {
                                    rating = CODE_B
                                }else if companyDoc.description.contains(CODE_A_STRING) {
                                    rating = CODE_A
                                }else {
                                    rating = CODE_UNKNOWN
                                }
                                
                                completionHandler(praises, criticisms, informations, rating)
                            }catch {}
                        }
                    }
                }
            } catch {}
        }
        
        

    }
    
    
    static func getPage(url: String, completionHandler: @escaping (Document) -> Void) {

        let url = URL(string: url)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            let d = String(decoding: data ?? Data(), as: UTF8.self)
            do {
                let doc: Document = try SwiftSoup.parseBodyFragment(d)
                completionHandler(doc)
            }catch {}
        })
        task.resume()
    }
}
