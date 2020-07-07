//
//  StandLocation.swift
//  Farmhouse
//
//  Created by Andrew McLane on 07.05.20.
//  Copyright © 2020 Andrew McLane. All rights reserved.
//

import Combine
import CoreLocation
import MapKit

public final class StandLocation {
    @Published public var name: String
    @Published public var location: CLLocationCoordinate2D
    public var id: UUID
    
    public init() {
        id = UUID()
        name = "Times Square"
        location = CLLocationCoordinate2D.timesSquare
    }
    
    public required init(from decoder: Decoder) throws {
        let contanter = try decoder.container(keyedBy: CodingKeys.self)
        name = try contanter.decode(String.self, forKey: .name)
        location = try contanter.decode(CLLocationCoordinate2D.self, forKey: .location)
        id = try contanter.decode(UUID.self, forKey: .id)
    }
    
    public func copy() -> StandLocation {
        let new = StandLocation()
        new.name = name
        new.location = location
        return new
    }
    
}

extension StandLocation: Equatable {
    public static func == (lhs: StandLocation, rhs: StandLocation) -> Bool {
        return lhs.id == rhs.id
    }
}

extension StandLocation: CustomStringConvertible {
    public var description: String { name }
}
extension StandLocation: Codable {
    public enum CodingKeys: CodingKey {
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

extension StandLocation: Identifiable {}

extension StandLocation {
    var mapItem: MKMapItem {
        return MKMapItem(placemark: MKPlacemark(coordinate: location))
    }
}

extension CLLocationCoordinate2D : Codable {
    public init(from decoder: Decoder) throws {
        let representation = try
            decoder.singleValueContainer().decode(
            [String:CLLocationDegrees].self)
        self.init(latitude: representation["latitude"] ?? 0, longitude: representation["longitude"] ?? 0)
    }

    public func encode(to encoder: Encoder) throws {
        let representation = ["latitude": self.latitude, "longitude":self.longitude]
        try representation.encode(to: encoder)
    }
}

extension CLLocationCoordinate2D {
    static var timesSquare: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: CLLocationDegrees(signOf: 40,magnitudeOf: 7589), longitude: CLLocationDegrees(signOf: -73,magnitudeOf: 9851))
    }
}
