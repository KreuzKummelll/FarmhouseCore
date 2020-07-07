//
//  File.swift
//  
//
//  Created by Andrew McLane on 05.07.20.
//
import Combine
import Foundation


public final class Product {
    public var id           : Int
    public var productID    : UUID?
    public var name         : Name
    public var tldr         : TLDR?
    public var description  : Description?
    public var price        : Price
    public var unit         : Unit?
    
    init(
        id: Int,
         productID: UUID,
         name: Name,
         price: Price,
         tldr: TLDR? = nil,
         description: Description? = nil,
         unit: Unit? = nil
    ) {
        self.id = id
        self.productID = productID
        self.name = name
        self.price = price
        self.tldr = tldr
        self.description = description
        self.unit = unit
    }
}

public struct Name {
    var id                  : String
    var value               : String
    var alternativeValues   : [String]
}

public struct TLDR {
    var id          : UUID
    var value       : String?
}

public struct Description {
    var id          : UUID
    var description : String
}

public struct Price {
    var value       : String
}
