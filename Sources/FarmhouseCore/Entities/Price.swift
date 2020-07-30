//
//  Price.swift
//  
//
//  Created by Andrew McLane on 07.07.20.
//

import Foundation
import Vapor
import FluentPostgresDriver
import Fluent
import CRUDKit


public final class Price: Model, Content {
    public static let schema = "prices"
    
    @ID(key: .id)
    public var id          : UUID?
    
    @Field(key: "value")
    public var value       : String
    
    @Parent(key: "product_id")
    var product: Product
    
    public init() {}
    public init(id: UUID? = nil, price: String) {
        self.id = id
        self.value = price
    }
}
extension Price: CRUDModel {
    public struct Create: Content {
        public var value: String
    }
    public convenience init(from data: Create) throws {
        self.init(price: data.value)
    }
    
    public struct Replace: Content {
        public var value: String
    }
    public func replace(with data: Replace) throws -> Self {
        Self.init(price: data.value)
    }
    public struct Public: Content {
        public var value: String
        public var id: UUID?
        public var productId: Product.IDValue?
    }
    public var `public` : Public {
        Public.init(value: self.value, id: self.id, productId: self.$product.id)
    }
}
