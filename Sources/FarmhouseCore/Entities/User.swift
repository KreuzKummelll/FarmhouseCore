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
    
    public func copyAndConvertToPublicUser() -> PublicUser {
        let publicUser = PublicUser(userName: self.username, userType: self.userType)
        return publicUser
    }
}
