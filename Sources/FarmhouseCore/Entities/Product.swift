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

final class Product: Content, Model {
    
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
        var storefront_id: Product.IDValue?
    }
    public convenience init(from data: Create) throws {
        self.init(storefront_id: data.storefront_id)
    }
}





