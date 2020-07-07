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

public final class StandLocation: Codable {
    public var id: Int?
    public var name: String = ""
    public var location: CLLocationCoordinate2D

    public init (
        id: Int? = Int.random(in: 0..<Int.max),
        name: String = "Somewhere",
        location: CLLocationCoordinate2D = CLLocationCoordinate2D()
    ) {
        self.id = id
        self.name = name
        self.location = location
    }
    
    public func copy() -> StandLocation {
        let new = StandLocation()
        new.name = name
        new.location = location
        return new
    }
}


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
