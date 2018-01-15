//
//  APIService.swift
//  PostcodesInAnHour
//
//  Created by Iain Coleman on 15/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIService {
    
    static let instance = APIService()
    
    var currentLocation: Location?
    
    enum jsonKeys: String {
        
        case result
        
        case postcode
        case parish
        case region
        case country
        case parliamentary_constituency
        
    }
    
    
    func getLocation(postcode: String, completion: @escaping CompletionHandler) {
        
        let fullURL = "\(BASE_URL)\(postcode)"
        
        Alamofire.request(fullURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if response.result.error == nil {
                
                guard let data = response.data else {return}
                self.setLocation(data: data)
                completion(true)
            } else {
                debugPrint(response.result.error as Any)
                completion(false)
            }
        }
    }
    
    
    
    func setLocation(data: Data) {
        
        do {
            let json = try JSON(data: data)

            let postcode = json[jsonKeys.result.rawValue][jsonKeys.postcode.rawValue].stringValue
            print(postcode)
            let parish = json[jsonKeys.result.rawValue][jsonKeys.parish.rawValue].stringValue
            let region = json[jsonKeys.result.rawValue][jsonKeys.region.rawValue].stringValue
            let country = json[jsonKeys.result.rawValue][jsonKeys.country.rawValue].stringValue
            let constituency = json[jsonKeys.result.rawValue][jsonKeys.parliamentary_constituency.rawValue].stringValue
            self.currentLocation = Location(postcode: postcode, parish: parish, region: region, country: country, constituency: constituency)
            
        } catch {
            print(error)
        }
        
    }
    
    
    
    
    
}
