//
//  WebServiceManager.swift
//  Lasagu
//
//  Created by Arun Vijayan on 01/02/21.
//  Copyright © 2021 Arun Vijayan. All rights reserved.
//

import Foundation
import Alamofire
//import ObjectMapper
//import AlamofireObjectMapper

//class WebserviceManager {
//    
//    static let shared = WebserviceManager()
//    
//    // MARK: - Webservice
//    
//    
//    func requestMultipart<T: Mappable>(with imageKey:String, imageData: Data, url: String, method: HTTPMethod, parameter: [String: Any], header: HTTPHeaders?, mappableOf: T.Type, completionHandler: @escaping WebServiceCompletionHandler) {
//
//        upload(multipartFormData: { (multiPart) in
//            for (key, value) in parameter {
//                if let temp = value as? String {
//                    multiPart.append(temp.data(using: .utf8)!, withName: key)
//                }
//                if let temp = value as? Int {
//                    multiPart.append("\(temp)".data(using: .utf8)!, withName: key)
//                }
//                if let temp = value as? NSArray {
//                    temp.forEach({ element in
//                        let keyObj = key + "[]"
//                        if let string = element as? String {
//                            multiPart.append(string.data(using: .utf8)!, withName: keyObj)
//                        } else
//                            if let num = element as? Int {
//                                let value = "\(num)"
//                                multiPart.append(value.data(using: .utf8)!, withName: keyObj)
//                        }
//                    })
//                }
//            }
//
//            multiPart.append(imageData, withName: imageKey, fileName: "image1.png", mimeType: "image/png")
//        }, to: url, method: method, headers: header) { response in
//
//            switch response {
//            case .success(let upload, _, _):
//
//                upload.responseObject  { (response: DataResponse<T>) in
//
//                    print("respose:::\(response)")
//
//                    switch response.result {
//
//                    case .success(let successResult): // Success 200
//
//                        print("Success::::\(successResult.toJSON())")
//                        completionHandler(true, nil, successResult as AnyObject, nil)
//                    case.failure(let error): // Failed
//                        if let statusCode = response.response?.statusCode {
//                            print("status code::\(statusCode)")
//                            if statusCode == 500 { // Server error
//                                completionHandler(false, "Please try again later.", nil, error as NSError)
//                            } else { // Validation
//                                //                                completionHandler(false, "NetworkError", nil, error as NSError)
//                                if let responseData = response.data {
//                                    if let content = String(data: responseData, encoding: String.Encoding.utf8) {
//                                        // here `content` is the JSON dictionary containing the String
//                                        print(content)
//                                        //                                            let objectOfContent = CommonResponseError(JSONString: content)
//                                        //                                            completionHandler(false, "objectOfContent?.message", objectOfContent as AnyObject, error as NSError)
//                                    } else {
//                                        completionHandler(false, "Please try again later.", nil, error as NSError)
//                                    }
//                                } else {
//                                    completionHandler(false, "Please try again later.", nil, error as NSError)
//                                }
//                            }
//                        } else { // Network error
//                            completionHandler(false, "Network Failure", nil, error as NSError)
//                            //                                displayToastMessage(checkNetworkError(error))
//                        }
//                    }
//                }
//
//                break
//            case .failure(let encodingError):
//                print("err is \(encodingError)")
//                completionHandler(false, "checkNetworkError(error)", nil, nil)
//                break
//            }
//        }
//
//    }
//    
//        // Alamofire Request method
//        func request<T: Mappable>(with url: String, method: HTTPMethod, parameter: [String: Any]?, header: HTTPHeaders?, mappableOf: T.Type, completionHandler: @escaping WebServiceCompletionHandler) {
//
//            DispatchQueue.global(qos: .background).async {
//                let manager = Alamofire.SessionManager.default
//                manager.session.configuration.timeoutIntervalForRequest = 60
//                // Alamofire Request
//                manager.request(url, method: method, parameters: parameter,encoding: URLEncoding.default , headers: header)
//                    .validate()
//                    .responseObject { (response: DataResponse<T>) in
//                        
//                        print("respose:::\(response)")
//
//                        switch response.result {
//
//                        case .success(let successResult): // Success 200
//                            
//                            
//                            print("Success::::\(successResult.toJSON())")
//                            completionHandler(true, "Uploaded successfully", successResult as AnyObject, nil)
//                        case.failure(let error): // Failed
//                            if let statusCode = response.response?.statusCode {
//                                 print("status code::\(statusCode)")
//                                if statusCode == 500 { // Server error
//                                    completionHandler(false, "Please try again later.", nil, error as NSError)
//                                } else { // Validation
//    //                                completionHandler(false, "NetworkError", nil, error as NSError)
//                                    if let responseData = response.data {
//                                        if let content = String(data: responseData, encoding: String.Encoding.utf8) {
//                                            // here `content` is the JSON dictionary containing the String
//                                            print(content)
////                                            let objectOfContent = CommonResponseError(JSONString: content)
////                                            completionHandler(false, "objectOfContent?.message", objectOfContent as AnyObject, error as NSError)
//                                        } else {
//                                            completionHandler(false, "Please try again later.", nil, error as NSError)
//                                        }
//                                    } else {
//                                        completionHandler(false, "Please try again later.", nil, error as NSError)
//                                    }
//                                }
//                            } else { // Network error
//                                completionHandler(false, "Network Failure", nil, error as NSError)
////                                displayToastMessage(checkNetworkError(error))
//                            }
//                        }
//                    }
//            }
//        }
//
//    
//}
