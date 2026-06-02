//
//  CoachingViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 24/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation



@available(iOS 13.0, *)
class CoachingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,smartstudttappeddelegate,trendingvideotappeddelegtae{
   
    
    
    
    var buynow=BuynowTableViewCell()
    var videos=VideosTableViewCell()
    var smartstudytablecell=SmartstudyTableViewCell()
    var videoURL:URL!
    
    @IBOutlet weak var viewprofile: UIView!
    @IBOutlet weak var btnslidemenu: UIButton!
    
    @IBOutlet weak var btnmyprofile: UIButton!
    @IBOutlet weak var tableviewcoching: UITableView!
    var username=String()
    var slidereportmodel=Slidereportviewmodel()
    override func viewDidLoad() {
        super.viewDidLoad()
      if self.revealViewController() != nil {
                 
                 //                   btnslidemenu.target = self.revealViewController()
                 //
                 //                   btnslidemenu.action = #selector(SWRevealViewController.revealToggle(_:))
                 btnslidemenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
                 self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
                 
                 
             }
        
        
        
        if let name=UserDefaults.standard.value(forKey: "username"){
                   username = UserDefaults.standard.value(forKey: "username") as! String
                   btnmyprofile.setTitle("Hi "+username, for: .normal)
               }
        
        
        //playVimeoVideo()
              
    }
    
    
    override func viewWillAppear(_ animated: Bool){
          super.viewWillAppear(animated)
        viewprofile.isHidden=true
        
    }
    
        func numberOfSections(in tableView: UITableView) -> Int {
               return 3
    
           }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0{
        return 1
        }else if section==1{
         return 1
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section==0{
            buynow = (tableView.dequeueReusableCell(withIdentifier: "BuynowTableViewCell", for: indexPath) as? BuynowTableViewCell)!
           buynow.btnbuymow.addTarget(self, action: #selector(btnbuynowcation(sender:)), for: .touchUpInside)
            return buynow
        }else if indexPath.section==1{
            videos = (tableView.dequeueReusableCell(withIdentifier: "VideosTableViewCell", for: indexPath) as? VideosTableViewCell)!
          videos.lbltrendingvideos.text="TRENDING VIDEOS"
        videos.trendingvideodelegate=self
            return videos
        }else{
           smartstudytablecell = (tableView.dequeueReusableCell(withIdentifier: "SmartstudyTableViewCell", for: indexPath) as? SmartstudyTableViewCell)!
            smartstudytablecell.delegatesmarttapped=self
            smartstudytablecell.lblsmartstudt.text="SMART STUDY"
            return smartstudytablecell
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==0{
            return 250
        }else if indexPath.section==1{
            
            return 230
        }else{
            return 500
        }
    }
    @objc func btnbuynowcation(sender:UIButton){
        let coachingctgry = self.storyboard?.instantiateViewController (withIdentifier: "CoachingcategoryViewController") as! CoachingcategoryViewController
               coachingctgry.wanttojoinflag=2
               coachingctgry.usersubcribed=1
               self.navigationController?.pushViewController(coachingctgry, animated: true)
    }
    
    func trendingvideo(video: String) {
           let videoimage = self.storyboard?.instantiateViewController (withIdentifier: "VideoandimageViewController") as! VideoandimageViewController
        videoimage.myurl=URL(string:video)
        videoimage.trendingvideoflag=1
        videoimage.type="image"
           self.navigationController?.pushViewController(videoimage, animated: true)
       }
    
    func smatstudydetails(paymentstatus: Bool, premiumid: String, usersubscrptnstatus: Bool,pscpremiumcatgryname:String) {
           if usersubscrptnstatus==true{
             let cochingcategory = self.storyboard?.instantiateViewController (withIdentifier: "CoachingcategoryViewController") as! CoachingcategoryViewController
             cochingcategory.usersubcribed=1
             cochingcategory.premiumid=premiumid
             cochingcategory.pscpremiumcatname=pscpremiumcatgryname
             self.navigationController?.pushViewController(cochingcategory, animated: true)
        
                }else{
                    if paymentstatus==true{
                        let cochingcategory = self.storyboard?.instantiateViewController (withIdentifier: "CoachingcategoryViewController") as! CoachingcategoryViewController
                         cochingcategory.usersubcribed=1
                        cochingcategory.premiumid=premiumid
                        cochingcategory.pscpremiumcatname=pscpremiumcatgryname
                         self.navigationController?.pushViewController(cochingcategory, animated: true)
        
                    }else{
        
                        let cochingcategory = self.storyboard?.instantiateViewController (withIdentifier: "CoachingcategoryViewController") as! CoachingcategoryViewController
                        cochingcategory.usersubcribed=0
                         cochingcategory.pscpremiumcatname=pscpremiumcatgryname
                         cochingcategory.premiumid=premiumid
                        
                         self.navigationController?.pushViewController(cochingcategory, animated: true)
        
                    }
        
                }
        
    }
    
    @IBAction func btnmyprofileaction(_ sender: Any) {
        if viewprofile.isHidden==true{
         viewprofile.isHidden=false
         }else{
              viewprofile.isHidden=true
         }
    }
    
    @IBAction func btnfeddsaction(_ sender: Any) {
        let home = self.storyboard?.instantiateViewController (withIdentifier: "HomepageViewController") as! HomepageViewController
        home.selectionflag=1
        self.navigationController?.pushViewController(home, animated: false)
    }
    
    @IBAction func btnprepareaction(_ sender: Any) {
        let home = self.storyboard?.instantiateViewController (withIdentifier: "HomepageViewController") as! HomepageViewController
        home.selectionflag=2
        self.navigationController?.pushViewController(home, animated: false)
    }
    
    
    @IBAction func btndailyeaxmaction(_ sender: Any) {
        viewprofile.isHidden=true
               let dailyexam = self.storyboard?.instantiateViewController (withIdentifier: "DailyexamViewController") as! DailyexamViewController
               
               self.navigationController?.pushViewController(dailyexam, animated: false)
        
    }
    
    @IBAction func btntestseriesaction(_ sender: Any) {
        viewprofile.isHidden=true
               let testseries = self.storyboard?.instantiateViewController (withIdentifier: "MocktestViewController") as! MocktestViewController
               
               self.navigationController?.pushViewController(testseries, animated: false)
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
    
//    func playVimeoVideo() {
//
//        if let url = URL(string: "https://player.vimeo.com/video/367527185?player_id=player&autoplay=1&title=0&byline=0&portrait=0&api=1&maxheight=480&maxwidth=800") {
//            HCVimeoVideoExtractor.fetchVideoURLFrom(url: url, completion: { ( video:HCVimeoVideo?, error:Error?) -> Void in
//
//                if let err = error {
//
//                    print("Error = \(err.localizedDescription)")
//
//                    DispatchQueue.main.async() {
//                        self.videoURL = nil
//
//                        let alert = UIAlertController(title: "Error", message: err.localizedDescription, preferredStyle: .alert)
//                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                    return
//                }
//
//                guard let vid = video else {
//                    print("Invalid video object")
//                    return
//                }
//
//                print("Title = \(vid.title), url = \(vid.videoURL), thumbnail = \(vid.thumbnailURL)")
//
//                DispatchQueue.main.async() {
//                    self.videoURL = vid.videoURL[.Quality540p]
//                    if let url = self.videoURL {
//                        let player = AVPlayer(url: url)
//                        let playerController = AVPlayerViewController()
//                        playerController.player = player
//                        self.present(playerController, animated: true) {
//                            player.play()
//                        }
//                    }
//                    else {
//                        let alert = UIAlertController(title: "Error", message: "Invalid video URL", preferredStyle: .alert)
//                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//                        self.present(alert, animated: true, completion: nil)
//                    }
//                }
//            })
//        }
//    }

    
}
