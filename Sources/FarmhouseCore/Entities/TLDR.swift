//
//  TLDR.swift
//  
//
//  Created by Andrew McLane on 07.07.20.
//

import Foundation

public final class TLDR: Codable {
    var id          : UUID?
    var value       : String
    init(id: UUID?, tldrText: String) {
        self.id = id
        self.value = tldrText
    }
}
