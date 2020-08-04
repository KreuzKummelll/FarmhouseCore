//
//  PublicTLDR.swift
//  
//
//  Created by Andrew McLane on 7/22/20.
//

import Foundation


public final class PublicTLDR: Codable {
    public var id: UUID
    public var value: String
    public var product: UUID
    public init(id: UUID, value: String, product: UUID) {
        self.id = id
        self.value = value
        self.product = product
    }
}
