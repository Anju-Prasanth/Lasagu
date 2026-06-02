//
//  ProfileeditViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 20/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import MaterialComponents
  @available(iOS 13.0, *)
class ProfileeditViewController: UIViewController {

    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var txfldpincode: MDCTextField!
    @IBOutlet weak var txtfldemail: MDCTextField!
    @IBOutlet weak var txtfldlastname: MDCTextField!
    @IBOutlet weak var txtfldfirstname: MDCTextField!
    @IBOutlet weak var viewedit: UIView!
    var txtfldlastnameController: MDCTextInputControllerOutlined?
    var txtfldfirstnameController: MDCTextInputControllerOutlined?
    
    var txtfldemailController:MDCTextInputControllerOutlined?
    var txtfldpincodeController:MDCTextInputControllerOutlined?
    var loginviewmodel=LoginViewModel()
    var userid=Int()
    var theme=Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewedit.setShadowEffect()
        userid=UserDefaults.standard.value(forKey: "useridnew") as! Int
     txtfldlastnameController = MDCTextInputControllerOutlined(textInput: txtfldlastname)
        txtfldfirstnameController = MDCTextInputControllerOutlined(textInput: txtfldfirstname)
         txtfldemailController = MDCTextInputControllerOutlined(textInput: txtfldemail)
         txtfldpincodeController = MDCTextInputControllerOutlined(textInput: txfldpincode)
    }
    
    
    override func viewWillAppear(_ animated: Bool)
          {
              super.viewWillAppear(animated)
              
              hideKeyboardWhenTappedAround()
        
        if let mode=UserDefaults.standard.value(forKey: "mode"){
            theme=UserDefaults.standard.value(forKey: "mode") as! Int
            
        }
        
if theme==0{
    overrideUserInterfaceStyle = .light
    btnback.setBackgroundImage(UIImage(named: "arrow-left-solid"), for: .normal)
   
}else{
overrideUserInterfaceStyle = .dark
    btnback.setBackgroundImage(UIImage(named: "backarrow-white"), for: .normal)

}
        
    
       }
    
    
    @IBAction func btnbackaction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

    @IBAction func btnupdateaction(_ sender: Any) {
        loginviewmodel.firstname=txtfldfirstname.text ?? ""
        loginviewmodel.lastname=txtfldlastname.text ?? ""
        loginviewmodel.userid=userid
        loginviewmodel.email=txtfldemail.text ?? ""
        loginviewmodel.pincode=txfldpincode.text ?? ""
        loginviewmodel.update_user_profile{(model) in
                       self.updateuserprofiledata(data:model)
                   }
        
    }
    func updateuserprofiledata(data: updateuserprofile){
        let status=data.status
               if status==true{
                   DispatchQueue.main.async{
                      
                       let myaccount = self.storyboard?.instantiateViewController (withIdentifier: "MyaccountViewController") as! MyaccountViewController

                                     self.navigationController?.pushViewController(myaccount, animated: true)
                   }
               }else{
                   DispatchQueue.main.async{
                       self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
                   }
               }
             
    }
   

}
