//
//  OtpverificationViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 29/06/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit


 @available(iOS 13.0, *)
class OtpverificationViewController: UIViewController {
    
    @IBOutlet weak var lblotptimer: UILabel!
    @IBOutlet weak var txtfldeneterotp: UITextField!
    var details=[String:Any]()
    var otpmodel=Otpviewmodel()
    var timer:Timer!
     var totalTime = Int()
    var signupdatagot:[Signupdata]?
    var userid=Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOtpTimer()
        
    }
    override func viewWillAppear(_ animated: Bool)
          {
              super.viewWillAppear(animated)
              
              hideKeyboardWhenTappedAround()
       }
    private func startOtpTimer() {
           self.totalTime = 60
           self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
       }
       
       @objc func updateTimer() {
           print(self.totalTime)
           lblotptimer.text = "Didnt get OTP " + self.timeFormatted(self.totalTime)
           
           if totalTime != 0 {
               totalTime -= 1  // decrease counter timer
           } else {
               if let timer = self.timer {
                   timer.invalidate()
                   self.timer = nil
               }
           }
       }
       func timeFormatted(_ totalSeconds: Int) -> String {
           let seconds: Int = totalSeconds % 60
           let minutes: Int = (totalSeconds / 60) % 60
           return String(format: "%02d:%02d", minutes, seconds)
       }
    
    @IBAction func btnverifyotpaction(_ sender: Any) {
        if txtfldeneterotp.text?.count==0{
            self.showToast(message: "Please enter otp", font: UIFont.boldSystemFont(ofSize: 15), duration: 2)
            
        }else{
            otpmodel.otpenterd=txtfldeneterotp.text ?? ""
            otpmodel.verificationdetails=details
            otpmodel.user_sign_up_new_one{ (model) in
                self.signupdata(data:model)
                
            }
            
        }
    }
    
    
    func signupdata(data: Otpverify) {
        print("data",data)
        
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                
           self.signupdatagot=data.data
                self.userid=self.signupdatagot?[0].user_id ?? 0
                let loginname=String(self.signupdatagot?[0].psc_first_name ?? "")
                let email=self.signupdatagot?[0].psc_email ?? ""
                let phone=self.signupdatagot?[0].psc_phone ?? ""
                UserDefaults.standard.set(self.userid, forKey: "useridnew")
                 UserDefaults.standard.set(loginname, forKey: "username")
                UserDefaults.standard.set(email, forKey: "useremail")
                 UserDefaults.standard.set(phone, forKey: "userphone")
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                let homepage = self.storyboard?.instantiateViewController (withIdentifier: "HomepageViewController") as! HomepageViewController

                              self.navigationController?.pushViewController(homepage, animated: true)
            }
        }else{
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    @IBAction func btnresendotp(_ sender: Any) {
        let registrationmodel=Registrationviewmodel()
        registrationmodel.email=details["email"] as! String
        registrationmodel.mobile=details["mobile"] as! String
        registrationmodel.service_check_user_sign_up_new{ (model) in
            self.registerdata(data:model)
        }
        
    }
    
    func registerdata(data: Registration) {
        print("data",data)
        
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
                
            }
        }else{
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
    
    
    
}
