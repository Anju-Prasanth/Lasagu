//
//  SlidemenuViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 29/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
 @available(iOS 13.0, *)
class SlidemenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var array=[String]()
    var imagearray=[String]()
    
    @IBOutlet weak var lblline: UILabel!
    @IBOutlet weak var lblemail: UILabel!
    @IBOutlet weak var lblname: UILabel!
    
    @IBOutlet weak var btndarkmode: UISwitch!
    @IBOutlet weak var imageviewprofile: UIImageView!
    var username=String()
    var useremail=String()
    var slidereportmodel=Slidereportviewmodel()
    var window:UIWindow?
    var user_image=String()
    var theme=Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageviewprofile.layer.cornerRadius=10
        array=["Home","My Account","Reports","Bookmarks","Contact Us","Privacy Policy","Downloads","Logout","VERSION:1.4"]
        imagearray=["icon-5","icons8-female-profile-24","icons8-switching-between-tabs-30","icons8-keypad-30","icon","icon-2","Group 139","path",""]
        
        
        if let image=UserDefaults.standard.value(forKey: "userimage"){
            user_image = UserDefaults.standard.value(forKey: "userimage") as! String
            print("user_image",user_image)
            imageviewprofile.image=UIImage(named:user_image)
        }
    
        if let name=UserDefaults.standard.value(forKey: "username"){
            username = UserDefaults.standard.value(forKey: "username") as! String
            lblname.text=username
        }
        if let email=UserDefaults.standard.value(forKey: "useremail"){
            useremail=UserDefaults.standard.value(forKey: "useremail") as! String
            lblemail.text=useremail
        }
        
        if let mode=UserDefaults.standard.value(forKey: "mode"){
            theme=UserDefaults.standard.value(forKey: "mode") as! Int
            
        }
        
        if theme==0{
            overrideUserInterfaceStyle = .light
            
        }else{
        overrideUserInterfaceStyle = .dark
       
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        if let mode=UserDefaults.standard.value(forKey: "mode"){
            theme=UserDefaults.standard.value(forKey: "mode") as! Int
            
        }
        
        if theme==0{
            overrideUserInterfaceStyle = .light
            
        }else{
        overrideUserInterfaceStyle = .dark
       
        }
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = (tableView.dequeueReusableCell(withIdentifier: "SlidecellTableViewCell", for: indexPath) as? SlidecellTableViewCell)!
        cell.lbllist.text=array[indexPath.row]
        cell.imageview.image=UIImage(named:imagearray[indexPath.row])
        if indexPath.row==7{
            cell.lblline.isHidden=false
        }else{
            cell.lblline.isHidden=true
        }
        if indexPath.row==8{
            cell.lbllist.font=UIFont.boldSystemFont(ofSize: 17.0)
        }else{
            cell.lbllist.font=UIFont.systemFont(ofSize: 15.0)
        }
           
        return cell
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row==5{
            let privacypolicy = self.storyboard?.instantiateViewController (withIdentifier: "PrivacypolicyViewController") as! PrivacypolicyViewController
            
            let nc = revealViewController().frontViewController as! UINavigationController
            nc.pushViewController(privacypolicy, animated: false)
            
            revealViewController().pushFrontViewController(nc, animated: true)
        }else  if indexPath.row==0{
            let homepage = self.storyboard?.instantiateViewController (withIdentifier: "HomenewViewController") as! HomenewViewController
            
            let nc = revealViewController().frontViewController as! UINavigationController
            nc.pushViewController(homepage, animated: false)
            
            revealViewController().pushFrontViewController(nc, animated: true)
            
//        }else  if indexPath.row==4{
//            let coaching = self.storyboard?.instantiateViewController (withIdentifier: "CoachingViewController") as! CoachingViewController
//            
//            let nc = revealViewController().frontViewController as! UINavigationController
//            nc.pushViewController(coaching, animated: false)
//            
//            revealViewController().pushFrontViewController(nc, animated: true)
        }else  if indexPath.row==1{
        let myaccount = self.storyboard?.instantiateViewController (withIdentifier: "MyaccountViewController") as! MyaccountViewController
        
        let nc = revealViewController().frontViewController as! UINavigationController
        nc.pushViewController(myaccount, animated: false)
        
        revealViewController().pushFrontViewController(nc, animated: true)
        } else  if indexPath.row==2{
            
            let slidereports = self.storyboard?.instantiateViewController (withIdentifier: "SlidemenureportsViewController") as! SlidemenureportsViewController
            
            let nc = revealViewController().frontViewController as! UINavigationController
            nc.pushViewController(slidereports, animated: false)
            
            revealViewController().pushFrontViewController(nc, animated: true)
        }else  if indexPath.row==4{
            
            let contactus = self.storyboard?.instantiateViewController (withIdentifier: "ContactusViewController") as! ContactusViewController
            
            let nc = revealViewController().frontViewController as! UINavigationController
            nc.pushViewController(contactus, animated: false)
            
            revealViewController().pushFrontViewController(nc, animated: true)
        }else  if indexPath.row==3{
            
            let bookmarks = self.storyboard?.instantiateViewController (withIdentifier: "BookmarksViewController") as! BookmarksViewController
            
            let nc = revealViewController().frontViewController as! UINavigationController
            nc.pushViewController(bookmarks, animated: false)
            
            revealViewController().pushFrontViewController(nc, animated: true)
        }else if indexPath.row == 6{
            
            let download = UIStoryboard(name: "Sub", bundle: nil).instantiateViewController (withIdentifier: "DownloadingListViewController") as! DownloadingListViewController
            
            let nc = revealViewController().frontViewController as! UINavigationController
            nc.pushViewController(download, animated: false)
            revealViewController().pushFrontViewController(nc, animated: true)
        }else if indexPath.row == 7{
            slidereportmodel.user_logout_new{ (model) in
                self.userlogoutnewdata(data:model)
            }
        }
    }
    
    @IBAction func btnlogouaction(_ sender: Any) {
        
        slidereportmodel.user_logout_new{ (model) in
            self.userlogoutnewdata(data:model)
        }
    }
    
    
    @IBAction func btnswitchaction(_ sender: UISwitch) {
        if sender.isOn==true{
            overrideUserInterfaceStyle = .dark
            UserDefaults.standard.setValue(1, forKey: "mode")
            let home = self.storyboard?.instantiateViewController (withIdentifier: "HomenewViewController") as! HomenewViewController
            
            let nc = revealViewController().frontViewController as! UINavigationController
            nc.pushViewController(home, animated: false)
            
        }else{
            overrideUserInterfaceStyle = .light
            UserDefaults.standard.setValue(0, forKey: "mode")
            let home = self.storyboard?.instantiateViewController (withIdentifier: "HomenewViewController") as! HomenewViewController
            
            let nc = revealViewController().frontViewController as! UINavigationController
            nc.pushViewController(home, animated: false)
        }
    }
    
    
    func userlogoutnewdata(data: Logoutclass) {
        print("data",data)
        
        
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                
                let enterphone = self.storyboard?.instantiateViewController (withIdentifier: "EnterphoneViewController") as! EnterphoneViewController
                
                let nc = self.revealViewController().frontViewController as! UINavigationController
                nc.pushViewController(enterphone, animated: false)
                
                self.revealViewController().pushFrontViewController(nc, animated: true)
                
                UserDefaults.standard.removeObject(forKey: "useridnew")
                UserDefaults.standard.removeObject(forKey: "useremail")
                UserDefaults.standard.removeObject(forKey: "username")
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
                
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
}

