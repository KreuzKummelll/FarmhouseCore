//
//  PublicFarm.swift
//  
//
//  Created by Andrew McLane on 7/22/20.
//

import Foundation

public final class PublicFarm: Codable {
    public var id: UUID
    public var name: String
    public var latitude: String?
    public var longitude: String?
    
    
    public init(
        id          : UUID
        name        : String,
        latitude    : String? = nil,
        longitude   : String? = nil
    ) {
        self.id         = id
        self.name       = name
        self.latitude   = latitude
        self.longitude  = longitude
    }
}


