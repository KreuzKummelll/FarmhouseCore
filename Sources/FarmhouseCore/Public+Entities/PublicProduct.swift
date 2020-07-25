//
//  PublicProduct.swift
//  
//
//  Created by Andrew McLane on 7/22/20.
//

import Foundation


final class PublicProduct: Codable {
    public var name: PublicNameAndAlternatives
    public var tldr: PublicTLDR?
    public var description: PublicDescription?
    public var price : PublicPrice
    
    public init(
        name: PublicNameAndAlternatives,
        tldr: PublicTLDR? = nil,
        description: PublicDescription? = nil,
        price: PublicPrice
    ) {
        self.name = name
        self.tldr = tldr
        self.description = description
        self.price = price
    }
}
