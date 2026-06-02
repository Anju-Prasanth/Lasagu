//
//  ContactusViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 13/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class ContactusViewController: UIViewController,UITextViewDelegate {
    @IBOutlet weak var txtfldsubject: UITextField!
    
    @IBOutlet weak var viewprofile: UIView!
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var btnmyprofile: UIButton!
    @IBOutlet weak var btnslideoutmenu: UIButton!
    @IBOutlet weak var btnsendmsage: UIButton!
    
    @IBOutlet weak var lblmessage: UILabel!
    var slidereportmodel=Slidereportviewmodel()
    @IBOutlet weak var txtviewmessage: UITextView!
    
    var username=String()
    var theme=Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtfldsubject.setLeftPaddingPoints(10)
        
        txtfldsubject.setShadowEffect()
        //txtfldsubject.layer.cornerRadius=10
        
      txtviewmessage.clipsToBounds = false
        txtviewmessage.setShadowEffect()
        txtviewmessage.layer.shadowOpacity=0.4
        txtviewmessage.layer.shadowOffset = CGSize(width: 3, height: 3)
        txtviewmessage.layer.cornerRadius=10
        txtfldsubject.setShadowEffect1()
        txtviewmessage.delegate=self
        
      
//        if self.revealViewController() != nil {
//
//            btnslideoutmenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
//            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//
//
//        }
        
//        if let name=UserDefaults.standard.value(forKey: "username"){
//            username = UserDefaults.standard.value(forKey: "username") as! String
//            btnmyprofile.setTitle("Hi "+username, for: .normal)
//        }
//        viewprofile.setShadowEffect()
//        viewprofile.isHidden=true
        
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
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
    @IBAction func btnmyprofileaction(_ sender: Any) {
//        if viewprofile.isHidden==true{
//            viewprofile.isHidden=false
//        }else{
//            viewprofile.isHidden=true
//        }
    }
    
    @IBAction func btnbackaction(_ sender: Any) {
        let home = self.storyboard?.instantiateViewController (withIdentifier: "HomenewViewController") as! HomenewViewController
        
        self.navigationController?.pushViewController(home, animated: true)
    }
    
    @IBAction func btnslideoutaction(_ sender: Any) {
        
    }
    
    @IBAction func btnsendmessageaction(_ sender: Any) {
        slidereportmodel.subject=txtfldsubject.text ?? ""
        slidereportmodel.message=txtviewmessage.text ?? ""
        slidereportmodel.submit_enquiry{ (model) in
            self.submitenquirydata(data:model)
        }
    }
    func textViewDidChange(_ textView: UITextView){
        lblmessage.isHidden=true
        if txtviewmessage.text==""{
            lblmessage.isHidden=false
        }else{
            lblmessage.isHidden=true
        }
    }
   
    
    func submitenquirydata(data: Submitenquiryclass) {
        print("data",data)
        
        
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                
                
                
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
                let home = self.storyboard?.instantiateViewController (withIdentifier: "HomepageViewController") as! HomepageViewController
                
                self.navigationController?.pushViewController(home, animated: true)
                
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
    @IBAction func btnmyaccountaction(_ sender: Any) {
        let myaccount = self.storyboard?.instantiateViewController (withIdentifier: "MyaccountViewController") as! MyaccountViewController
               
               self.navigationController?.pushViewController(myaccount, animated: true)
    }
    
    @IBAction func btnreportaction(_ sender: Any) {
    
    let slidereports = self.storyboard?.instantiateViewController (withIdentifier: "SlidemenureportsViewController") as! SlidemenureportsViewController
    
    self.navigationController?.pushViewController(slidereports, animated: true)
    
    }
    
    
    @IBAction func btnpaymentaction(_ sender: Any) {
        
        let coachingctgry = self.storyboard?.instantiateViewController (withIdentifier: "CoachingcategoryViewController") as! CoachingcategoryViewController
        coachingctgry.wanttojoinflag=2
        coachingctgry.usersubcribed=1
        self.navigationController?.pushViewController(coachingctgry, animated: true)
    }
    
    @IBAction func btnlogoutaction(_ sender: Any) {
   slidereportmodel.user_logout_new{ (model) in
           self.userlogoutnewdata(data:model)
       }
    
    }
    func userlogoutnewdata(data: Logoutclass) {
        print("data",data)
        
        
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                
                let login = self.storyboard?.instantiateViewController (withIdentifier: "LoginViewController") as! LoginViewController
                
                let nc = self.revealViewController().frontViewController as! UINavigationController
                nc.pushViewController(login, animated: false)
                
                self.revealViewController().pushFrontViewController(nc, animated: true)
                
                UserDefaults.standard.removeObject(forKey: "useridnew")
                UserDefaults.standard.removeObject(forKey: "useremail")
                UserDefaults.standard.removeObject(forKey: "username")
                 UserDefaults.standard.removeObject(forKey: "userphone")
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
                
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
}
