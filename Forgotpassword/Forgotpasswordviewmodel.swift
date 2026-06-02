//
//  Forgotpasswordviewmodel.swift
//  Lasagu
//
//  Created by Arun Vijayan on 16/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation


class Forgotpasswordviewmodel{
    var emailentered=String()
    var otpentered=String()
    var password=String()

func forgot_password(completion : @escaping (Forgotpassword) -> ())  {
         
    
         let poststring="email_id=\(emailentered)"
         
        var request = NSMutableURLRequest(url: APIEndPoint.forgot_password.url as URL)
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
                     let model = try decoder.decode(Forgotpassword.self, from:
                         data!) //Decode JSON Response Data
                     print(model)
                 completion(model)
                 
                 
             } catch let error as NSError {
             }
         }
         task.resume()
     }
    
    
    
    func update_password(completion : @escaping (Updatepassword) -> ())  {
         
    
         let poststring="email_id=\(emailentered)&password=\(password)&otp=\(otpentered)"
         
        var request = NSMutableURLRequest(url: APIEndPoint.update_password.url as URL)
         request.httpMethod = "POST"
         request.httpBody = poststring.data(using: String.Encoding.utf8)
         let task=URLSession.shared.dataTask(with: request as URLRequest){data,response,error in
             print("poststring",poststring)
             //self.showIndicator(isHidden: true)
             if error != nil{
                 print("error",error)
                 return
             }
             let responsestring=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
             
             print("respnsedate,\(responsestring)")
             do {
                 
                
                     let decoder = JSONDecoder()
                     let model = try decoder.decode(Updatepassword.self, from:
                         data!) //Decode JSON Response Data
                     print(model)
                 completion(model)
                 
                 
             } catch let error as NSError {
             }
         }
         task.resume()
     }
    
    
    

}
