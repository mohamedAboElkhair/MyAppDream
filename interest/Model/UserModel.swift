//
//  UserModel.swift
//  interest
//
//  Created by Mohamed AbouElkhair on 3/23/20.
//  Copyright © 2020 Mohamed AbouElkhair. All rights reserved.
//

import Foundation
final class UserModel : Codable {
    var name:String?
    var email:String?
    var idUser: String?
    var typeLogin : String?
    var photoLink : String?
    var password : String?
    
   init(name: String,email: String ,idUser:String,typeLogin:String,photoLink:String,password:String ) {
        self.name = name
     self.email = name
     self.idUser = idUser
     self.typeLogin = typeLogin
    self.photoLink = photoLink
       self.password = password
   
    
    }
    
}

