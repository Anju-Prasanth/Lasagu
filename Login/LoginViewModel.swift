//
//  LoginViewModel.swift
//  Lasagu
//
//  Created by Arun Vijayan on 04/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation
public class LoginViewModel {
    var username=String()
    var password=String()
    var firstname=String()
    var lastname=String()
   var userid=Int()
    var fcmtoken=String()
    var device_id=String()
    var pincode=String()
    var email=String()

   

    func loginUser(completion : @escaping (Json4Swift_Base) -> ())  {
            if let deviceid = UserDefaults.standard.value(forKey: "device_id"){
                   device_id=UserDefaults.standard.value(forKey: "device_id") as! String
               }
       
            let poststring="username=\(username)&password=\(password)&device_id=\(device_id)"
            
            var request = NSMutableURLRequest(url: APIEndPoint.loginUser.url as URL)
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
                        let model = try decoder.decode(Json4Swift_Base.self, from:
                            data!) //Decode JSON Response Data
                        print(model)
                    completion(model)
                    
                    
                } catch let error as NSError {
                }
            }
            task.resume()
        }
   func update_user_profile(completion : @escaping (updateuserprofile) -> ())  {
        
   
        let poststring="first_name=\(firstname)&last_name=\(lastname)&user_id=\(userid)&psc_email=\(email)&pincode=\(pincode)"
        
        var request = NSMutableURLRequest(url: APIEndPoint.update_user_profile.url as URL)
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
                    let model = try decoder.decode(updateuserprofile.self, from:
                        data!) //Decode JSON Response Data
                    print(model)
                completion(model)
                
                
            } catch let error as NSError {
            }
        }
        task.resume()
    }
    func get_profile_with_result(completion : @escaping (Profiledetailwithresultclass) -> ())  {
           
      
           let poststring="user_id=\(userid)"
           
           var request = NSMutableURLRequest(url: APIEndPoint.get_profile_with_result.url as URL)
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
                       let model = try decoder.decode(Profiledetailwithresultclass.self, from:
                           data!) //Decode JSON Response Data
                       print(model)
                   completion(model)
                   
                   
               } catch let error as NSError {
               }
           }
           task.resume()
       }
    
    func get_fcm_token(completion : @escaping (Fcmtokenclass) -> ())  {
        if let fcm_token = UserDefaults.standard.value(forKey: "fcm_token"){
            fcmtoken=UserDefaults.standard.value(forKey: "fcm_token") as! String
        }
        if let deviceid = UserDefaults.standard.value(forKey: "device_id"){
               device_id=UserDefaults.standard.value(forKey: "device_id") as! String
           }
         
         let poststring="user_id=\(userid)&fcm_token=\(fcmtoken)&device_id=\(device_id)"
         
         var request = NSMutableURLRequest(url: APIEndPoint.get_fcm_token.url as URL)
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
                     let model = try decoder.decode(Fcmtokenclass.self, from:
                         data!) //Decode JSON Response Data
                     print(model)
                 completion(model)
                 
                 
             } catch let error as NSError {
             }
         }
         task.resume()
     }
      
        
    }
    
    
    
    
    
    
    
    
    



