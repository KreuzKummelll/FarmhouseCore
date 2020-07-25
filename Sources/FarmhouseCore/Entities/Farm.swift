//
//  Farm.swift
//  Farmhouse
//
//  Created by Andrew McLane on 06.05.20.
//  Copyright © 2020 Andrew McLane. All rights reserved.
//

import Foundation
import Vapor
import FluentPostgresDriver
import Fluent
import CRUDKit


public final class Farm: Model, Content {
    public static let schema = "farms"
    
    @ID(key: .id)
    public var id: UUID?
    
    @Field(key: "name")
    public var name: String
    
    @Children(for: \.$farm)
    public var storefronts: [Storefront]
    
    @Field(key: "longitude")
    public var longitude: String?
    
    @Field(key: "latitude")
    public var latitude: String?
    
    
    public init () {}
    public init(
        id  : UUID? = nil,
        name: String,
        lat : String = "0",
        long: String = "0"
    ) {
        self.id = id
        self.name = name
        self.latitude = lat
        self.longitude = long
    }
    
}




