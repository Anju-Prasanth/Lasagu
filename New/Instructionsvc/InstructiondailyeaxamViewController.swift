//
//  InstructiondailyeaxamViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 30/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class InstructiondailyeaxamViewController: UIViewController {

    @IBOutlet weak var viewprofile: UIView!
    @IBOutlet weak var lblinstructions: UILabel!
    @IBOutlet weak var btnstart: UIButton!
    @IBOutlet weak var btnslidemenu: UIButton!
    @IBOutlet weak var btnprofile: UIButton!
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var Outerview: UIView!
    var datechoosen=String()
    var instructionstext=String()
    var mocktestflag=Int()
    var mocktestseriesid=String()
    var exclusivecoachingflag=Int()
    var chapterid=String()
    var username=String()
    var slidereportmodel=Slidereportviewmodel()
    var year_id=String()
    var month_id=String()
    var ca_id=String()
    var currentaffairsflag=Int()
    var selected_index=Int()
    var weekwisequstnflag=Int()
    var weekexamid=String()
    var theme=Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let mode=UserDefaults.standard.value(forKey: "mode"){
            theme=UserDefaults.standard.value(forKey: "mode") as! Int
        }
        if theme==0{
            overrideUserInterfaceStyle = .light
            
        }else{
        overrideUserInterfaceStyle = .dark
        }
        
       // Outerview.setShadowEffect()
        btnstart.layer.cornerRadius=20
        if mocktestflag==1{
            if theme==0{
            lblinstructions.attributedText=instructionstext.convertToAttributedString1()
            }else{
                lblinstructions.attributedText=instructionstext.convertToAttributedString1white()
            }
        }else if exclusivecoachingflag==1 {
            if theme==0{
            lblinstructions.attributedText=instructionstext.convertToAttributedString1()
            }else{
                lblinstructions.attributedText=instructionstext.convertToAttributedString1white()
            }
        }else if currentaffairsflag==1{
            if theme==0{
            lblinstructions.attributedText=instructionstext.convertToAttributedString1()
            }else{
                lblinstructions.attributedText=instructionstext.convertToAttributedString1white()
            }
        }else if weekwisequstnflag==1{
//lblinstructions.text="• ഇന്നത്തെ ഫീഡ്സ് സെക്ഷനിൽ നൽകിയിട്ടുള്ള പോസ്റ്റുകളെ ആധാരമാക്കിയാണ് ചോദ്യങ്ങൾ ഉണ്ടാവുക.• പോസ്റ്റുകൾ വായിച്ചതിനു ശേഷം മാത്രം ഈ ടെസ്റ്റ് അറ്റൻഡ് ചെയ്യുക.• എല്ലാ ചോദ്യങ്ങൾക്കും ഉത്തരം നൽകുവാൻ ശ്രമിക്കുക.• നെഗറ്റീവ് സ്കോർ ഉണ്ടായിരിക്കുന്നതല്ല.• അവസാന ചോദ്യത്തിന് ശേഷം താഴെ SUBMIT ക്ലിക്ക് ചെയ്യുക.• ഇതിലൂടെ സ്വയം വിലയിരുത്തൂ. അതായത് കോപ്പി അടിക്കരുത്"
            if theme==0{
            lblinstructions.attributedText=instructionstext.convertToAttributedString1()
            }else{
                lblinstructions.attributedText=instructionstext.convertToAttributedString1white()
            }
        }else{
            
        }
        
        
       // viewprofile.setShadowEffect()
       // viewprofile.isHidden=true
        if self.revealViewController() != nil {
                   
                   //                   btnslidemenu.target = self.revealViewController()
                   //
                   //                   btnslidemenu.action = #selector(SWRevealViewController.revealToggle(_:))
                  // btnslidemenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
                   self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
               
                   
               }
//        if let name=UserDefaults.standard.value(forKey: "username"){
//                   username = UserDefaults.standard.value(forKey: "username") as! String
//                   btnprofile.setTitle("Hi "+username, for: .normal)
//               }
              
        
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
    
    
    @IBAction func btnprofileaction(_ sender: Any) {
//    if viewprofile.isHidden==true{
//        viewprofile.isHidden=false
//    }else{
//        viewprofile.isHidden=true
//    }
    
    
    }
    @IBAction func btnslidemenuaction(_ sender: Any) {
    }
    
    @IBAction func btnbackaction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnstartaction(_ sender: Any) {
        let questions = self.storyboard?.instantiateViewController (withIdentifier: "QuestionsViewController") as! QuestionsViewController
        if mocktestflag==1{
        questions.mocktestseries_id=mocktestseriesid
         questions.mocktest_flag=mocktestflag
        }else if exclusivecoachingflag==1{
        questions.chapterid=chapterid
        questions.exclusivecoachingflag=exclusivecoachingflag
        }else if currentaffairsflag==1{
        questions.currentaffairsflag=1
         questions.yearid=year_id
         questions.monthid=month_id
         questions.caid=ca_id
        }else if weekwisequstnflag==1{
        questions.week_examid=weekexamid
        questions.weekwisequstnflag=weekwisequstnflag
        }else{
        questions.datechoosen=datechoosen
        }
            self.navigationController?.pushViewController(questions, animated: true)
        
    }
 
    @IBAction func btnmyaccountaction(_ sender: Any) {
    
    let myaccount = self.storyboard?.instantiateViewController (withIdentifier: "MyaccountViewController") as! MyaccountViewController
    
    self.navigationController?.pushViewController(myaccount, animated: true)
    
    
    
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
