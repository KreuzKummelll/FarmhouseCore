//
//  File.swift
//  
//
//  Created by Andrew McLane on 05.07.20.
//
import Combine
import Foundation


public final class Product: Codable {
    public var id           : Int?
    public var name         : Name
    public var tldr         : TLDR?
    public var description  : Description?
    public var price        : Price
    public var unit         : Unit?
    
    init(
        id: Int?,
         productID: UUID,
         name: Name,
         price: Price,
         tldr: TLDR? = nil,
         description: Description? = nil,
         unit: Unit? = nil
    ) {
        self.id = id
        self.name = name
        self.price = price
        self.tldr = tldr
        self.description = description
        self.unit = unit
    }
}




