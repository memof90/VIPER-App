//
//  NetworkServices.swift
//  VIPER-Air
//
//  Created by Memo Figueredo on 3/1/22.
//

import Foundation


protocol BaseService {
    func sendRequest<T:Codable>(url: String, of: T.Type, method: HTTPMethod, completion: @escaping (Result<T, CustomError>) -> Void)
}

extension BaseService {
    func sendRequest<T:Codable>(url: String, of: T.Type, method: HTTPMethod, completion: @escaping (Result<T, CustomError>) -> Void) {
        
        guard let url = URL(string: url) else {
                 completion(.failure(.badUrl))
                 return
             }
        
        var request = URLRequest(url: url)
               request.httpMethod = method.name
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, _) in
                    guard let httpResponse = response as? HTTPURLResponse,
                          (200...299).contains(httpResponse.statusCode) else {
                              completion(.failure(.noInternetConnection))
                        return
                    }
                    
                    guard let data = data else {
                        completion(.failure(.responseError))
                        return
                    }
                    
                    do {
                        let response = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(response))
                    } catch {
                        completion(.failure(.unableToParse))
                    }
                }
                task.resume()
    }
}


class NetworkServices {
    static let shared = NetworkServices()
    
    let session = URLSession(configuration: .default)
    
    
//    func fetchUser(count: Int, onSucess: @escaping ([Results], Error?) -> Void ) {
//        let URL_BASE = Enviroment.getUsers
//        guard let url = URL(string: "\(URL_BASE.rawValue)\(count)") else {return}
//        var request = URLRequest(url: url)
//        request.httpMethod = "GET"
//        
//        let task = session.dataTask(with: request) { data, response, error in
//            print(response!)
//        }
//        task.resume()
//    }
    
    
}
