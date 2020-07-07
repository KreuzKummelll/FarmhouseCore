//
//  Waypoint.swift
//  Farmhouse
//
//  Created by Andrew McLane on 25.05.20.
//  Copyright © 2020 Andrew McLane. All rights reserved.
//

import Combine
import CoreLocation
import MapKit

public final class Waypoint {
    @Published public var name: String
    @Published public var location: CLLocationCoordinate2D
    public var id: UUID
    
    public init() {
        id = UUID()
        name = "Times Square"
        location = CLLocationCoordinate2D.timesSquare
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        location = try container.decode(CLLocationCoordinate2D.self, forKey: .location)
        id = try container.decode(UUID.self, forKey: .id)
    }
    
    public func copy() -> Waypoint {
        let new = Waypoint()
        new.name = name
        new.location = location
        return new
    }
}

extension Waypoint: Equatable {
    public static func == (lhs: Waypoint, rhs: Waypoint) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Waypoint: CustomStringConvertible {
    public var description: String { name }
}

extension Waypoint: Codable {
    enum CodingKeys: CodingKey {
        case name
        case location
        case id
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(location, forKey: .location)
        try container.encode(id, forKey: .id)
    }
}

extension Waypoint: Identifiable {}

extension Waypoint {
    public var mapItem: MKMapItem {
        return MKMapItem(placemark: MKPlacemark(coordinate: location))
    }
}
