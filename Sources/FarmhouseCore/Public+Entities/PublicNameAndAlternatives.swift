//
//  PublicName.swift
//  
//
//  Created by Andrew McLane on 7/22/20.
//

import Foundation

public final class PublicNameAndAlternatives: Codable {
    public var value: String
    public var alternativeValues: [String]
    
    public init(value: String, alternativeValues: [String] = []) {
        self.value = value
        self.alternativeValues = alternativeValues
    }
}
