//
//  Description.swift
//  
//
//  Created by Andrew McLane on 07.07.20.
//

import Foundation
import Vapor
import FluentPostgresDriver
import Fluent
import CRUDKit

public final class Description: Model, Content {
    public static let schema = "descriptions"
    
    @ID(key: .id)
    public var id : UUID?
    
    @Field(key:"value")
    public var value : String
    
    @Parent(key: "product_id")
    var product: Product
    
    public init() {}
    init(
        id: UUID? = nil,
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
