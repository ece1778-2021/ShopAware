//
//  barcodeApi.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-05.
//

import Foundation

class BarcodeApi {
    static var DOMAIN_URL = "https://world.openfoodfacts.org/api/v0/product/"
    
    static func fetchProduct(barcode: String, completionHandler: @escaping (String, String) -> Void) {
        let url = URL(string: DOMAIN_URL + barcode + ".json")!
        
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

            do {
                let myJson = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                let product = myJson["product"] as! NSDictionary
                completionHandler(product["product_name_en"] as! String, product["brands"] as! String)
            } catch {
            }
        })
        task.resume()
    }
}
