//
//  File.swift
//  
//
//  Created by Andrew McLane on 7/22/20.
//

import Foundation

public final class PublicUser: Codable {
    public var userName: String
    public var userType: UserType
    
    public init(userName: String, userType: UserType) {
        self.userName = userName
        self.userType = userType
    }
}


