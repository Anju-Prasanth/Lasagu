//
//  SlidemenureportsViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 13/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class SlidemenureportsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var viewprofile: UIView!
    @IBOutlet weak var btnmyprofile: UIButton!
    @IBOutlet weak var btnslidemenu: UIButton!
    @IBOutlet weak var tableviewslidereports: UITableView!
    var slidereportcell=SlidemenureportsTableViewCell()
    var slidemodel=Slidereportviewmodel()
    var mocktestseriesresult:[Mock_test_series_result]?
    var username=String()
    var theme=Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        slidemodel.get_user_exam_reports{ (model) in
            self.getuserexamreportsdata(data:model)
        }
        //viewprofile.setShadowEffect()
        //viewprofile.isHidden=true
//        if self.revealViewController() != nil {
//
//            //                   btnslidemenu.target = self.revealViewController()
//            //
//            //                   btnslidemenu.action = #selector(SWRevealViewController.revealToggle(_:))
//            btnslidemenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
//            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
       // }
        
//        if let name=UserDefaults.standard.value(forKey: "username"){
//            username = UserDefaults.standard.value(forKey: "username") as! String
//            btnmyprofile.setTitle("Hi "+username, for: .normal)
//        }
    }
    
    override func viewWillAppear(_ animated: Bool){
    super.viewWillAppear(animated)
    //viewprofile.isHidden=true
    self.navigationController?.navigationBar.isHidden=true
        
            
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
    
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
                  return 1
       
              }
       
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        return mocktestseriesresult?.count ?? 0
           
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        slidereportcell = (tableView.dequeueReusableCell(withIdentifier: "SlidemenureportsTableViewCell", for: indexPath) as? SlidemenureportsTableViewCell)!
        slidereportcell.lbltestname.text=mocktestseriesresult?[indexPath.row].psc_mock_test_name
        slidereportcell.lblusertime.text=mocktestseriesresult?[indexPath.row].psc_user_time
       
        if (mocktestseriesresult?[indexPath.row].psc_mock_user_mark! as! NSString).integerValue<0{
            slidereportcell.lbltotalmark.text="0"
        }else{
            slidereportcell.lbltotalmark.text=mocktestseriesresult?[indexPath.row].psc_mock_user_mark
        }
        return slidereportcell
        
        }

       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 135
        }
        
        func getuserexamreportsdata(data: Slidereportclass) {
            print("data",data)
         
          
            let status=data.status
            if status==true{
                DispatchQueue.main.async{
                    self.mocktestseriesresult=data.data?.mock_test_series_result
                  
                  
                    self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                    self.tableviewslidereports.reloadData()
                }
            }else{
                
                DispatchQueue.main.async{
                    self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
                }
            }
        }
    
    
    @IBAction func btnmyprofileaction(_ sender: Any) {
//        if viewprofile.isHidden==true{
//            viewprofile.isHidden=false
//        }else{
//            viewprofile.isHidden=true
//        }
//
    
    }
    
    @IBAction func btnbackaction(_ sender: Any) {
        
        let home = self.storyboard?.instantiateViewController (withIdentifier: "HomenewViewController") as! HomenewViewController

                                         self.navigationController?.pushViewController(home, animated: true)
        
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
        slidemodel.user_logout_new{ (model) in
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
