//
//  Coachingviewmodel.swift
//  Lasagu
//
//  Created by Arun Vijayan on 24/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation
class Coachingviewmodel{
    var userid=UserDefaults.standard.value(forKey: "useridnew") as! Int
    
    func get_coaching_details(completion : @escaping (Coachingdetails) -> ())  {
        
        
        let poststring="user_id=\(userid)"
        
        var request = NSMutableURLRequest(url: APIEndPoint.get_coaching_details.url as URL)
        request.httpMethod = "POST"
        request.httpBody = poststring.data(using: String.Encoding.utf8)
        let task=URLSession.shared.dataTask(with: request as URLRequest){data,response,error in
            
            //self.showIndicator(isHidden: true)
            if error != nil{
                print("error",error)
                return
            }
            let responsestring=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print("respnsedate,\(responsestring)")
            do {
                
                
                let decoder = JSONDecoder()
                let model = try decoder.decode(Coachingdetails.self, from:
                    data!) //Decode JSON Response Data
                print(model)
                completion(model)
                
                
            } catch let error as NSError {
            }
        }
        task.resume()
    }

    }


