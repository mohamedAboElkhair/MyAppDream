//
//  APIRequest.swift
//  interest
//
//  Created by Mohamed AbouElkhair on 3/24/20.
//  Copyright © 2020 Mohamed AbouElkhair. All rights reserved.
//

import Foundation


enum APIError:Error{
    case responseProblem
    case decodingProblem
    case encoderProblem
}

struct APIRequst {
    let resourceURL: URL
    
    init(endpoint: String) {
        let resourceString = "http://127.0.0.1:8000/api/auth/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        self.resourceURL = resourceURL
        
    }
    func save (_ userSave:UserModel, completion: @escaping(Result<UserModel,APIError>)->Void  ) {
        do{
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "Post"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody =  try JSONEncoder().encode(userSave)
            let dataTask = URLSession.shared.dataTask(with: urlRequest){ data , response , _ in
                guard let httpRespones = response as? HTTPURLResponse , httpRespones.statusCode
                    == 200 ,
                let jsonData = data else{
                    completion(.failure(.responseProblem))
                    
                    return
                }
                do{
                    let logindate = try JSONDecoder().decode(UserModel.self, from: jsonData)
                    completion(.success(logindate))
                }catch{
                    completion(.failure(.decodingProblem))
                }
                
                
            }
            dataTask.resume()
        }catch{
            completion(.failure(.encoderProblem))
        }
        
    }
}
