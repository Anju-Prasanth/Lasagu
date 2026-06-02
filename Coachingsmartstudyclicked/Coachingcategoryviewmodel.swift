//
//  Coachingcategoryviewmodel.swift
//  Lasagu
//
//  Created by Arun Vijayan on 10/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

class Coachingcategorysmartsyudyviewmodel{
    var premiumid=String()
    var promocode=String()
    var amount=String()
    var preliminary_id=String()
    var mainctgryid=String()
    var preliminary_flag=Int()
    var postring=String()
var userid=UserDefaults.standard.value(forKey: "useridnew") as! Int

func get_category_wise_video(completion : @escaping (categorywisevideoclass) -> ())  {
    
    
    let poststring="user_id=\(userid)&premium_category_id=\(premiumid)"
    print("oststring",poststring)
    var request = NSMutableURLRequest(url: APIEndPoint.get_category_wise_video.url as URL)
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
            let model = try decoder.decode(categorywisevideoclass.self, from:
                data!) //Decode JSON Response Data
            print(model)
            completion(model)
            
            
        } catch let error as NSError {
        }
    }
    task.resume()
}
    
    
    
    func get_subscription_list(completion : @escaping (Subscriptionlistcalss) -> ())  {
        
        
        let poststring="user_id=\(userid)"
        
        var request = NSMutableURLRequest(url: APIEndPoint.get_subscription_list.url as URL)
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
                let model = try decoder.decode(Subscriptionlistcalss.self, from:
                    data!) //Decode JSON Response Data
                print(model)
                completion(model)
                
                
            } catch let error as NSError {
                print("eror.....")
            }
        }
        task.resume()
    }

    func apply_promo_code(completion : @escaping (Applypromocodeclass) -> ())  {
           
           
           let poststring="user_id=\(userid)&promo_code=\(promocode)&amount=\(amount)"
           
           var request = NSMutableURLRequest(url: APIEndPoint.apply_promo_code.url as URL)
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
                   let model = try decoder.decode(Applypromocodeclass.self, from:
                       data!) //Decode JSON Response Data
                   print(model)
                   completion(model)
                   
                   
               } catch let error as NSError {
                print("......")
               }
           }
           task.resume()
       }

    func get_exam_subscription_packages(completion : @escaping (Examsubscriptnclass) -> ())  {
        if let main_ctgry_id = UserDefaults.standard.value(forKey: "mainctgryid"){
            mainctgryid=UserDefaults.standard.value(forKey: "mainctgryid") as! String
        }
        if preliminary_flag==1{
           postring="user_id=\(userid)&main_category_id=\(mainctgryid)&preliminary_id=\(preliminary_id)"
        }else{
        postring="user_id=\(userid)&main_category_id=\(mainctgryid)&main_exam_id=\(preliminary_id)"
        }
        var request = NSMutableURLRequest(url: APIEndPoint.get_exam_subscription_packages.url as URL)
        request.httpMethod = "POST"
        request.httpBody = postring.data(using: String.Encoding.utf8)
        let task=URLSession.shared.dataTask(with: request as URLRequest){data,response,error in
            print("poststring",self.postring)
            //self.showIndicator(isHidden: true)
            if error != nil{
                print("error",error)
                return
            }
            let responsestring=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            
            print("respnsedate,\(responsestring)")
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode(Examsubscriptnclass.self, from:
                    data!) //Decode JSON Response Data
                print(model)
                completion(model)
                
                
            } catch let error as NSError {
             print("......")
            }
        }
        task.resume()
    }

    

}


