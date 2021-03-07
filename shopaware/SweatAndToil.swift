//
//  SweatAndToil.swift
//  shopaware
//
//  Created by Salaar Liaqat on 2021-03-01.
//

import Foundation

class SweatAndToil {
    var regions: [Region] = []
    var countries: [Country] = []
    var territories: [Territory] = []
    var advancementLevels: [AdvancementLevel] = []
    var assessments: [Assessment] = []
    var sectors: [Sector] = []
    var goods: [Good] = []
    var countryGoods: [CountryGood] = []
    
    func get_assessments_by_country(country: String) -> [Assessment] {
        return assessments.filter{$0.country.name == country}
    }
    
    func get_countryGoods_by_good(good: String) -> [CountryGood] {
        return countryGoods.filter{$0.good.name == good}
        
    }
    
    func get_goods_by_name() -> [String] {
        return goods.map{ $0.name }
    }
    
    init() {
        let empty_region = Region(id: "-1", name: "?")
        let empty_country = Country(id: "-1", name: "?", region: empty_region, num_territories: "?")
        let empty_advancementLevel = AdvancementLevel(id: "-1", name: "?")
        let empty_assessment = Assessment(id: "-1", country: empty_country, year: "?", advancement_level: empty_advancementLevel, description: "?")
        let empty_sector = Sector(id: "-1", name: "?")
        let empty_good = Good(id: "-1", sector: empty_sector, name: "?")
        
        if let path = Bundle.main.path(forResource: "regions", ofType: "json") {
            print(path)
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                self.regions = try JSONDecoder().decode([Region].self, from: data)
              } catch {
                   // handle error
              }
        }else {
            print("path not found")
        }
        
        if let path = Bundle.main.path(forResource: "advancementLevels", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                self.advancementLevels = try JSONDecoder().decode([AdvancementLevel].self, from: data)
              } catch {
                   // handle error
              }
        }
        
        if let path = Bundle.main.path(forResource: "sectors", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                self.sectors = try JSONDecoder().decode([Sector].self, from: data)
              } catch {
                   // handle error
              }
        }
        
        if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countries = try JSONDecoder().decode([CountryAPI].self, from: data)
                
                for country in countries {
                    let c = Country(id: country.id, name: country.name, region: self.regions.first{$0.id == country.region_id} ?? empty_region, num_territories: country.num_territories)
                    self.countries.append(c)
                }
              } catch {
                   // handle error
              }
        }
        
        if let path = Bundle.main.path(forResource: "territories", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let territories = try JSONDecoder().decode([TerritoryAPI].self, from: data)
                
                for territory in territories {
                    let t = Territory(id: territory.id, name: territory.name, abbreviation: territory.abbreviation, country: self.countries.first{$0.id == territory.country_id} ?? empty_country)
                    self.territories.append(t)
                }
              } catch {
                   // handle error
              }
        }
        
        if let path = Bundle.main.path(forResource: "assessments", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let assessments = try JSONDecoder().decode([AssessmentAPI].self, from: data)
                
                for assessment in assessments {
                    let a = Assessment(id: assessment.id, country: self.countries.first{$0.id == assessment.country_id} ?? empty_country, year: assessment.year, advancement_level: self.advancementLevels.first{$0.id == assessment.advancement_level_id} ?? empty_advancementLevel, description: assessment.description)
                    self.assessments.append(a)
                }
              } catch {
                   // handle error
              }
        }
        
        if let path = Bundle.main.path(forResource: "goods", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let goods = try JSONDecoder().decode([GoodAPI].self, from: data)
                
                for good in goods {
                    let g = Good(id: good.id, sector: self.sectors.first{$0.id == good.sector_id} ?? empty_sector, name: good.name)
                    self.goods.append(g)
                }
              } catch {
                   // handle error
              }
        }
        
        if let path = Bundle.main.path(forResource: "countryGoods", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let countryGoods = try JSONDecoder().decode([CountryGoodAPI].self, from: data)
                
                for countryGood in countryGoods {
                    let g = self.goods.first{$0.id == countryGood.good_id} ?? empty_good
                    let c = self.countries.first{$0.id == countryGood.country_id} ?? empty_country
                    let a = self.assessments.first{$0.id == countryGood.assessment_id} ?? empty_assessment
                    let cg = CountryGood(id: countryGood.id, assessment: a, year: countryGood.year, country: c, good: g, region_name: countryGood.regionname, child_labor: countryGood.child_labor, forced_labor: countryGood.forced_labor, forced_child_labor: countryGood.forced_child_labor)
                    self.countryGoods.append(cg)
                }
              } catch {
                   // handle error
              }
        }
        
        
    }
}
