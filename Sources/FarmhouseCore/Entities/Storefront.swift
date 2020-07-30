//
//  Storefront.swift
//  Farmhouse
//
//  Created by Andrew McLane on 07.05.20.
//  Copyright © 2020 Andrew McLane. All rights reserved.
//

import Foundation
import Fluent
import FluentPostgresDriver
import Vapor
import CRUDKit

public final class Storefront: Model, Content {
    public static let schema = "storefronts"
    
    @ID(key: .id)
    public var id: UUID?
    
    @Field(key: "name")
    public var name: String?
    
    @Parent(key: "farm_id")
    public var farm: Farm
    
    @Children(for: \.$storefront)
    public var products: [Product]
    
    @Field(key: "latitude")
    public var latitude: String
    
    @Field(key: "longitude")
    public var longitude: String
    
    public init () {}
    public init(
        id: Storefront.IDValue? = nil,
        name: String? = "Storefront \(Int.random().description)",
        farm_id: Farm.IDValue?,
        lat : String,
        long: String
    ) {
        self.id = id
        self.name = name
        if let farm = farm_id {
            self.$farm.id = farm
        }
        self.latitude = lat
        self.longitude = long
    }
}

extension Storefront: CRUDModel {
    public struct Create: Content {
        public var name: String
        public var farm_id: Farm.IDValue?
        public var latitude: String
        public var longitude: String
    }
    public convenience init(from data: Create) throws {
        self.init(name: data.name, farm_id: data.farm_id, lat: data.latitude, long: data.longitude)
    }
    public struct Replace: Content {
        public var name: String
        public var farm_id: Farm.IDValue?
        public var latitude: String
        public var longitude: String
    }
    public func replace(with data: Replace) throws -> Self {
        Self.init(name: data.name, farm_id: data.farm_id, lat: data.latitude, long: data.longitude)
    }
    public struct Public: Content {
        public var id: UUID?
        public var name: String
        public var farm: Farm.IDValue?
        public var lat: String
        public var long: String
    }
    public var `public` : Public {
        Public.init(id: self.id, name: self.name ?? "Farm", farm: self.$farm.id ,lat: self.latitude, long: self.longitude)
    }
}
