//
//  Product.swift
//  
//
//  Created by Andrew McLane on 05.07.20.
//

import Foundation


public final class Product: Codable {
    public var id           : UUID?
    public var productName  : ProductName
    public var tldr         : TLDR?
    public var description  : Description?
    public var price        : Price
    public var unit         : String?
    
    init(
        id: UUID?,
        productID: UUID,
        name: ProductName,
        price: Price,
        tldr: TLDR?,
        description: Description?,
        unit: String?
    ) {
        self.id = id
        self.productName = name
        self.price = price
        self.tldr = tldr
        self.description = description
        self.unit = unit
    }
}




