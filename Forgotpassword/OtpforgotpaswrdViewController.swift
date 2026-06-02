//
//  OtpforgotpaswrdViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 16/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import MaterialComponents

@available(iOS 13.0, *)

class OtpforgotpaswrdViewController: UIViewController {
    
    @IBOutlet weak var viewotpforgotpassword: UIView!
   
    @IBOutlet weak var txtfldpassword: MDCTextField!
    @IBOutlet weak var txtfldotp: MDCTextField!
    @IBOutlet weak var txtfldemail: MDCTextField!
    
   
    var forgotpassword=Forgotpasswordviewmodel()
    var email=String()
    var passwordcontroller:MDCTextInputControllerOutlined?
    var otpcontroller:MDCTextInputControllerOutlined?
    var emailcontroller:MDCTextInputControllerOutlined?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailcontroller = MDCTextInputControllerOutlined(textInput: txtfldemail)
        passwordcontroller = MDCTextInputControllerOutlined(textInput: txtfldpassword)
        otpcontroller = MDCTextInputControllerOutlined(textInput: txtfldotp)
              
        viewotpforgotpassword.setShadowEffect()
        txtfldemail.isUserInteractionEnabled=false
        txtfldemail.text=email
        
    }
    
    @IBAction func btnsubmitpswrdaction(_ sender: Any) {
        if txtfldotp.text?.count==0{
            self.showToast(message: "Please enter otp", font: UIFont.boldSystemFont(ofSize: 15), duration: 2)
            
        }else if txtfldpassword.text?.count==0{
            self.showToast(message: "Please enter password", font: UIFont.boldSystemFont(ofSize: 15), duration: 2)
        }else{
            forgotpassword.otpentered=txtfldotp.text ?? ""
            forgotpassword.emailentered=email; forgotpassword.password=txtfldpassword.text ?? ""
            forgotpassword.update_password{ (model) in
                self.updatepassword(data:model)
            }
        }
    }
    
    
    func updatepassword(data: Updatepassword) {
        print("data",data)
        
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                let login = self.storyboard?.instantiateViewController (withIdentifier: "LoginViewController") as! LoginViewController
                       
                       self.navigationController?.pushViewController(login, animated: true)
                
                
            }
        }else{
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
    
    
    
    
    @IBAction func btnalreadyhvacntaction(_ sender: Any) {
        let login = self.storyboard?.instantiateViewController (withIdentifier: "LoginViewController") as! LoginViewController
        
        self.navigationController?.pushViewController(login, animated: true)
        
        
    }
    
    
}
