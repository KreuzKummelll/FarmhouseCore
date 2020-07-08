//
//  Farm.swift
//  Farmhouse
//
//  Created by Andrew McLane on 06.05.20.
//  Copyright © 2020 Andrew McLane. All rights reserved.
//

import Foundation

public final class Farmer: Codable {
    public var id: Int?
    public var name: String
    public var standLocations: [StandLocation]
    
    public init (
        id: Int? = nil,
        name: String = "Farm or Farmer's Name",
        standLocations : [StandLocation] = []
    ) {
        self.id = id
        self.name = name
        self.standLocations = standLocations
    }

   
}
