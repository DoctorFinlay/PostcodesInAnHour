//
//  Location.swift
//  PostcodesInAnHour
//
//  Created by Iain Coleman on 15/01/2018.
//  Copyright © 2018 Iain Coleman. All rights reserved.
//

import Foundation

struct Location {
    
    public private(set) var postcode: String!
    public private(set) var parish: String!
    public private(set) var region: String!
    public private(set) var country: String!
    public private(set) var constituency: String!

    
    init(postcode: String, parish: String, region: String, country: String, constituency: String) {
        
        self.postcode = postcode
        self.parish = parish
        self.region = region
        self.country = country
        self.constituency = constituency
        
    }
    
}
