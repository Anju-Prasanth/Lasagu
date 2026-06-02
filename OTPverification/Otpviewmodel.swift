//
//  Otpviewmodel.swift
//  Lasagu
//
//  Created by Arun Vijayan on 14/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation


class Otpviewmodel{
var verificationdetails=[String:Any]()
var otpenterd=String()


     func user_sign_up_new_one(completion : @escaping (Otpverify) -> ())  {
             
        
        let poststring="first_name=\(verificationdetails["first_name"]!)&last_name=\(verificationdetails["last_name"]!)&email_id=\(String(describing: verificationdetails["email"]!))&mobile=\(verificationdetails["mobile"]!)&password=\(String(describing: verificationdetails["password"]))&otp=\(otpenterd)"
             print("poststring",poststring)
             var request = NSMutableURLRequest(url: APIEndPoint.user_sign_up_new_one.url as URL)
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
                         let model = try decoder.decode(Otpverify.self, from:
                             data!) //Decode JSON Response Data
                         print(model)
                     completion(model)
                     
                     
                 } catch let error as NSError {
                 }
             }
             task.resume()
         }
    













}
