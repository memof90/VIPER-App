//
//  Path.swift
//  VIPER-Air
//
//  Created by Memo Figueredo on 3/1/22.
//

import Foundation


class Enviroment {
    static let getUsers = APIPath.getUsers
  
    enum APIPath : String {
    case getUsers = "https://randomuser.me/api/?results=10"
    }
}
