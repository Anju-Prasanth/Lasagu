//
//  slidereportviewmodel.swift
//  Lasagu
//
//  Created by Arun Vijayan on 13/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

 class Slidereportviewmodel {
var userid=Int()
   
     
    var subject=String()
    var message=String()
    var device_id=String()

 
 func get_user_exam_reports(completion : @escaping (Slidereportclass) -> ())  {
         
    if let user_id=UserDefaults.standard.value(forKey: "useridnew") {
        userid=UserDefaults.standard.value(forKey: "useridnew") as! Int
    }
         let poststring="user_id=\(userid)"
         
         var request = NSMutableURLRequest(url: APIEndPoint.get_user_exam_reports.url as URL)
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
                     let model = try decoder.decode(Slidereportclass.self, from:
                         data!) //Decode JSON Response Data
                     print(model)
                 completion(model)
                 
                 
             } catch let error as NSError {
             }
         }
         task.resume()
     }

    
    func submit_enquiry(completion : @escaping (Submitenquiryclass) -> ())  {
         if let user_id=UserDefaults.standard.value(forKey: "useridnew") {
                userid=UserDefaults.standard.value(forKey: "useridnew") as! Int
            }
    
         let poststring="user_id=\(userid)&subject=\(subject)&message=\(message)"
         print("poststring",poststring)
         var request = NSMutableURLRequest(url: APIEndPoint.submit_enquiry.url as URL)
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
                     let model = try decoder.decode(Submitenquiryclass.self, from:
                         data!) //Decode JSON Response Data
                     print(model)
                 completion(model)
                 
                 
             } catch let error as NSError {
             }
         }
         task.resume()
     }

     func user_logout_new(completion : @escaping (Logoutclass) -> ())  {
             if let user_id=UserDefaults.standard.value(forKey: "useridnew") {
                    userid=UserDefaults.standard.value(forKey: "useridnew") as! Int
                }
        if let deviceid = UserDefaults.standard.value(forKey: "device_id"){
               device_id=UserDefaults.standard.value(forKey: "device_id") as! String
           }
        
             let poststring="user_id=\(userid)&device_id=\(device_id)"
             print("poststring",poststring)
              var request = NSMutableURLRequest(url: APIEndPoint.user_logout_new.url as URL)
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
                         let model = try decoder.decode(Logoutclass.self, from:
                             data!) //Decode JSON Response Data
                         print(model)
                     completion(model)
                     
                     
                 } catch let error as NSError {
                 }
             }
             task.resume()
         }

 }
 
 
