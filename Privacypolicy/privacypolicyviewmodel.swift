//
//  privacypolicyviewmodel.swift
//  Lasagu
//
//  Created by Arun Vijayan on 10/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation
class Privacypolicyviewmodel{
    
    
    
    func get_privacy_and_policy(completion : @escaping (Privacypolicyclass) -> ())  {
         
           
                var request = URLRequest(url: APIEndPoint.get_privacy_and_policy.url as URL)
                request.httpMethod = "GET"
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
               
               //self.showIndicator(isHidden: true)
               if error != nil{
                   print("error",error)
                   return
               }
               let responsestring=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
               
               print("respnsedate,\(responsestring)")
               do {
                   
                   
                   let decoder = JSONDecoder()
                   let model = try decoder.decode(Privacypolicyclass.self, from:
                       data!) //Decode JSON Response Data
                   print(model)
                   completion(model)
                   
                   
               } catch let error as NSError {
               }
           }
           task.resume()
       }
       
       
       
    
    func get_terms_and_condition(completion : @escaping (Termsclass) -> ())  {
         
           
                var request = URLRequest(url: APIEndPoint.get_terms_and_condition.url as URL)
                request.httpMethod = "GET"
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
               
               //self.showIndicator(isHidden: true)
               if error != nil{
                   print("error",error)
                   return
               }
               let responsestring=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
               
               print("respnsedate,\(responsestring)")
               do {
                   
                   
                   let decoder = JSONDecoder()
                   let model = try decoder.decode(Termsclass.self, from:
                       data!) //Decode JSON Response Data
                   print(model)
                   completion(model)
                   
                   
               } catch let error as NSError {
               }
           }
           task.resume()
       }
       
       
    
    
    
    
    
}
