//
//  LoginViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 29/06/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import MaterialComponents
import Reachability
import NetworkExtension


extension UIViewController{
    
    func showToast(message : String, font: UIFont , duration: Double) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/4 - 85, y: self.view.frame.size.height-100, width: UIScreen.main.bounds.width-30, height: 40))
        //toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.backgroundColor = UIColor.systemGreen
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 5;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
func showToast1(message : String, font: UIFont , duration: Double) {
       
       let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/4 - 85, y: self.view.frame.size.height-100, width: UIScreen.main.bounds.width-30, height: 40))
       //toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
       toastLabel.backgroundColor = UIColor.systemRed
       toastLabel.textColor = UIColor.white
       toastLabel.font = font
       toastLabel.textAlignment = .center;
       toastLabel.text = message
       toastLabel.alpha = 1.0
       toastLabel.layer.cornerRadius = 5;
       toastLabel.clipsToBounds  =  true
       self.view.addSubview(toastLabel)
    UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut, animations: {
           toastLabel.alpha = 0.0
       }, completion: {(isCompleted) in
           toastLabel.removeFromSuperview()
       })
   }
    
}

func showAlert(text:String, classInstance:UIViewController) {
    let alert = UIAlertController(title: "Alert", message: text, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
        switch action.style{
        case .default:
            print("default")
            
        case .cancel:
            print("cancel")
            
        case .destructive:
            print("destructive")
            
            
        }}))
    classInstance.present(alert, animated: true, completion: nil)
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

 @available(iOS 13.0, *)

class LoginViewController: UIViewController{
    @IBOutlet weak var viewlogin: UIView!
    
   
    @IBOutlet weak var txtfldemailoutlined: MDCTextField!
   
    @IBOutlet weak var txtfldpassword: MDCTextField!
    
    var reachability:Reachability!
    var helper=LoginHelper()
    var userID:String?
    var noInternetView:NoInternetView?
    var  loginviewmodel=LoginViewModel()
   var emailIdController: MDCTextInputControllerOutlined?
    var passwordcontroller: MDCTextInputControllerOutlined?
    var userid=String()
    var logindata:[LoginData]?
    var user_id=String()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewlogin.setShadowEffect()
        emailIdController = MDCTextInputControllerOutlined(textInput: txtfldemailoutlined)
        passwordcontroller = MDCTextInputControllerOutlined(textInput: txtfldpassword)
    }
    override func viewWillAppear(_ animated: Bool)
       {
           super.viewWillAppear(animated)
           
           hideKeyboardWhenTappedAround()
//         UIApplication.shared.statusBarView?.backgroundColor = .systemIndigo
    }
    
    private func useData(data: Json4Swift_Base) {
          print("data",data)
       
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                self.logindata=data.data
                //self.userid=self.logindata?[0].psc_user_id ?? ""
                let loginname=String(self.logindata?[0].psc_first_name ?? "")
                let email=self.logindata?[0].psc_email ?? ""
                let phone=self.logindata?[0].psc_phone ?? ""
                UserDefaults.standard.set(self.userid, forKey: "userid")
                 UserDefaults.standard.set(loginname, forKey: "username")
                UserDefaults.standard.set(email, forKey: "useremail")
                 UserDefaults.standard.set(phone, forKey: "userphone")
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
               // self.loginviewmodel.userid = self.userid
                 
                 
                self.loginviewmodel.get_fcm_token{ (model) in
                     self.get_fcmdata(data:model)
                 }
                
                
                let homepage = self.storyboard?.instantiateViewController (withIdentifier: "HomepageViewController") as! HomepageViewController

                        self.navigationController?.pushViewController(homepage, animated: true)
               
               

                
                
            }
        }else{
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
      }
    
    private func get_fcmdata(data: Fcmtokenclass) {
             print("data",data)
          
           let status=data.status
           if status==true{
               DispatchQueue.main.async{
                  

                   
                   
               }
           }else{
               DispatchQueue.main.async{
                  
               }
           }
         }
    
    
    
       
    
    @IBAction func btnfrgotpswrdaction(_ sender: Any) {
        let forgotpswrd = self.storyboard?.instantiateViewController (withIdentifier: "ForgotpasswordViewController") as! ForgotpasswordViewController

               self.navigationController?.pushViewController(forgotpswrd, animated: true)

    }
//
//
//
    @IBAction func btncontinuuepressed(_ sender: Any) {
        if txtfldemailoutlined.text?.count == 0 {
            self.showToast(message: "Please enter registered email id", font: UIFont.boldSystemFont(ofSize: 14),duration: 2)

        }else  if txtfldpassword.text?.count == 0{
            self.showToast(message: "Please enter password", font: UIFont.boldSystemFont(ofSize: 14),duration: 2)

        }else{
           // loginviewmodel.userid=user_id
            loginviewmodel.username=txtfldemailoutlined.text ?? ""
            loginviewmodel.password=txtfldpassword.text ?? ""
            
           loginviewmodel.loginUser{ (model) in
                self.useData(data:model)
            }
        }
    }
//
//
//
//
    @IBAction func btndonthaveaccountaction(_ sender: Any) {
       let registration = self.storyboard?.instantiateViewController (withIdentifier: "RegistrationViewController") as! RegistrationViewController

        self.navigationController?.pushViewController(registration, animated: true)

    }
//
//
//    func loginUser(username:String,password:String)  {
//
//        guard ((NetworkManager.sharedInstance.reachability?.connection ?? .unavailable) != .unavailable) else {
//            checkInternetAvailability()
//            return
//        }
//
//
//
//        //self.showIndicator(isHidden: false)
//        let url = URL(string: "http://pscrank.com/psc_coaching_admin/api/Data/login_user_new")!
//        let poststring="username=\(username)&password=\(password)&device_id=2"
//
//        var request = NSMutableURLRequest(url: url as URL)
//        request.httpMethod = "POST"
//        request.httpBody = poststring.data(using: String.Encoding.utf8)
//        let task=URLSession.shared.dataTask(with: request as URLRequest){data,response,error in
//
//            //self.showIndicator(isHidden: true)
//            if error != nil{
//                print("error",error)
//                return
//            }
//            let responsestring=NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//
//            print("respnsedate,\(responsestring)")
//            do {
//
//                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
//
//                if let parseJson = json{
//                    let status=parseJson["status"]as! Bool
//                    let message=parseJson["message"] as! String
//                    if status==true{
//                        let dataarray=parseJson["data"] as! NSArray
//                        for value in dataarray{
//                            let item=value as! [String:Any]
//                        let psc_user_id=item["psc_user_id"] as! String
//                        let psc_first_name=item["psc_first_name"] as! String
//                        let psc_last_name=item["psc_last_name"] as! String
//                        let psc_email=item["psc_email"] as! String
//                        let psc_phone=item["psc_phone"] as! String
//                        let userInfo = ["name":psc_first_name, "phone":psc_phone,"email": psc_email,"userid": psc_user_id] as [String : Any]
//                        UserDefaults.standard.set(userInfo, forKey: "UserData")
//                        let userdata = UserDefaults.standard.dictionary(forKey: "UserData")
//                        print("userdata",userdata)
//                        }
//                        DispatchQueue.main.async {
//                            self.showToast(message: message, font: UIFont.boldSystemFont(ofSize: 14),duration: 2)
//
//
//                        }
//                    }else{
//                        DispatchQueue.main.async {
//                            self.showToast(message: message, font: UIFont.boldSystemFont(ofSize: 14),duration: 2)
//                        }
//                    }
//                } else {
//                    DispatchQueue.main.async{
//                        showAlert(text: "Please check your credentials", classInstance: self)
//                    }
//                }
//
//            } catch let error as NSError {
//            }
//        }
//        task.resume()
//    }
//    func populateCell(data:[String:Any]) {
//    }
//
//}
//
//extension LoginViewController : NoInternetViewDelegate {
//func retry() {
//
//}
//
//func checkInternetAvailability() {
//
//    let connection = (NetworkManager.sharedInstance.reachability?.connection ?? .unavailable)
//
//    if connection == .unavailable {
//        guard self.noInternetView == nil else {
//            return
//        }
//        self.noInternetView = NoInternetView.fromNib(named: "NoInternetView")
//        self.noInternetView?.retryButton.isHidden = true
//        self.noInternetView?.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 45, width: UIScreen.main.bounds.size.width, height: 45)
//        self.noInternetView?.viewDelegate = self
//        self.view.addSubview(self.noInternetView!);
//        self.view.bringSubviewToFront(self.noInternetView!)
//    } else {
//        self.noInternetView?.removeFromSuperview()
//        self.noInternetView = nil
//    }
//
//}
//
//@objc func networkStatusChanged() {
//    checkInternetAvailability()
//}
}
