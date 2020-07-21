//
//  Farm.swift
//  Farmhouse
//
//  Created by Andrew McLane on 06.05.20.
//  Copyright © 2020 Andrew McLane. All rights reserved.
//

import Foundation

public final class Farmer: Codable {
    public var id: UUID?
    public var name: String
    public var storefronts: [Storefront]
    
    public init (
        id: UUID?,
        name: String,
        storefronts: [Storefront]
    ) {
        self.id = id
        self.name = name
        self.storefronts = storefronts
    }
}
