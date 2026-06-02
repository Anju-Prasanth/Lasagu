//
//  Paymentviewmodel.swift
//  Lasagu
//
//  Created by Arun Vijayan on 21/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

class Paymentviewmodel{
    var mock_category_id=String()
    var transactionid=String()
    var video_package_id=String()
    var subscription_id=String()
    var paymenttype=String()
    var paymentstatus=String()
    var pscvideoperiod=String()
    var catgryidforexam=String()
    
    var userid=UserDefaults.standard.value(forKey: "useridnew") as! Int

    func submit_mock_test_payment(completion : @escaping (Paymentsuccessclass) -> ())  {
        
        
        let poststring="user_id=\(userid)&mock_category_id=\(mock_category_id)&transaction_id=\(transactionid)&mock_period=1&payment_status=\(paymentstatus)&payment_type=\(paymenttype)"
        print("poststring",poststring)
        var request = NSMutableURLRequest(url: APIEndPoint.submit_mock_test_payment.url as URL)
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
                let model = try decoder.decode(Paymentsuccessclass.self, from:
                    data!) //Decode JSON Response Data
                print(model)
                completion(model)
                
                
            } catch let error as NSError {
            }
        }
        task.resume()
    }
    
    func submit_coaching_payment(completion : @escaping (Paymentsuccessclass) -> ())  {
        
        
       let poststring="user_id=\(userid)&video_package_id=\(video_package_id)&transaction_id=\(transactionid)&payment_type=\(paymenttype)&payment_status=\(paymentstatus)&video_package_period=\(pscvideoperiod)"
         print("poststring",poststring)
        var request = NSMutableURLRequest(url: APIEndPoint.submit_coaching_payment.url as URL)
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
                let model = try decoder.decode(Paymentsuccessclass.self, from:
                    data!) //Decode JSON Response Data
                print(model)
                completion(model)
                
                
            } catch let error as NSError {
            }
        }
        task.resume()
    }
    
    func submit_subscription_payment(completion : @escaping (Paymentsuccessclass) -> ())  {
        
        
       let poststring="user_id=\(userid)&subscription_id=\(subscription_id)&transaction_id=\(transactionid)&payment_type=\(paymenttype)&payment_status=\(paymentstatus)"
         print("poststring",poststring)
        var request = NSMutableURLRequest(url: APIEndPoint.submit_subscription_payment.url as URL)
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
                let model = try decoder.decode(Paymentsuccessclass.self, from:
                    data!) //Decode JSON Response Data
                print(model)
                completion(model)
                
                
            } catch let error as NSError {
            }
        }
        task.resume()
    }
    
    func submit_week_category_packages(completion : @escaping (Paymentsuccessclass) -> ())  {
        
        
       let poststring="user_id=\(userid)&transaction_id=\(transactionid)&payment_type=\(paymenttype)&payment_status=\(paymentstatus)&category_id=\(catgryidforexam)&category_package_id=\(subscription_id)"
         print("poststring",poststring)
        var request = NSMutableURLRequest(url: APIEndPoint.submit_week_category_packages.url as URL)
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
                let model = try decoder.decode(Paymentsuccessclass.self, from:
                    data!) //Decode JSON Response Data
                print(model)
                completion(model)
                
                
            } catch let error as NSError {
            }
        }
        task.resume()
    }
    
    
    func submit_week_wise_subscription(completion : @escaping (Paymentsuccessclass) -> ())  {
        
        
       let poststring="user_id=\(userid)&transaction_id=\(transactionid)&payment_type=\(paymenttype)&payment_status=\(paymentstatus)&subscription_id=\(subscription_id)"
         print("poststring",poststring)
        var request = NSMutableURLRequest(url: APIEndPoint.submit_week_wise_subscription.url as URL)
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
                let model = try decoder.decode(Paymentsuccessclass.self, from:
                    data!) //Decode JSON Response Data
                print(model)
                completion(model)
                
                
            } catch let error as NSError {
            }
        }
        task.resume()
    }




}
