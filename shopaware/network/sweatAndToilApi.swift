//
//  sweatAndToil.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

class SweatAndToilAPI {    
    static var TOKEN = "d75e5b99-5807-49a1-a7b0-b22aa56fab5f"
    static var DOMAIN_URL = "https://data.dol.gov/get/"
    
    static func fetchRegions(completionHandler: @escaping ([RegionAPI]) -> Void) {
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
            let regions: [RegionAPI] = try? JSONDecoder().decode([RegionAPI].self, from: data) {
            completionHandler(regions)
          }
        })
        task.resume()
    }
    
    static func fetchCountries(completionHandler: @escaping ([CountryAPI]) -> Void) {
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
            let countries: [CountryAPI] = try? JSONDecoder().decode([CountryAPI].self, from: data) {
            completionHandler(countries)
          }
        })
        task.resume()
    }
    
    static func fetchTerritories(completionHandler: @escaping ([TerritoryAPI]) -> Void) {
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
            let territories: [TerritoryAPI] = try? JSONDecoder().decode([TerritoryAPI].self, from: data) {
            completionHandler(territories)
          }
        })
        task.resume()
    }
    
    static func fetchAdvancementLevels(completionHandler: @escaping ([AdvancementLevelAPI]) -> Void) {
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
            let advancementLevels: [AdvancementLevelAPI] = try? JSONDecoder().decode([AdvancementLevelAPI].self, from: data) {
            completionHandler(advancementLevels)
          }
        })
        task.resume()
    }
    
    static func fetchAssessments(completionHandler: @escaping ([AssessmentAPI]) -> Void) {
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
            let assessments: [AssessmentAPI] = try? JSONDecoder().decode([AssessmentAPI].self, from: data) {
            completionHandler(assessments)
          }
        })
        task.resume()
    }
    
    static func fetchSectors(completionHandler: @escaping ([SectorAPI]) -> Void) {
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
            let sectors: [SectorAPI] = try? JSONDecoder().decode([SectorAPI].self, from: data) {
            completionHandler(sectors)
          }
        })
        task.resume()
    }
    
    static func fetchGoods(completionHandler: @escaping ([GoodAPI]) -> Void) {
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
            let goods: [GoodAPI] = try? JSONDecoder().decode([GoodAPI].self, from: data) {
            completionHandler(goods)
          }
        })
        task.resume()
    }
    
    static func fetchCountryGoods(completionHandler: @escaping ([CountryGoodAPI]) -> Void) {
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
            let countryGoods: [CountryGoodAPI] = try? JSONDecoder().decode([CountryGoodAPI].self, from: data) {
            completionHandler(countryGoods)
          } else {
            print("No Data")
          }
        })
        print("Starting task")
        task.resume()
        print("Ending function")
    }
    
    static func fetchSuggestedActions(completionHandler: @escaping ([SuggestedActionAPI]) -> Void) {
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
            let suggestedActions: [SuggestedActionAPI] = try? JSONDecoder().decode([SuggestedActionAPI].self, from: data) {
            completionHandler(suggestedActions)
          }
        })
        task.resume()
    }
    
    static func fetchLegalStandards(completionHandler: @escaping ([LegalStandardAPI]) -> Void) {
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
            let legalStandards: [LegalStandardAPI] = try? JSONDecoder().decode([LegalStandardAPI].self, from: data) {
            completionHandler(legalStandards)
          }
        })
        task.resume()
    }
    
    static func fetchEnforcements(completionHandler: @escaping ([EnforcementAPI]) -> Void) {
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
            let enforcements: [EnforcementAPI] = try? JSONDecoder().decode([EnforcementAPI].self, from: data) {
            completionHandler(enforcements)
          }
        })
        task.resume()
    }
    
    static func fetchMechanisms(completionHandler: @escaping ([MechanismAPI]) -> Void) {
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
            let mechanisms: [MechanismAPI] = try? JSONDecoder().decode([MechanismAPI].self, from: data) {
            completionHandler(mechanisms)
          }
        })
        task.resume()
    }
    
    static func generateURL(url: String, ext: String, token: String, limit: String) -> String {
        return url + ext + "/limit/" + limit + "?X-API-KEY=" + token
    }
}
