//
//  TLDR.swift
//  
//
//  Created by Andrew McLane on 07.07.20.
//

import Foundation

public final class TLDR: Codable {
    var id          : Int?
    var value       : String
    init(id: Int?, tldrText: String) {
        self.id = id
        self.value = tldrText
    }
}
