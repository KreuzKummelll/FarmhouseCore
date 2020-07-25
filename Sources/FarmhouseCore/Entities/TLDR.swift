//
//  TLDR.swift
//  
//
//  Created by Andrew McLane on 07.07.20.
//

import Foundation
import Vapor
import FluentPostgresDriver
import Fluent
import CRUDKit

public final class TLDR: Content, Model {
    public static let schema = "tldrs"
    
    @ID(key: .id)
    public var id: UUID?
    
    @Field(key: "value")
    public var value: String
    
    @Parent(key: "product_id")
    var product: Product
    
    public init() {}
    init(
        id: TLDR.IDValue? = nil,
        value: String,
        product_id: Product.IDValue?
    ) {
        self.id = id
        self.value = value
        if let product = product_id {
            self.$product.id = product
        }
    }
}


extension TLDR: CRUDModel {
    public var `public`: Public {
        Public.init(value: value)
    }
    public struct Create: Content {
        var value: String
        var product_id: Product.IDValue?
    }
    public convenience init(from data: Create) throws {
        self.init(value: data.value, product_id: data.product_id)
    }
    public struct Replace: Content {
        var value: String
        var product_id: Product.IDValue?
    }
    public func replace(with data: Replace) throws -> Self {
        Self.init(
            value: data.value,
            product_id: data.product_id
        )
    }
    public struct Public: Content {
        var value: String
    }
    
}

