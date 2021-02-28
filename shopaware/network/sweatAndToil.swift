//
//  sweatAndToil.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-02-28.
//

import Foundation

class SweatAndToil {    
    static var token = "d75e5b99-5807-49a1-a7b0-b22aa56fab5f"
    static var domainUrlString = "https://data.dol.gov/get/"

    static func fetchCountries(completionHandler: @escaping ([Country]) -> Void) {
        let url = URL(string: domainUrlString + "SweatToilAllCountries" + "?X-API-KEY=" + token + "&limit=5")!
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
}
