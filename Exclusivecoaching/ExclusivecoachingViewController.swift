//
//  ExclusivecoachingViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 11/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
//import AlamofireObjectMapper
@available(iOS 13.0, *)
class ExclusivecoachingViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,WKUIDelegate{
    
    @IBOutlet weak var lblheading: UILabel!
    @IBOutlet weak var viewprofile: UIView!
    @IBOutlet weak var viewimagecorner: UIView!
    @IBOutlet weak var viewvideo: UIView!
    @IBOutlet weak var tableviewexclusivecoaching: UITableView!
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var btnmyprofile: UIButton!
    @IBOutlet weak var btnslidemenu: UIButton!
    
    @IBOutlet weak var btnexam: UIButton!
    var myurl:URL!
    var mywkwebview: WKWebView?
    var exclusivecell=ExclusivecoachingTableViewCell()
    var exclusivemodel=Exclusivecoachingviewmodel()
    var coachingvideo:[Coaching_video]?
    var premiumcatid=String()
    var chapterid=String()
    var instrustionforchapterwiseexam=String()
    var username=String()
    var slidereportmodel=Slidereportviewmodel()
    var videofromvideopdfexam:[WeekVideos]?
    
    var examfromvideopdfexam:[WeekExam]?
    var selected_index=1
    var videothumburl=String()
    
     var downloadList = Dictionary<String, Any>()
    var theme=Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // viewimagecorner.layer.cornerRadius=20
        viewvideo.layer.cornerRadius=20
        btnexam.layer.cornerRadius=10
        
        if selected_index==0{
        videoplay()
        }else{
        
        
                exclusivemodel.premiumcatid=premiumcatid
                 exclusivemodel.chapterid=chapterid
                exclusivemodel.get_chapter_wise_video{ (model) in
                    self.getchapterwisevideodata(data:model)
                }
        }
        //        viewprofile.setShadowEffect()
        //               viewprofile.isHidden=true
        
        if self.revealViewController() != nil {
            
            //                   btnslidemenu.target = self.revealViewController()
            //
            //                   btnslidemenu.action = #selector(SWRevealViewController.revealToggle(_:))
            btnslidemenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        
        //        if let name=UserDefaults.standard.value(forKey: "username"){
        //            username = UserDefaults.standard.value(forKey: "username") as! String
        //            btnmyprofile.setTitle("Hi "+username, for: .normal)
        //        }
        
        downloadList = UserDefaults.standard.dictionary(forKey: "downloads") ?? [:]
        
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
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if selected_index==0{
            return videofromvideopdfexam?.count ?? 0
        }else{
           return coachingvideo?.count ?? 0
        //
    }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        exclusivecell = (tableView.dequeueReusableCell(withIdentifier: "ExclusivecoachingTableViewCell", for: indexPath) as? ExclusivecoachingTableViewCell)!
        
       //mywork
//        if selected_index==0{
//        exclusivecell.lblsubject.text=videofromvideopdfexam?[indexPath.row].video_subject
//        exclusivecell.lblpscvideotitle.text=videofromvideopdfexam?[indexPath.row].video_chapter
//        exclusivecell.lblpscvideodescrptn.text=videofromvideopdfexam?[indexPath.row].video_description
//        let url = URL(string:videothumburl+(videofromvideopdfexam?[indexPath.row].video_thumbnail ?? ""))
//        exclusivecell.imagevideothumb.kf.indicatorType = .activity
//        exclusivecell.imagevideothumb.kf.setImage(with: url)
//        exclusivecell.imagevideothumb.contentMode = .scaleAspectFit
//
//        }else{
//                    exclusivecell.lblpscvideotitle.text=coachingvideo?[indexPath.row].psc_video_title
//                    exclusivecell.lblpscvideodescrptn.text=coachingvideo?[indexPath.row].psc_video_description
//                    let url = URL(string:coachingvideo?[indexPath.row].psc_vimeo_video_thumb ?? "")
//                    exclusivecell.imagevideothumb.kf.indicatorType = .activity
//                    exclusivecell.imagevideothumb.kf.setImage(with: url)
//                    exclusivecell.imagevideothumb.contentMode = .scaleAspectFill
//        }
        
        if selected_index==0{
           
            if let vid = self.videofromvideopdfexam?[indexPath.row] {
                exclusivecell.configure(vid:vid, downloads: downloadList)
                lblheading.text=self.videofromvideopdfexam?[indexPath.row].video_chapter
                var url:URL!
                if vid.video_thumbnail==""{
                    exclusivecell.imagevideothumb.image=UIImage(named: "Group 111")
                }else{
                url = URL(string:videothumburl+(vid.video_thumbnail ?? ""))
                
                exclusivecell.imagevideothumb.kf.setImage(with: url)
                }
            exclusivecell.downloadVideo = {
                self.fetchVideoSize(video_id: vid.video_id ?? "",name: (vid.video_subject ?? "")+(vid.video_chapter ?? ""),thumnail: url?.absoluteString)
            }
            }
        }else{
            if let vid = self.coachingvideo?[indexPath.row] {
           
                exclusivecell.configure(vid: vid, downloads: downloadList)
//                exclusivecell.downloadVideo = {
//                    self.fetchVideoSize(video_id: vid.video_id ?? "",name: (vid.psc_video_title ?? ""),thumnail: vid.psc_vimeo_video_thumb)
//                }
            }
        }
        
        
        
        
        
         return exclusivecell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return  150
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selected_index==0{
        myurl=URL(string:videofromvideopdfexam?[indexPath.row].video_url ?? "")
        print("myurl",myurl)
        lblheading.text=self.videofromvideopdfexam?[indexPath.row].video_chapter
        videoplay()
        }else{
            self.myurl=URL(string: self.coachingvideo?[indexPath.row].psc_vimeo_video_url ?? "")
            lblheading.text=self.coachingvideo?[indexPath.row].psc_video_title ?? ""
            videoplay()
        }
        
    }
    
    func getchapterwisevideodata(data: Getchapterwisevideoclass) {
        print("data",data)
        
        
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                self.coachingvideo=data.data?.coaching_video
                self.myurl=URL(string: self.coachingvideo?[0].psc_vimeo_video_url ?? "")
                self.instrustionforchapterwiseexam=data.data?.exam_instructions?.instructions ?? ""
                self.videoplay()
                self.tableviewexclusivecoaching.reloadData()
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
    func videoplay(){
        let mywkwebviewConfig = WKWebViewConfiguration()
        mywkwebview?.uiDelegate=self
        mywkwebviewConfig.allowsInlineMediaPlayback = true
        mywkwebview = WKWebView(frame: self.viewvideo.frame , configuration: mywkwebviewConfig)
        
        // let myURL = URL(string: "https://youtu.be/gVATNh9w4VY")
        let youtubeRequest = URLRequest(url: myurl!)
        if selected_index==0{
            mywkwebview?.frame.origin.y = 0
        }
        mywkwebview?.load(youtubeRequest)
        
        guard let webView = mywkwebview else { return }
        self.viewvideo.addSubview(webView)
    }
    
    
    
    @IBAction func btnslidemenuaction(_ sender: Any) {
    }
    
    //    @IBAction func btnmyprofileaction(_ sender: Any) {
    //    if viewprofile.isHidden==true{
    //               viewprofile.isHidden=false
    //           }else{
    //               viewprofile.isHidden=true
    //           }
    //    }
    
    @IBAction func btnbackaction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        mywkwebview?.reload()
    }
    
    
    
    @IBAction func btnexamaction(_ sender: Any) {
        
        let instructions = self.storyboard?.instantiateViewController (withIdentifier: "InstructiondailyeaxamViewController") as! InstructiondailyeaxamViewController
        instructions.instructionstext=instrustionforchapterwiseexam
        instructions.exclusivecoachingflag=1
        instructions.chapterid=chapterid
        self.navigationController?.pushViewController(instructions, animated: true)
        
        
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
    
    
    //    @IBAction func btnlogoutaction(_ sender: Any) {
    //        slidereportmodel.user_logout_new{ (model) in
    //                   self.userlogoutnewdata(data:model)
    //               }
    //    }
    //    func userlogoutnewdata(data: Logoutclass) {
    //        print("data",data)
    //
    //
    //        let status=data.status
    //        if status==true{
    //            DispatchQueue.main.async{
    //
    //                let login = self.storyboard?.instantiateViewController (withIdentifier: "LoginViewController") as! LoginViewController
    //
    //                let nc = self.revealViewController().frontViewController as! UINavigationController
    //                nc.pushViewController(login, animated: false)
    //
    //                self.revealViewController().pushFrontViewController(nc, animated: true)
    //
    //                UserDefaults.standard.removeObject(forKey: "userid")
    //                UserDefaults.standard.removeObject(forKey: "useremail")
    //                UserDefaults.standard.removeObject(forKey: "username")
    //                 UserDefaults.standard.removeObject(forKey: "userphone")
    //                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
    //
    //
    //            }
    //        }else{
    //
    //            DispatchQueue.main.async{
    //                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
    //            }
    //        }
    //    }
}
    
@available(iOS 13.0, *)
extension ExclusivecoachingViewController{
   
        func fetchVideoSize(video_id:String,name:String,thumnail:String?){
            view.activityStartAnimating()
            let url = "https://api.vimeo.com/me/videos/\(video_id)"
            let headers: HTTPHeaders = [
                       .authorization(bearerToken: "9622e623337e621648be4f5d9bf45da5")
                   ]
            AF.request(url,method: .get ,headers: headers)
                .responseDecodable(of: VimeoVideoModel.self) { resp in
                    if let videos = resp.value?.download{
                        self.alertVideoSize(id: video_id, videos: videos,name: name,thumnail: thumnail)
                    }
                    self.view.activityStopAnimating()
                }
                
            
        }
        
        func alertVideoSize(id:String,videos:[Download],name:String,thumnail:String?){
            let alert = UIAlertController(title: "Download Now", message:name, preferredStyle: .actionSheet)
            
            for video in videos.sorted(by: {$0.height ?? 0 > $1.height ?? 0}){
                alert.addAction(UIAlertAction(title: "\(video.height ?? 0)x\(video.width ?? 0) (\(video.sizeShort ?? "") \(video.quality?.rawValue.uppercased() ?? ""))", style: .default, handler: { (ac) in
                    self.downloadFile(id: id, downloadUrl: video.link ?? "",name: name,thumnail: thumnail,size:video.size ?? 0)
                }))
            }
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
        
        func downloadFile(id:String,downloadUrl:String,name:String,thumnail:String?,size:Int){
            //SDDownloadManager.shared.showLocalNotificationOnBackgroundDownloadDone = true //Set this if you want to issue a local notification when all the background downloads complete.
           // SDDownloadManager.shared.localNotificationText = "All background downloads complete" //Text for the local notification
            let dic = ["name":name,"thumbnail":thumnail ?? "","date":Date().timeIntervalSince1970,"size":size,"status":0,"id":id] as [String : Any]
            var downloads = UserDefaults.standard.dictionary(forKey: "downloads") ?? [:]
            downloads[downloadUrl] = dic
            self.downloadList = downloads
            UserDefaults.standard.setValue(downloads, forKey: "downloads")
            self.reloadTable()
            
            let request = URLRequest(url: URL(string: downloadUrl)!)
           
                  SDDownloadManager.shared.downloadFile(withRequest: request, inDirectory: "Downloads", withName: id+".mp4", shouldDownloadInBackground: true, onProgress: nil) { [weak self] (error, url) in
                       if let error = error {
                           print("Error is \(error as NSError)")
                        print("file downloaded from Error")
                       } else {
                           if let url = url {
                            let dic = ["name":name,"thumbnail":thumnail ?? "","date":Date().timeIntervalSince1970,"size":size,"id":id,"path":url.absoluteString,"status":1] as [String : Any]
                            var downloads = UserDefaults.standard.dictionary(forKey: "downloads") ?? [:]
                            downloads[downloadUrl] = dic
                            self?.downloadList = downloads
                            UserDefaults.standard.setValue(downloads, forKey: "downloads")
                            self?.reloadTable()
                           }
                        print("file downloaded from VC")
                       }
                   }
                   
                  
               }
        
           
        
        func reloadTable(){
            tableviewexclusivecoaching.reloadData()
        }
    }

