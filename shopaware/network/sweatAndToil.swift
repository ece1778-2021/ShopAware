//
//  sweatAndToil.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

class SweatAndToil {    
    static var TOKEN = "d75e5b99-5807-49a1-a7b0-b22aa56fab5f"
    static var DOMAIN_URL = "https://data.dol.gov/get/"
    
    static func fetchRegions(completionHandler: @escaping ([Region]) -> Void) {
        let ext = "SweatToilAllRegions"
        let url = URL(string: generateURL(url: DOMAIN_URL, ext: ext, token: TOKEN, limit: "200"))!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
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

          if let data = data,
            let regions: [Region] = try? JSONDecoder().decode([Region].self, from: data) {
            completionHandler(regions)
          }
        })
        task.resume()
    }
    
    static func fetchCountries(completionHandler: @escaping ([Country]) -> Void) {
        let ext = "SweatToilAllCountries"
        let url = URL(string: generateURL(url: DOMAIN_URL, ext: ext, token: TOKEN, limit: "200"))!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
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

          if let data = data,
            let countries: [Country] = try? JSONDecoder().decode([Country].self, from: data) {
            completionHandler(countries)
          }
        })
        task.resume()
    }
    
    static func fetchTerritories(completionHandler: @escaping ([Territory]) -> Void) {
        let ext = "SweatToilAllTerritories"
        let url = URL(string: generateURL(url: DOMAIN_URL, ext: ext, token: TOKEN, limit: "200"))!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
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

          if let data = data,
            let territories: [Territory] = try? JSONDecoder().decode([Territory].self, from: data) {
            completionHandler(territories)
          }
        })
        task.resume()
    }
    
    static func fetchAdvancementLevels(completionHandler: @escaping ([AdvancementLevel]) -> Void) {
        let ext = "SweatToilAllAdvancementLevels"
        let url = URL(string: generateURL(url: DOMAIN_URL, ext: ext, token: TOKEN, limit: "200"))!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
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

          if let data = data,
            let advancementLevels: [AdvancementLevel] = try? JSONDecoder().decode([AdvancementLevel].self, from: data) {
            completionHandler(advancementLevels)
          }
        })
        task.resume()
    }
    
    static func fetchAssessments(completionHandler: @escaping ([Assessment]) -> Void) {
        let ext = "SweatToilAllAssessments"
        let url = URL(string: generateURL(url: DOMAIN_URL, ext: ext, token: TOKEN, limit: "200"))!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
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

          if let data = data,
            let assessments: [Assessment] = try? JSONDecoder().decode([Assessment].self, from: data) {
            completionHandler(assessments)
          }
        })
        task.resume()
    }
    
    static func fetchSectors(completionHandler: @escaping ([Sector]) -> Void) {
        let ext = "SweatToilAllSectors"
        let url = URL(string: generateURL(url: DOMAIN_URL, ext: ext, token: TOKEN, limit: "200"))!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
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

          if let data = data,
            let sectors: [Sector] = try? JSONDecoder().decode([Sector].self, from: data) {
            completionHandler(sectors)
          }
        })
        task.resume()
    }
    
    static func fetchGoods(completionHandler: @escaping ([Good]) -> Void) {
        let ext = "SweatToilAllGoods"
        let url = URL(string: generateURL(url: DOMAIN_URL, ext: ext, token: TOKEN, limit: "200"))!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
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

          if let data = data,
            let goods: [Good] = try? JSONDecoder().decode([Good].self, from: data) {
            completionHandler(goods)
          }
        })
        task.resume()
    }
    
    static func fetchCountryGoods(completionHandler: @escaping ([CountryGood]) -> Void) {
        let ext = "SweatToilAllCountryGoods"
        let url = URL(string: generateURL(url: DOMAIN_URL, ext: ext, token: TOKEN, limit: "200"))!
        print(url.absoluteURL)
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForResource = 120
        config.timeoutIntervalForRequest = 120
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
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

          if let data = data,
            let countryGoods: [CountryGood] = try? JSONDecoder().decode([CountryGood].self, from: data) {
            completionHandler(countryGoods)
          } else {
            print("No Data")
          }
        })
        print("Starting task")
        task.resume()
        print("Ending function")
    }
    
    static func fetchSuggestedActions(completionHandler: @escaping ([SuggestedAction]) -> Void) {
        let ext = "SweatToilAllSuggestedActions"
        let url = URL(string: generateURL(url: DOMAIN_URL, ext: ext, token: TOKEN, limit: "200"))!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
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

          if let data = data,
            let suggestedActions: [SuggestedAction] = try? JSONDecoder().decode([SuggestedAction].self, from: data) {
            completionHandler(suggestedActions)
          }
        })
        task.resume()
    }
    
    static func fetchLegalStandards(completionHandler: @escaping ([LegalStandard]) -> Void) {
        let ext = "SweatToilAllLegalStandards"
        let url = URL(string: generateURL(url: DOMAIN_URL, ext: ext, token: TOKEN, limit: "200"))!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
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

          if let data = data,
            let legalStandards: [LegalStandard] = try? JSONDecoder().decode([LegalStandard].self, from: data) {
            completionHandler(legalStandards)
          }
        })
        task.resume()
    }
    
    static func fetchEnforcements(completionHandler: @escaping ([Enforcement]) -> Void) {
        let ext = "SweatToilAllEnforcements"
        let url = URL(string: generateURL(url: DOMAIN_URL, ext: ext, token: TOKEN, limit: "200"))!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
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

          if let data = data,
            let enforcements: [Enforcement] = try? JSONDecoder().decode([Enforcement].self, from: data) {
            completionHandler(enforcements)
          }
        })
        task.resume()
    }
    
    static func fetchMechanisms(completionHandler: @escaping ([Mechanism]) -> Void) {
        let ext = "SweatToilMechanisms"
        let url = URL(string: generateURL(url: DOMAIN_URL, ext: ext, token: TOKEN, limit: "200"))!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
          if let error = error {
            print("Error with fetching films: \(error)")
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

          if let data = data,
            let mechanisms: [Mechanism] = try? JSONDecoder().decode([Mechanism].self, from: data) {
            completionHandler(mechanisms)
          }
        })
        task.resume()
    }
    
    static func generateURL(url: String, ext: String, token: String, limit: String) -> String {
        return url + ext + "/limit/" + limit + "?X-API-KEY=" + token
    }
}
