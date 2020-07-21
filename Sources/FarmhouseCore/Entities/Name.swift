//
//  Name.swift
//  
//
//  Created by Andrew McLane on 07.07.20.
//

import Foundation

public final class ProductName: Codable {
    var id                  : Int?
    var value               : String
    var alternativeValues   : [String]
    
    init(id: Int?, name: String, alternativeNames: [String] ) {
        self.id = id
        self.value = name
        self.alternativeValues = alternativeNames
    }
}
