//
//  CustomError.swift
//  VIPER-Air
//
//  Created by Memo Figueredo on 3/1/22.
//

import Foundation


enum CustomError: Error {
    case badUrl
    case responseError
    case unableToParse
    case noInternetConnection
}
