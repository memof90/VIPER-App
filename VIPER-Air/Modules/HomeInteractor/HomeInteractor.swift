//
//  HomeInteractor.swift
//  VIPER-Air
//
//  Created by Memo Figueredo on 3/1/22.
//

import Foundation
import Alamofire

//https://randomuser.me/api/?results=100

enum ServiceResult {
    case success(data: Any?)
    case failed(error: String?)
}

typealias ServiceCompletion = (_ result: ServiceResult) -> ()


protocol HomeUseCase {
    func fetchRequest(count: Int, completion: @escaping ServiceCompletion)
    
}


class HomeIntercator {
    let url = "https://randomuser.me/api/"
}

extension HomeIntercator: HomeUseCase {

    func fetchRequest(count: Int, completion: @escaping ServiceCompletion) {
    print("Start Fetching")
    AF.request(url, method: .get, parameters: ["results":count], encoding: URLEncoding.queryString)
    .validate()
    
    .responseDecodable(of: Users.self) {(response) in
    print(response)
    if let users = response.value {
        print(users)
        completion(ServiceResult.success(data: users))
    } else {
        completion(ServiceResult.failed(error: "Error in Json"))
        }
    }
}
    
 

    
    
}
            
