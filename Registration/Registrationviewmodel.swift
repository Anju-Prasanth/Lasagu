//
//  Registrationviewmodel.swift
//  Lasagu
//
//  Created by Arun Vijayan on 14/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation

class Registrationviewmodel{
    var mobile=String()
    var email=String()
    
    
func service_check_user_sign_up_new(completion : @escaping (Registration) -> ())  {
          
     
    let poststring="email_id=\(email)&mobile=\(mobile)"
           print("poststring",poststring)
           var request = NSMutableURLRequest(url: APIEndPoint.check_user_sign_up_new.url as URL)
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
                       let model = try decoder.decode(Registration.self, from:
                           data!) //Decode JSON Response Data
                       print(model)
                   completion(model)
                   
                   
               } catch let error as NSError {
               }
           }
           task.resume()
       }
  
       
   }
