//
//  Mocktestviewmodel.swift
//  Lasagu
//
//  Created by Arun Vijayan on 23/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation
 

class Mocktestviewmodel{
    var mocksubcatid=String()
    var mainctgryid=String()
    
    var userid=UserDefaults.standard.value(forKey: "useridnew") as! Int
   
func get_mock_test_new_ios(completion : @escaping (Mocktest) -> ())  {
    
    if let main_ctgry_id = UserDefaults.standard.value(forKey: "mainctgryid"){
        mainctgryid=UserDefaults.standard.value(forKey: "mainctgryid") as! String
    }
    
    let poststring="user_id=\(userid)&main_category_id=\(mainctgryid)"
    print("poststring",poststring)
    var request = NSMutableURLRequest(url: APIEndPoint.get_mock_test_new_ios.url as URL)
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
            let model = try decoder.decode(Mocktest.self, from:
                data!) //Decode JSON Response Data
            print(model)
            completion(model)
            
            
        } catch let error as NSError {
        }
    }
    task.resume()
}


func get_mock_test_series_new_ios(completion : @escaping (Mocktestseriesclass) -> ())  {
    
    
     let poststring="user_id=\(userid)&mock_test_category_id=\(mocksubcatid)"
    print("poststring",poststring)
    var request = NSMutableURLRequest(url: APIEndPoint.get_mock_test_series_new_ios.url as URL)
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
            let model = try decoder.decode(Mocktestseriesclass.self, from:
                data!) //Decode JSON Response Data
            print(model)
            completion(model)
            
            
        } catch let error as NSError {
        }
    }
    task.resume()
}

}
