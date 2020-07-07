//
//  Price.swift
//  
//
//  Created by Andrew McLane on 07.07.20.
//

import Foundation


public final class Price: Codable {
    var id          : Int?
    var value       : Float
    
    init(id: Int?, price: Float) {
        self.id = id
        self.value = price
    }
}
