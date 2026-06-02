//
//  Insertcommentviewmodel.swift
//  Lasagu
//
//  Created by Arun Vijayan on 01/02/21.
//  Copyright © 2021 Arun Vijayan. All rights reserved.
//

import Foundation


//class Insertcommentviewmodel{
//    
//var userid=Int()
//var mainctgryid=String()
//    
//    func updateUserDataedit(image:UIImage,week_id:String,preliminary_id:String,preliminaryflag:Int,comment_id:String,comment:String) -> Observable<InsertcommentData> {
//        return Observable.create { observer in
//            if let user_id=UserDefaults.standard.value(forKey: "useridnew"){
//                self.userid=UserDefaults.standard.value(forKey: "useridnew") as! Int
//            }
//             if let main_ctgry_id = UserDefaults.standard.value(forKey: "mainctgryid"){
//                self.mainctgryid=UserDefaults.standard.value(forKey: "mainctgryid") as! String
//                }
//     
//            var parameter = [String: Any]()
//            parameter["main_category_id"]=self.mainctgryid
//            parameter["user_id"] = self.userid
//            parameter["week_id"]=week_id
//            if preliminaryflag==1{
//            parameter["preliminary_id"]=preliminary_id
//        }else{
//             parameter["main_exam_id"]=preliminary_id
//        }
//            parameter["comment_id"] = comment_id
//            parameter["comment"] = comment
//print("parameter",parameter)
//            let dataImage = image.jpegData(compressionQuality: 0.5)
//
//            // Request
//                WebserviceRequest.shared.updateProfileeditMultiPart(imgData: dataImage!, parameter: parameter) {
//                (success, message, responseObject, error) in
//                if success {
//
//                    if let response = responseObject as? Insertcommentclass {
//                        if let status = response.status {
//                            if status {
//                                if let data =  response.data {
//                                    observer.onNext(data)
//                                }
//                            }
//                        }
//                    }
//
//                } else {
//                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Failed to update user data"])
//                    observer.onError(error)
//                }
//            }
//            return Disposables.create()
//        }
//    }
//
//}
