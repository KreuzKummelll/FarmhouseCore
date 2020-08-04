//
//  User.swift
//  
//
//  Created by Andrew McLane on 21.07.20.
//

import Foundation
import Vapor
import FluentPostgresDriver
import Fluent
import CRUDKit


public final class User : Content, Model {
    public static let schema = "users"
    
    @ID(key: .id)
    public var id: UUID?
    
    @Field(key: "name")
    public var name: String
    
    @Field(key: "username")
    public var username: String
    
    @Enum(key: "user_type")
    public var userType: UserType
    
    public init() {}
    public init(
        id: User.IDValue? = nil,
        name: String,
        username: String,
        userType: UserType
    ) {
        self.id = id
        self.name = name
        self.username = username
        self.userType = userType
    }
}

extension User: CRUDModel {
    public struct Create: Content {
        var name: String
        var username: String
        var userType: UserType
    }
    public convenience init(from data: Create) throws {
        self.init(name: data.name, username: data.username, userType: data.userType)
    }
    public struct Replace: Content {
        var name: String
        var username: String
        var userType: UserType
    }
    public func replace(with data: Replace) throws -> Self {
        Self.init(name: data.name, username: data.username, userType: data.userType)
    }
    public struct Public: Content {
        var id: UUID?
        var username: String
        var userType: UserType
    }
    public var `public` : Public {
        Public.init(id: self.id, username: self.username, userType: self.userType)
    }
}
