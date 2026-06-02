//
//  ForgotpasswordViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 29/06/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import MaterialComponents
 @available(iOS 13.0, *)

class ForgotpasswordViewController: UIViewController {
    
    @IBOutlet weak var viewfrgotpswrd: UIView!
  
    
    
    @IBOutlet weak var txtfldemail: MDCTextField!
    var forgotpasswordmodel=Forgotpasswordviewmodel()
    var emailcontroller:MDCTextInputControllerOutlined?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewfrgotpswrd.setShadowEffect()
        emailcontroller=MDCTextInputControllerOutlined(textInput: txtfldemail)
    }
    override func viewWillAppear(_ animated: Bool)
          {
              super.viewWillAppear(animated)
              
              hideKeyboardWhenTappedAround()
       }
    
    
    @IBAction func btnsendotpaction(_ sender: Any) {
        if txtfldemail.text?.count==0{
            self.showToast(message: "Please enter email", font: UIFont.boldSystemFont(ofSize: 15), duration: 2)
            
        }else{
            forgotpasswordmodel.emailentered=txtfldemail.text ?? ""
            forgotpasswordmodel.forgot_password{ (model) in
                self.forgotpassword(data:model)
                
            }
            
        }
        
        
    }
    
    
    @IBAction func btnalreadyhvacnt(_ sender: Any) {
        
        let login = self.storyboard?.instantiateViewController (withIdentifier: "LoginViewController") as! LoginViewController
        
        self.navigationController?.pushViewController(login, animated: true)
        
        
    }
    
    func forgotpassword(data: Forgotpassword) {
        print("data",data)
        
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                let otpforgotpassword = self.storyboard?.instantiateViewController (withIdentifier: "OtpforgotpaswrdViewController") as! OtpforgotpaswrdViewController
                otpforgotpassword.email=self.txtfldemail.text!
                self.navigationController?.pushViewController(otpforgotpassword, animated: true)
                
            }
        }else{
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
    
}
