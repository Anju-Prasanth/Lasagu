//
//  Exclusivecoachingviewmodel.swift
//  Lasagu
//
//  Created by Arun Vijayan on 11/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//
class Exclusivecoachingviewmodel{
    var premiumcatid=String()
       var chapterid=String()
       var userid=UserDefaults.standard.value(forKey: "useridnew") as! Int
    
func get_chapter_wise_video(completion : @escaping (Getchapterwisevideoclass) -> ())  {
    
   
    
    let poststring="user_id=\(userid)&premium_category_id=\(premiumcatid)&chapter_id=\(chapterid)"
    print("poststring",poststring)
    
    var request = NSMutableURLRequest(url: APIEndPoint.get_chapter_wise_video.url as URL)
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
            let model = try decoder.decode(Getchapterwisevideoclass.self, from:
                data!) //Decode JSON Response Data
            print(model)
            completion(model)
            
            
        } catch let error as NSError {
        }
    }
    task.resume()
}

}
