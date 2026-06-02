//
//  RegistrationViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 29/06/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import  NKVPhonePicker
import MaterialComponents

 @available(iOS 13.0, *)
class RegistrationViewController: UIViewController,UITextFieldDelegate{
    
   
    @IBOutlet weak var txtfldpassword: MDCTextField!
    @IBOutlet weak var txtfldemail: MDCTextField!
    @IBOutlet weak var txtfldlastname: MDCTextField!
    @IBOutlet weak var txtfldfirstname: MDCTextField!
    @IBOutlet weak var txtfldphonenumber: UITextField!
   
    @IBOutlet weak var txtfldphonrpicker: NKVPhonePickerTextField!
   
   
    
    @IBOutlet weak var viewregister: UIView!
    var registrationdetails=[String:Any]()
    var registrationmodel=Registrationviewmodel()
    var passwordcontroller: MDCTextInputControllerOutlined?
    var firstnamecontroller:MDCTextInputControllerOutlined?
    var lastnamecontroller:MDCTextInputControllerOutlined?
    var emailcontroller:MDCTextInputControllerOutlined?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtfldphonrpicker.delegate=self
       
        txtfldphonenumber.setLeftPaddingPoints(20)
        viewregister.setShadowEffect()
        passwordcontroller = MDCTextInputControllerOutlined(textInput: txtfldpassword)
        firstnamecontroller = MDCTextInputControllerOutlined(textInput: txtfldfirstname)
        lastnamecontroller = MDCTextInputControllerOutlined(textInput: txtfldlastname)
        emailcontroller = MDCTextInputControllerOutlined(textInput: txtfldemail)
        txtfldphonrpicker.layer.cornerRadius=5
        txtfldphonrpicker.layer.borderWidth=1
        txtfldphonrpicker.layer.borderColor=UIColor.lightGray.cgColor
        
        txtfldphonenumber.layer.cornerRadius=5
        txtfldphonenumber.layer.borderWidth=1
        txtfldphonenumber.layer.borderColor=UIColor.lightGray.cgColor
        txtfldphonrpicker.phonePickerDelegate = self
        // topTextField.favoriteCountriesLocaleIdentifiers = ["RU", "ER", "JM"]
        txtfldphonrpicker.rightToLeftOrientation = false
        txtfldphonrpicker.shouldScrollToSelectedCountry = false
        txtfldphonrpicker.flagSize = CGSize(width: 30, height: 50)
        txtfldphonrpicker.enablePlusPrefix = true
        txtfldphonrpicker.setCurrentCountryInitially = false
        
        // Setting initial custom country
      //  let source = NKVSource(countryCode: "IN")
       let source = NKVSource(countryCode: "IN")
        txtfldphonrpicker.preFillText(source: source, number: 91)
        
        
        
              
        
    }
    override func viewWillAppear(_ animated: Bool)
          {
              super.viewWillAppear(animated)
              
              hideKeyboardWhenTappedAround()
       }
    
    @IBAction func btncontinueaction(_ sender: Any) {
        
        if(txtfldfirstname.text == ""){
            
            self.showToast(message: "Please enter your first name", font: UIFont.boldSystemFont(ofSize: 15), duration: 2)
            
        }
        else if (txtfldemail.text == ""){
            
            self.showToast(message: "Please enter your email", font: UIFont.boldSystemFont(ofSize: 15), duration: 2)
            
        }
        else if (txtfldphonenumber.text == ""){
            
            self.showToast(message: "Please enter your phone number", font: UIFont.boldSystemFont(ofSize: 15), duration: 2)
            
        }
        else if (txtfldpassword.text == ""){
            
            self.showToast(message: "Please enter your password", font: UIFont.boldSystemFont(ofSize: 15), duration: 2)
            
        }
        else if (txtfldlastname.text == ""){
            
            self.showToast(message: "Please enter your last name", font: UIFont.boldSystemFont(ofSize: 15), duration: 2)
            
        }
        else if !isPasswordValid(txtfldpassword.text!){
            
            self.showToast(message: "Invalid Password", font: UIFont.boldSystemFont(ofSize: 15), duration: 2)
            
        }
        else if(txtfldpassword.text!.count < 8){
            
            self.showToast(message: "Please enter password with atleast 8 characters", font: UIFont.boldSystemFont(ofSize: 13), duration: 2)
        }
           
            
        else if !isValidEmail(testStr: txtfldemail.text!){
            
            self.showToast(message: "Please enter valid email id", font: UIFont.boldSystemFont(ofSize: 15), duration: 2)
            
        }
            
        else{
           
            let ts=txtfldphonrpicker.plusLabel?.text
            print("ts",ts)
            let phone=ts!+txtfldphonrpicker.text+txtfldphonenumber.text!
           
//
            print("phone",phone)
            registrationdetails=["first_name":txtfldfirstname.text ?? "","last_name":txtfldlastname.text ?? "","email":txtfldemail.text ?? "","mobile":phone,"password":txtfldpassword.text ?? ""]
           
            registrationmodel.mobile=phone
            registrationmodel.email=txtfldemail.text ?? ""
            registrationmodel.service_check_user_sign_up_new{ (model) in
            self.registerdata(data:model)
            }
           
        }
        
    }
   
    
 func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         if textField == txtfldphonrpicker {
        return false
         }else{
            return true
        }
    }
    
    
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^[A-Za-z\\d$@$#!%*?&]{1,}")
        return passwordTest.evaluate(with: password)
    }
    
    func countriesViewController(_ sender: CountriesViewController, didSelectCountry country: Country) {
        //

       
    }
    @IBAction func btnalreadyhaveaccount(_ sender: Any) {
        
        let login = self.storyboard?.instantiateViewController (withIdentifier: "LoginViewController") as! LoginViewController
        
        self.navigationController?.pushViewController(login, animated: true)
    }
    
     func registerdata(data: Registration) {
        print("data",data)
     
      let status=data.status
      if status==true{
          DispatchQueue.main.async{
              self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
            let otpverification = self.storyboard?.instantiateViewController (withIdentifier: "OtpverificationViewController") as! OtpverificationViewController
            otpverification.details=self.registrationdetails
            self.navigationController?.pushViewController(otpverification, animated: true)
          }
      }else{
          DispatchQueue.main.async{
              self.showToast(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
          }
      }
    }
    
   
    
    
    
    
}

