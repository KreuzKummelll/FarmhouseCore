//
//  Farm.swift
//  Farmhouse
//
//  Created by Andrew McLane on 06.05.20.
//  Copyright © 2020 Andrew McLane. All rights reserved.
//

import Foundation
import Combine

public final class Farmer {
    @Published public var name: String = ""
    @Published public var standLocations: [StandLocation] = []
    public let id: UUID
    public init() {
        id = UUID()
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        standLocations = try container.decode([StandLocation].self, forKey: .standLocations)
        id = try container.decode(UUID.self, forKey: .id)
    }
}

extension Farmer: Codable {
    public enum CodingKeys: CodingKey {
        case name
        case standLocations
        case id
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(standLocations, forKey: .standLocations)
        try container.encode(id, forKey: .id)
    }
}

extension Farmer: Equatable {
    public static func == (lhs: Farmer, rhs: Farmer) -> Bool {
        lhs.id == rhs.id
    }
}

extension Farmer: Identifiable {}

extension Farmer: ObservableObject {}
