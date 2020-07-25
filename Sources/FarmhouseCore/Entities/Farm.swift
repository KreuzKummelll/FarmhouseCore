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
extension Farm: CRUDModel {
    public struct Create: Content {
        var name: String
        var lat : String?
        var long: String?
    }
    public convenience init(from data: Create) throws {
        self.init(
            name: data.name,
            lat : data.lat ?? "0",
            long: data.long ?? "0")
    }
    public struct Replace: Content {
        var name: String
        var lat : String?
        var long: String?
    }
    public func replace(with data: Replace) throws -> Self {
        Self.init(
            name: data.name,
            lat : data.lat ?? latitude!,
            long: data.long ?? latitude!)
    }
    public struct Public: Content {
        var name: String
        var lat: String?
        var long: String?
    }
    public var `public` : Public {
        Public.init(name: name, lat: latitude, long: longitude)
    }
}




