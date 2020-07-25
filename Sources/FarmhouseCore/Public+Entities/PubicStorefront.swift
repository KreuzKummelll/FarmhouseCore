//
//  PublicStorefront.swift
//  
//
//  Created by Andrew McLane on 7/22/20.
//

import Foundation

final class PublicStorefront: Codable {
    public var name: String
    public var farm: PublicFarm
    public var latitude: String
    public var longitude: String
    
    public init(
        name        : String,
        farm        : PublicFarm,
        latitude    : String,
        longitude   : String
    ) {
        self.name       = name
        self.farm       = farm
        self.latitude   = latitude
        self.longitude  = longitude
    }
}
