//
//  BookmarksViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 18/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import  CoreData

@available(iOS 13.0, *)
class BookmarksViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableviewbookmarks: UITableView!
    
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var viewprofile: UIView!
    @IBOutlet weak var btnmyprofile: UIButton!
    @IBOutlet weak var btnslidemenu: UIButton!
     var slidereportmodel=Slidereportviewmodel()
    var bookmarkcell=BookmarksTableViewCell()
   var bookmark=[Bookmarks]()
     var item:[Any]=[]
    var deleted=Int()
    var username=String()
    var theme=Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewbookmarks.rowHeight=150
        tableviewbookmarks.estimatedRowHeight=UITableView.automaticDimension
//        if let name=UserDefaults.standard.value(forKey: "username"){
//                   username = UserDefaults.standard.value(forKey: "username") as! String
//                   btnmyprofile.setTitle("Hi "+username, for: .normal)
//               }
//        if self.revealViewController() != nil {
//
//            //                   btnslidemenu.target = self.revealViewController()
//            //
//            //                   btnslidemenu.action = #selector(SWRevealViewController.revealToggle(_:))
//            btnslidemenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
//            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//
//
//        }
              
        fetchdata()
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmark.count
   
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
   
        bookmarkcell = (tableView.dequeueReusableCell(withIdentifier: "BookmarksTableViewCell", for: indexPath) as? BookmarksTableViewCell)!
        bookmarkcell.lblimagetitle.text=bookmark[indexPath.row].imagetitle
        bookmarkcell.lblsubcatname.text=bookmark[indexPath.row].subcategoryname
       bookmarkcell.lbldescrptn.lineBreakMode = .byWordWrapping
        bookmarkcell.lbldescrptn.numberOfLines = 0
        bookmarkcell.lbldescrptn.sizeToFit()
        bookmarkcell.lbldescrptn.text=bookmark[indexPath.row].imagedescription
        bookmarkcell.btndelete.tag=indexPath.row
        bookmarkcell.btndelete.addTarget(self, action: #selector(btndeleteaction(sender:)), for: .touchUpInside)
        return bookmarkcell
 }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
     func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
         return UITableView.automaticDimension
    }
    
    @objc func btndeleteaction(sender:UIButton){
       
        deleted=sender.tag
         deletedata()
        
    }
   
    @available(iOS 13.0, *)
    func fetchdata(){
           
            guard let appDelegate =
              UIApplication.shared.delegate as? AppDelegate else {
                return
            }
            
            let managedContext =
              appDelegate.persistentContainer.viewContext
            
            //2
            let fetchRequest =
              NSFetchRequest<NSManagedObject>(entityName: "Bookmarks")
            
    //        //3
            do {
                bookmark = try managedContext.fetch(fetchRequest) as! [Bookmarks]
                print("bookmark",bookmark)
                tableviewbookmarks.reloadData()
            } catch let error as NSError {
              print("Could not fetch. \(error), \(error.userInfo)")
            }
            
       // let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        //request.predicate = NSPredicate(format: "age = %@", "12")
       // request.returnsObjectsAsFaults = false
//        do {
//            let result = try managedContext.fetch(fetchRequest)
//            for data in result as! [NSManagedObject] {
//               print(data.value(forKey: "imagetitle") as! String)
//                item.append(data.value(forKey: "imagetitle") as! String)
//
//          }
//            tableviewbookmarks.reloadData()
//
//        } catch {
//
//            print("Failed")
//        }

    }
   // @available(iOS 13.0, *)
    func deletedata(){
        guard let appDelegate =
                    UIApplication.shared.delegate as? AppDelegate else {
                      return
                  }
                  
                  let managedContext =
                    appDelegate.persistentContainer.viewContext
                  
                  //2
                  let fetchRequest =
                    NSFetchRequest<NSManagedObject>(entityName: "Bookmarks")
        do {
            bookmark = try managedContext.fetch(fetchRequest) as! [Bookmarks]
            let objectdelete=bookmark[deleted]
            managedContext.delete(objectdelete)
            do{
                      try managedContext.save()
                      fetchdata()
                     
                  }catch let error as NSError {

                      print("could not save . \(error), \(error.userInfo)")
                  }
           
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    
    @IBAction func btnbackaction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnmyprofileaction(_ sender: Any) {
//    if viewprofile.isHidden==true{
//        viewprofile.isHidden=false
//    }else{
//        viewprofile.isHidden=true
//    }
    
    
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
