//
//  PublicStorefront.swift
//  
//
//  Created by Andrew McLane on 7/22/20.
//

import Foundation

public final class PublicStorefront: Codable {
    public var id: UUID
    public var name: String
    public var farm: UUID
    public var latitude: String
    public var longitude: String
    
    public init(
        id: UUID,
        name        : String,
        farm        : UUID,
        latitude    : String,
        longitude   : String
    ) {
        self.id = id
        self.name       = name
        self.farm       = farm
        self.latitude   = latitude
        self.longitude  = longitude
    }
}
