//
//  PublicPrice.swift
//  
//
//  Created by Andrew McLane on 7/22/20.
//

import Foundation

public final class PublicPrice: Codable {
    public var value: String
    
    public init (value: String) {
        self.value = value
    }
}
