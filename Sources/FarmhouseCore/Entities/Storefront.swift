//
//  Storefront.swift
//  Farmhouse
//
//  Created by Andrew McLane on 07.05.20.
//  Copyright © 2020 Andrew McLane. All rights reserved.
//

import CoreLocation

public final class Storefront: Codable {
    public var id: UUID?
    public var farm: Farm
    public var name: String
    public var latitude: String
    public var longitude: String


    public init (
        id: UUID?,
        farm: Farm,
        name: String = "Somewhere",
        lat: String = "0",
        long: String = "0"
    ) {
        self.id = id
        self.name = name
        self.latitude = lat
        self.longitude = long
    }

}

