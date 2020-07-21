//
//  Description.swift
//  
//
//  Created by Andrew McLane on 07.07.20.
//

import Foundation

public class Description: Codable {
    var id          : UUID?
    var value       : String
    
    init(id: UUID?, value: String) {
        self.id = id
        self.value = value
    }
}
