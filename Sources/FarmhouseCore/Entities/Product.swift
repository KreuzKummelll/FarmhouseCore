//
//  Product.swift
//  
//
//  Created by Andrew McLane on 05.07.20.
//

import Foundation
import Vapor
import FluentPostgresDriver
import Fluent
import CRUDKit

public final class Product: Content, Model {
    
    public static let schema = "products"
    
    // MARK: Fields
    @ID(key: .id)
    public var id: UUID?
    
    // MARK: Parent
    @Parent(key:"storefront_id")
    public var storefront: Storefront
    
    // MARK: Children
    @Children(for: \.$product)
    public var nameAndAlternatives: [NameAndAlternatives]
    
    @Children(for: \.$product)
    public var tldrs: [TLDR]
    
    @Children(for: \.$product)
    public var descriptions: [Description]
    
    @Children(for: \.$product)
    public var prices: [Price]

    
    // MARK: Initiation
    public init() { }
    public init(
        id: Product.IDValue? = nil,
        storefront_id: Storefront.IDValue?
    ) {
        self.id = id
        if let storefront = storefront_id {
            self.$storefront.id = storefront
        }
    }
}

extension Product: CRUDModel {
   
    public struct Create: Content {
        public var storefront_id: Product.IDValue?
    }
    public convenience init(from data: Create) throws {
        self.init(storefront_id: data.storefront_id)
    }
    public struct Replace: Content {
        public var storefront_id: Storefront.IDValue?
    }
    public func replace(with data: Replace) throws -> Self {
        Self.init(storefront_id: data.storefront_id)
    }
    public struct Public: Content {
        public var id: UUID?
        public var storefront: Storefront.IDValue?
    }
    public var `public` : Public {
        Public.init(id: self.id, storefront: self.$storefront.id)
    }
}

