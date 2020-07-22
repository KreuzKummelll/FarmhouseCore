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



final class User : Content, Model {
    static let schema = "users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "username")
    var username: String
    
    @Enum(key: "user_type")
    var userType: UserType
    
    init() { }
    
    init(id: UUID? = nil,
         name: String, username: String,
         userType: UserType) {
        self.id = id
        self.name = name
        self.username = username
        self.userType = userType
    }
    
}

extension User: CRUDModel {
    struct Create: Content {
        var name: String
        var username: String
        var userType: UserType
    }
    convenience init(from data: Create) throws {
        self.init(name: data.name, username: data.username, userType: data.userType)
    }
    struct Replace: Content {
        var name: String
        var username: String
        var userType: UserType
    }
    func replace(with data: Replace) throws -> Self {
        Self.init(name: data.name, username: data.username, userType: data.userType)
    }
}

extension User: Authenticatable {
    
}

extension User: SessionAuthenticatable {
    typealias SessionID = UUID

    var sessionID: SessionID { self.id! }
}

