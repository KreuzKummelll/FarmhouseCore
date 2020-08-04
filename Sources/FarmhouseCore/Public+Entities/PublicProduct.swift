//
//  PublicProduct.swift
//  
//
//  Created by Andrew McLane on 7/22/20.
//

import Foundation


public final class PublicProduct: Codable {
    public var id: UUID
    public var storefront: UUID
    
    
    public init(
        id: UUID, storefront: UUID
    ) {
        self.id = id
        self.storefront = storefront
    }
}
