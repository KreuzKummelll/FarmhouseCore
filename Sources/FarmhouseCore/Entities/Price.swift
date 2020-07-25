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
