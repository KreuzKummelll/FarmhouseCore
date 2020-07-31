//
//  Name.swift
//  
//
//  Created by Andrew McLane on 07.07.20.
//

import Foundation
import Vapor
import FluentPostgresDriver
import Fluent
import CRUDKit

public final class NameAndAlternatives: Model, Content {
    public static let schema = "names_and_alternatives"
    
    @ID(key: .id)
    public var id : UUID?
    
    @Field(key: "value")
    public var value : String
    
    @Field(key: "alternative_values")
    public var alternativeValues   : [String?]
    
    @Parent(key: "product_id")
    var product: Product
    
    public init() {}
    init(
        id: NameAndAlternatives.IDValue? = nil,
        value: String,
        alternativeValues: [String?] = [],
        product_id: Product.IDValue?
    ) {
        self.id = id
        self.value = value
        self.alternativeValues = alternativeValues
        if let product = product_id {
            self.$product.id = product
        }
    }
}
extension NameAndAlternatives: CRUDModel {
    public struct Create: Content {
        public var value: String
        public var alternativeValues: [String?]
        public var product_id: Product.IDValue?
    }
    public convenience init(from data: Create) throws {
        
        self.init(value: data.value, alternativeValues: data.alternativeValues , product_id: data.product_id)
        
    }
    public struct Replace: Content {
        public var value: String
        public var alternativeValues: [String?]
        public var product_id: Product.IDValue?
    }
    public func replace(with data: Replace) throws -> Self {
        Self.init(value: data.value, alternativeValues: data.alternativeValues, product_id: data.product_id)
    }
    public struct Public: Content {
        public var id: UUID?
        public var value: String
        public var alternativeValues: [String?]
        public var product: Product.IDValue?
    }
    public var `public` : Public {
       Public.init(id: self.id, value: self.value, alternativeValues: alternativeValues, product: self.$product.id)
    }
}


