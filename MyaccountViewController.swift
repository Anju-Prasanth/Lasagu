//
//  MyaccountViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 20/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import MBCircularProgressBar
 @available(iOS 13.0, *)
class MyaccountViewController: UIViewController {

    @IBOutlet weak var lblprofilecmpleteness: UILabel!
    @IBOutlet weak var lblclimbedspaces: UILabel!
    @IBOutlet weak var lblrank: UILabel!
    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var lbldate: UILabel!
    @IBOutlet weak var viewcurrentrank: UIView!
    @IBOutlet weak var lblphonenumber: UILabel!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var btnmyprofile: UIButton!
    @IBOutlet weak var btnslidemenu: UIButton!
     @IBOutlet weak var viewdetails: UIView!
    @IBOutlet weak var viewprofile: UIView!
    
    @IBOutlet weak var progressbarview: MBCircularProgressBarView!
    
    @IBOutlet weak var btnback: UIButton!
    
    
    var username=String()
    var slidereportmodel=Slidereportviewmodel()
    var loginviewmodel=LoginViewModel()
    var userid=Int()
    var theme=Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userid=UserDefaults.standard.value(forKey: "useridnew") as! Int
        loginviewmodel.userid=userid
        loginviewmodel.get_profile_with_result{ (model) in
                       self.getprofilewithresultdata(data:model)
                   }
//        viewprofile.setShadowEffect()
        viewdetails.setShadowEffect()
        viewcurrentrank.setShadowEffect()
        viewcurrentrank.layer.cornerRadius=10
//        self.progressbarview.valueFontName = "systemBold"
        self.progressbarview.valueFontSize = 25
        
        
//         if self.revealViewController() != nil {
//                btnslidemenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
//                self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//                }
//        if let name=UserDefaults.standard.value(forKey: "username"){
//                   username = UserDefaults.standard.value(forKey: "username") as! String
//               btnmyprofile.setTitle("Hi "+username, for: .normal)
//                         }
            
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
        

    @IBAction func btnbackaction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
     @IBAction func btnmyprofileaction(_ sender: Any) {
//        if viewprofile.isHidden==true{
//        viewprofile.isHidden=false
//        }else{
//             viewprofile.isHidden=true
//        }
     }
     
    @IBAction func btneditaction(_ sender: Any) {
        let profileedit = self.storyboard?.instantiateViewController (withIdentifier: "ProfileeditViewController") as! ProfileeditViewController
                             
            self.navigationController?.pushViewController(profileedit, animated: true)
    }
    
    @IBAction func changephonenumberaction(_ sender: Any) {
        let enterphone = self.storyboard?.instantiateViewController (withIdentifier: "EnterphoneViewController") as! EnterphoneViewController
        enterphone.phoneeditflag=1
               self.navigationController?.pushViewController(enterphone, animated: true)
        
        
    }
    @IBAction func btnreportsaction(_ sender: Any) {
        let slidereports = self.storyboard?.instantiateViewController (withIdentifier: "SlidemenureportsViewController") as! SlidemenureportsViewController
                      
        self.navigationController?.pushViewController(slidereports, animated: true)
    }
    
    @IBAction func btnpaymentaction(_ sender: Any) {
        let coachingctgry = self.storyboard?.instantiateViewController (withIdentifier: "CoachingcategoryViewController") as! CoachingcategoryViewController
               coachingctgry.wanttojoinflag=2
               coachingctgry.usersubcribed=1
               self.navigationController?.pushViewController(coachingctgry, animated: true)
    }
    
    @IBAction func btmnlogoutaction(_ sender: Any) {
        slidereportmodel.user_logout_new{ (model) in
            self.userlogoutnewdata(data:model)
        }
    }
    
    @IBAction func btnmyacountaction(_ sender: Any) {
        
        let myaccount = self.storyboard?.instantiateViewController (withIdentifier: "MyaccountViewController") as! MyaccountViewController
                      
        self.navigationController?.pushViewController(myaccount, animated: true)
        
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
           
    func getprofilewithresultdata(data: Profiledetailwithresultclass) {
        print("data",data)
        
        
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                
                self.lblprofilecmpleteness.text="50 %"
                self.lbldate.text=data.data?.daily_exam?.psc_exam_date
                 self.lbltime.text=data.data?.daily_exam?.psc_exam_time
                 self.lblemail.text=data.data?.user_res?.psc_email
                 self.lblphonenumber.text=data.data?.user_res?.psc_phone
                self.lblrank.text=data.data?.daily_exam_rank
                self.lblname.text=(data.data?.user_res?.psc_first_name ?? "")+String(data.data?.user_res?.psc_last_name ?? "" )
                self.lblclimbedspaces.text="climbed 70 Places"
                self.progressbarview.value=CGFloat(33)
                let userid=(data.data?.user_res?.psc_user_id as! NSString).integerValue
                
               UserDefaults.standard.set(userid,forKey: "useridnew")
                
                  UserDefaults.standard.set(data.data?.user_res?.psc_email ?? "",forKey: "useremail")
                UserDefaults.standard.set((data.data?.user_res?.psc_first_name ?? "")+String(data.data?.user_res?.psc_last_name ?? ""),forKey: "username")
                UserDefaults.standard.set(data.data?.user_res?.psc_phone,forKey: "userphone")
//                UIView.animate(withDuration: 1.0){
//                    self.progressbarview.value=Float(data.data?.daily_exam?.psc_daily_exam_mark ?? "" as! NSString)
//                               }
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
    
}


