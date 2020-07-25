//
//  PublicFarm.swift
//  
//
//  Created by Andrew McLane on 7/22/20.
//

import Foundation

final class PublicFarm: Codable {
    public var name: String
    public var storefronts: [PublicStorefront]
    public var latitude: String?
    public var longitude: String?
    
    
    public init(
        name        : String,
        storefronts : [PublicStorefront],
        latitude    : String? = nil,
        longitude   : String? = nil
    ) {
        self.name       = name
        self.storefronts = storefronts
        self.latitude   = latitude
        self.longitude  = longitude
    }
}


