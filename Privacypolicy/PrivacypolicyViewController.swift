//
//  PrivacypolicyViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 10/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class PrivacypolicyViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var privacymodel=Privacypolicyviewmodel()
    
    var dataprivacy:privacydata?
    var terms:TermsData?
   
    @IBOutlet weak var lblprivacypolicy: UILabel!
    @IBOutlet weak var btnslidemenu: UIButton!
    
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var viewprofile: UIView!
    @IBOutlet weak var btnmyprofile: UIButton!
    @IBOutlet weak var tableviewprivacypolicy: UITableView!
     var slidereportmodel=Slidereportviewmodel()
    var username=String()
    var termsflag=Int()
    var theme=Int()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewprivacypolicy.rowHeight=UITableView.automaticDimension
        tableviewprivacypolicy.estimatedRowHeight=UITableView.automaticDimension
        
        if termsflag==0{
            lblprivacypolicy.text="Privacy Policy"
       privacymodel.get_privacy_and_policy{ (model) in
            self.privacydata(data:model)
        }
        }else{
            lblprivacypolicy.text="Terms and Conditions"
            privacymodel.get_terms_and_condition{ (model) in
                 self.termsdata(data:model)
        }
        }
        
//        viewprofile.setShadowEffect()
//        viewprofile.isHidden=true
//        if self.revealViewController() != nil {
//
//                   //                   btnslidemenu.target = self.revealViewController()
//                   //
//                   //                   btnslidemenu.action = #selector(SWRevealViewController.revealToggle(_:))
//                   btnslidemenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
//                   self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//
//
//               }
//
//               if let name=UserDefaults.standard.value(forKey: "username"){
//                   username = UserDefaults.standard.value(forKey: "username") as! String
//                   btnmyprofile.setTitle("Hi "+username, for: .normal)
//               }
    }
    override func viewWillAppear(_ animated: Bool){
    super.viewWillAppear(animated)
  
                    if let mode=UserDefaults.standard.value(forKey: "mode"){
                        theme=UserDefaults.standard.value(forKey: "mode") as! Int
                        
                    }
                    
        if theme==0{
            overrideUserInterfaceStyle = .light
            btnslidemenu.setImage(UIImage(named:"bars-solid"), for: .normal)
            btnback.setBackgroundImage(UIImage(named: "arrow-left-solid"), for: .normal)
            
        }else{
        overrideUserInterfaceStyle = .dark
        btnslidemenu.setImage(UIImage(named:"bars-solid-1"), for: .normal)
            btnback.setBackgroundImage(UIImage(named: "backarrow-white"), for: .normal)
        }
                    
                
            }
    
    @IBAction func btnbackaction(_ sender: Any) {
        
        let home = self.storyboard?.instantiateViewController (withIdentifier: "HomenewViewController") as! HomenewViewController
        
        self.navigationController?.pushViewController(home, animated: true)
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
           
               return 1
           
       }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
   
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
         
let  cell = (tableView.dequeueReusableCell(withIdentifier: "privacypolicyTableViewCell", for: indexPath) as? privacypolicyTableViewCell)!
        if termsflag==0{
        cell.lblprivacypolicy.lineBreakMode = .byWordWrapping
        cell.lblprivacypolicy.numberOfLines = 0
        cell.lblprivacypolicy.sizeToFit()
            if theme==0{
        cell.lblprivacypolicy.attributedText=dataprivacy?.privacy_policy?.convertToAttributedString2()
            }else{
                cell.lblprivacypolicy.attributedText=dataprivacy?.privacy_policy?.convertToAttributedString2white()
            }
        
        }else{
        
        cell.lblprivacypolicy.lineBreakMode = .byWordWrapping
        cell.lblprivacypolicy.numberOfLines = 0
        cell.lblprivacypolicy.sizeToFit()
            if theme==0{
        cell.lblprivacypolicy.attributedText=terms?.terms_condition?.convertToAttributedString2()
            }else{
                cell.lblprivacypolicy.attributedText=terms?.terms_condition?.convertToAttributedString2white()
            }
        }
        return cell
            }
            
            
            func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                   
                           return UITableView.automaticDimension
                      
                       }
     func privacydata(data: Privacypolicyclass) {
           print("data",data)
        
         
           let status=data.status
           if status==true{
               DispatchQueue.main.async{
                self.dataprivacy=data
                    .data
                self.tableviewprivacypolicy.reloadData()
                  // self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                   
               }
           }else{
               
               DispatchQueue.main.async{
                 //  self.showToast(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
               }
           }
       }
    func termsdata(data: Termsclass) {
          print("data",data)
       
        
          let status=data.status
          if status==true{
              DispatchQueue.main.async{
               self.terms=data
                   .data
               self.tableviewprivacypolicy.reloadData()
                 // self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                  
              }
          }else{
              
              DispatchQueue.main.async{
                //  self.showToast(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
              }
          }
      }
    @IBAction func btnmyprofileaction(_ sender: Any) {
//        if viewprofile.isHidden==true{
//            viewprofile.isHidden=false
//        }else{
//            viewprofile.isHidden=true
//        }
    }
    
    
    @IBAction func btnmyaccountaction(_ sender: Any) {
        let myaccount = self.storyboard?.instantiateViewController (withIdentifier: "MyaccountViewController") as! MyaccountViewController
        
        self.navigationController?.pushViewController(myaccount, animated: true)
    }
    
    
    @IBAction func btnreportscation(_ sender: Any) {
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
