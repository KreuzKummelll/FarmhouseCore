//
//  Product.swift
//  
//
//  Created by Andrew McLane on 05.07.20.
//

import Foundation


public final class Product: Codable {
    public var id           : UUID?
    public var farm         : Farm
    public var productName  : ProductName
    public var tldr         : TLDR?
    public var description  : Description?
    public var price        : Price
    public var unit         : String?
    
    init(
        id: UUID?,
        farmID: Farm,
        name: ProductName,
        tldr: TLDR?,
        description: Description?,
        price: Price,
        unit: String?
    ) {
        self.id = id
        self.farm = farm
        self.productName = name
        self.tldr = tldr
        self.description = description
        self.price = price
        self.unit = unit
    }
}




