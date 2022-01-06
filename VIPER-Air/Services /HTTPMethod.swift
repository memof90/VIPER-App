//
//  HTTPMethod.swift
//  VIPER-Air
//
//  Created by Memo Figueredo on 3/1/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    
    var name: String {
        return rawValue
    }
}
