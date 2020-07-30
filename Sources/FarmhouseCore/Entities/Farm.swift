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
    public var longitude: String
    
    @Field(key: "latitude")
    public var latitude: String
    
    
    public init () {}
    public init(
        id  : UUID? = nil,
        name: String,
        lat : String,
        long: String
    ) {
        self.id = id
        self.name = name
        self.latitude = lat
        self.longitude = long
    }
    
}
extension Farm: CRUDModel {
    public struct Create: Content {
        public var name: String
        public var lat : String
        public var long: String
    }
    public convenience init(from data: Create) throws {
        self.init(name: data.name, lat : data.lat, long: data.long)
    }
    public struct Replace: Content {
        public var name: String
        public var lat : String
        public var long: String
    }
    public func replace(with data: Replace) throws -> Self {
        Self.init(name: data.name, lat : data.lat, long: data.long)
    }
    public struct Public: Content {
        public var id: UUID?
        public var name: String
        public var lat: String
        public var long: String
    }
    public var `public` : Public {
        Public.init(id: self.id, name: self.name, lat: self.latitude, long: self.longitude)
    }
}




