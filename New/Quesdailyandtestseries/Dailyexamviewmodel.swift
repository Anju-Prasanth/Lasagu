//
//  Dailyexamviewmodel.swift
//  Lasagu
//
//  Created by Arun Vijayan on 30/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation

class Dailyexamviewmodel{

    var dateselected=String()
    var mocktestseriesid=String()
    var dictmain=[String:Any]()
    var mock_test_series_id=String()
    var mock_result_id=Int()
    var chapterid=String()
    var year_id=String()
    var month_id=String()
    var ca_id=String()
    var ca_exam_result_id=Int()
    var weekexamid=String()
    var weekexamresultid=Int()
   
  
    var userid=UserDefaults.standard.value(forKey: "useridnew") as! Int
    func get_daily_exam_questions(completion : @escaping (Dailyexam) -> ())  {
      
        
        let poststring="user_id=\(userid)&date=\(dateselected)"
//         let poststring="user_id=1&date=2/8/20"
         print("poststring,\(poststring)")
        var request = NSMutableURLRequest(url: APIEndPoint.get_daily_exam_questions.url as URL)
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
                let model = try decoder.decode(Dailyexam.self, from:
                    data!) //Decode JSON Response Data
                print(model)
                completion(model)
                
                
            } catch let error as NSError {
            }
        }
        task.resume()
    }
    
    
    func get_mock_test_series_questions_new_ios(completion : @escaping (Testseriesquestion) -> ())  {
          
            
            let poststring="user_id=\(userid)&mock_test_series_id=\(mocktestseriesid)"
    //         let poststring="user_id=1&date=2/8/20"
             print("poststring,\(poststring)")
            var request = NSMutableURLRequest(url: APIEndPoint.get_mock_test_series_questions_new_ios.url as URL)
            request.httpMethod = "POST"
            request.httpBody = poststring.data(using: String.Encoding.utf8)
            let task=URLSession.shared.dataTask(with: request as URLRequest){data,response,error in
                
                //self.showIndicator(isHidden: true)
                if error != nil{
                    print("error",error)
                    return
                }
                let responsestring=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
                
                do {
                    
                    
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(Testseriesquestion.self, from:
                        data!) //Decode JSON Response Data
                   
                    completion(model)
                    
                    
                } catch let error as NSError {
                    print("error",error)
                }
            }
            task.resume()
        }
        
        func submit_daily_exam(completion : @escaping (Dailyexamanswersubmsn) -> ())  {
                 
                   
                 
                   var request = NSMutableURLRequest(url: APIEndPoint.submit_daily_exam.url as URL)
                   request.httpMethod = "POST"
                  guard let httpBody = try? JSONSerialization.data(withJSONObject: dictmain, options: .prettyPrinted) else {
                       return
                   }
               request.httpBody = httpBody
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
                           let model = try decoder.decode(Dailyexamanswersubmsn.self, from:
                               data!) //Decode JSON Response Data
                           print(model)
                           completion(model)
                           
                           
                       } catch let error as NSError {
                           print("error",error)
                       }
                   }
                   task.resume()
               }
               
    
    func submit_mock_test_question_new_one_latest(completion : @escaping (Reporttestseries) -> ())  {
                 
                   
                 
                var request = NSMutableURLRequest(url: APIEndPoint.submit_mock_test_question_new_one_latest.url as URL)
                   request.httpMethod = "POST"
                  guard let httpBody = try? JSONSerialization.data(withJSONObject: dictmain, options: .prettyPrinted) else {
                       return
                   }
               request.httpBody = httpBody
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
                           let model = try decoder.decode(Reporttestseries.self, from:
                               data!) //Decode JSON Response Data
                           print(model)
                           completion(model)
                           
                           
                       } catch let error as NSError {
                           print("error",error)
                       }
                   }
                   task.resume()
               }
               
    
    
    func mock_test_exam_solution_new(completion : @escaping (Solutionfortestseriesclass) -> ())  {
                    
                      
                    
                    let poststring="user_id=\(userid)&mock_test_series_id=\(mock_test_series_id)&mock_result_id=\(mock_result_id)"
                 
                            print("poststring,\(poststring)")
                           var request = NSMutableURLRequest(url: APIEndPoint.mock_test_exam_solution_new.url as URL)
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
                              let model = try decoder.decode(Solutionfortestseriesclass.self, from:
                                  data!) //Decode JSON Response Data
                              print(model)
                              completion(model)
                              
                              
                          } catch let error as NSError {
                              print("error",error)
                          }
                      }
                      task.resume()
                  }
                 
    func get_chapter_wise_exam(completion : @escaping (Chapterwiseexamclass) -> ())  {
                       
                         
                       
                    let poststring="user_id=\(userid)&chapter_id=\(chapterid)"
                    
                               print("poststring,\(poststring)")
                              var request = NSMutableURLRequest(url: APIEndPoint.get_chapter_wise_exam.url as URL)
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
                                 let model = try decoder.decode(Chapterwiseexamclass.self, from:
                                     data!) //Decode JSON Response Data
                                 print(model)
                                 completion(model)
                                 
                                 
                             } catch let error as NSError {
                                 print("error",error)
                             }
                         }
                         task.resume()
                     }
                     
    func submit_chapter_wise_exam(completion : @escaping (Submittchapterwiseexamclass) -> ())  {
      
        
      
     var request = NSMutableURLRequest(url: APIEndPoint.submit_chapter_wise_exam.url as URL)
        request.httpMethod = "POST"
       guard let httpBody = try? JSONSerialization.data(withJSONObject: dictmain, options: .prettyPrinted) else {
            return
        }
    request.httpBody = httpBody
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
                let model = try decoder.decode(Submittchapterwiseexamclass.self, from:
                    data!) //Decode JSON Response Data
                print(model)
                completion(model)
                
                
            } catch let error as NSError {
                print("error",error)
            }
        }
        task.resume()
    }
    
    func get_cf_year_month(completion : @escaping (Yearmonthclass) -> ())  {
          
            
            let poststring=""
    //         let poststring="user_id=1&date=2/8/20"
             print("poststring,\(poststring)")
            var request = NSMutableURLRequest(url: APIEndPoint.get_cf_year_month.url as URL)
            request.httpMethod = "GET"
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
                    let model = try decoder.decode(Yearmonthclass.self, from:
                        data!) //Decode JSON Response Data
                    print(model)
                    completion(model)
                    
                    
                } catch let error as NSError {
                }
            }
            task.resume()
        }
        
    func get_current_affairs_pdf(completion : @escaping (Currentpdfclass) -> ())  {
          
            
            let poststring="year_id=\(year_id)&month_id=\(month_id)"
    //         let poststring="user_id=1&date=2/8/20"
             print("poststring,\(poststring)")
            var request = NSMutableURLRequest(url: APIEndPoint.get_current_affairs_pdf.url as URL)
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
                    let model = try decoder.decode(Currentpdfclass.self, from:
                        data!) //Decode JSON Response Data
                    print(model)
                    completion(model)
                    
                    
                } catch let error as NSError {
                }
            }
            task.resume()
        }
        
    func get_current_affairs_questions(completion : @escaping (Currentaffairsqustnclass) -> ())  {
          
            
            let poststring="year_id=\(year_id)&month_id=\(month_id)&ca_id=\(ca_id)"
    //         let poststring="user_id=1&date=2/8/20"
             print("poststring,\(poststring)")
            var request = NSMutableURLRequest(url: APIEndPoint.get_current_affairs_questions.url as URL)
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
                    let model = try decoder.decode(Currentaffairsqustnclass.self, from:
                        data!) //Decode JSON Response Data
                    print(model)
                    completion(model)
                    
                    
                } catch let error as NSError {
                }
            }
            task.resume()
        }
        
    func submit_ca_exam(completion : @escaping (Submittcaexamclass) -> ())  {
          
            
            var request = NSMutableURLRequest(url: APIEndPoint.submit_ca_exam.url as URL)
                              request.httpMethod = "POST"
                             guard let httpBody = try? JSONSerialization.data(withJSONObject: dictmain, options: .prettyPrinted) else {
                                  return
                              }
           
            request.httpBody = httpBody
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
                    let model = try decoder.decode(Submittcaexamclass.self, from:
                        data!) //Decode JSON Response Data
                    print(model)
                    completion(model)
                    
                    
                } catch let error as NSError {
                    print("error",error)
                }
            }
            task.resume()
        }
        func ca_exam_solution(completion : @escaping (CAsolutionclass) -> ())  {
          
            if let caid=UserDefaults.standard.value(forKey: "ca_id") {
                ca_id=UserDefaults.standard.value(forKey: "ca_id") as! String
            }
            
            if let caexamresultid=UserDefaults.standard.value(forKey: "ca_exam_result_id") {
                ca_exam_result_id=UserDefaults.standard.value(forKey: "ca_exam_result_id") as! Int
            }
            
            
            
            let poststring="user_id=\(userid)&ca_id=\(ca_id)&ca_exam_result_id=\(ca_exam_result_id)"
                            
                                       print("poststring,\(poststring)")
                                      var request = NSMutableURLRequest(url: APIEndPoint.ca_exam_solution.url as URL)
                                      request.httpMethod = "POST"
                                      request.httpBody = poststring.data(using: String.Encoding.utf8)
            
            print("poststring",poststring)
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
                    let model = try decoder.decode(CAsolutionclass.self, from:
                        data!) //Decode JSON Response Data
                    print(model)
                    completion(model)
                    
                    
                } catch let error as NSError {
                }
            }
            task.resume()
        }
    

    
    func get_week_wise_exam_questions_new(completion : @escaping (Weekwiseexamqustnclass) -> ())  {
    
       
            let poststring="user_id=\(userid)&week_exam_id=\(weekexamid)"
    //         let poststring="user_id=1&date=2/8/20"
             print("poststring,\(poststring)")
            var request = NSMutableURLRequest(url: APIEndPoint.get_week_wise_exam_questions_new.url as URL)
            request.httpMethod = "POST"
            request.httpBody = poststring.data(using: String.Encoding.utf8)
            let task=URLSession.shared.dataTask(with: request as URLRequest){data,response,error in
                
                //self.showIndicator(isHidden: true)
                if error != nil{
                    print("error",error)
                    return
                }
                let responsestring=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                
               
                do {
                    
                    
                    let decoder = JSONDecoder()
                    let model = try decoder.decode(Weekwiseexamqustnclass.self, from:
                        data!) //Decode JSON Response Data
//                    print(model)
                    completion(model)
                    
                    
                } catch let error as NSError {
                }
            }
            task.resume()
        }
        
    
    
    func submit_week_wise_exam_new(completion : @escaping (Submitweekexamclass) -> ())  {
          
           
                var request = NSMutableURLRequest(url: APIEndPoint.submit_week_wise_exam_new.url as URL)
                request.httpMethod = "POST"
               guard let httpBody = try? JSONSerialization.data(withJSONObject: dictmain, options: .prettyPrinted) else {
                    return
                }
        print("dictmain",dictmain)
            request.httpBody = httpBody
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
                        let model = try decoder.decode(Submitweekexamclass.self, from:
                            data!) //Decode JSON Response Data
                        print(model)
                        completion(model)
                        
                        
                    } catch let error as NSError {
                        print("error",error)
                    }
                }
                task.resume()
            }
        
     func week_exam_solution_new(completion : @escaping (weeksolutionclass) -> ())  {
             
               
               let poststring="user_id=\(userid)&week_exam_id=\(weekexamid)&week_exam_result_id=\(weekexamresultid)"
       //         let poststring="user_id=1&date=2/8/20"
                print("poststring,\(poststring)")
               var request = NSMutableURLRequest(url: APIEndPoint.week_exam_solution_new.url as URL)
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
                       let model = try decoder.decode(weeksolutionclass.self, from:
                           data!) //Decode JSON Response Data
                       print(model)
                       completion(model)
                       
                       
                   } catch let error as NSError {
                   }
               }
               task.resume()
           }
    
   
           
}
