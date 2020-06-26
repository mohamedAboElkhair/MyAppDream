//
//  PostModel.swift
//  interest
//
//  Created by Mohamed AbouElkhair on 2/14/20.
//  Copyright © 2020 Mohamed AbouElkhair. All rights reserved.
//

import Foundation

import UIKit

class CategoryModel {
 
    // With Alamofire
    func getCategory(){
        let getCategory = "http://127.0.0.1:8000/api/category"
        performRequst(urlString: getCategory)
    }
        
    func performRequst(urlString : String) {
           // create a url
           if let url = URL(string: urlString){
               
               let session = URLSession(configuration: .default)
               
               let task =  session.dataTask(with: url) { (data, respones, error) in
                    if error != nil{
                          print(error!)
                          return
                      }
                      if let safeData = data {
                       
                          let dataString = String(data: safeData, encoding: .utf8)
                       
                        print(dataString!)
                    //self.parseJSON(categoryDate: safeData)
                          
                      }
               }
               
               task.resume()
        }
           }
        func parseJSON (categoryDate : Data){
            
                // print(weatherData)
           }
        
}
