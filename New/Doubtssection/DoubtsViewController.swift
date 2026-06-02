//
//  DoubtsViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 29/01/21.
//  Copyright © 2021 Arun Vijayan. All rights reserved.
//

import UIKit

import Alamofire
@available(iOS 13.0, *)
class DoubtsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var btncloseimage: UIButton!
    @IBOutlet weak var viewpostdoubtheight: NSLayoutConstraint!
   
    @IBOutlet weak var imageviewdoubtpostedheight: NSLayoutConstraint!
    @IBOutlet weak var imageviewdoubtposted: UIImageView!
    @IBOutlet weak var txtfldaskyourdbts: UITextField!
    @IBOutlet weak var tableviewdoubts: UITableView!
    var enterphnemodel=Enterphonemodel()
    @IBOutlet weak var lblheading: UILabel!
    var comment:[Comments]?
    var details:[CommentDetails]?
    var page=0
    var heading=String()
    var week_id=String()
   var week_nameid=String()
   var preliminary_id=String()
  var preliminaryflag=Int()
   
       var imageToUpload = UIImage()
   // var model = Insertcommentviewmodel()
    var itemcell=DoubtsolutionTableViewCell()
    var datafound=Bool()
    var sectionshown=Int()
    var imagedataresized=UIImage()
    var theme=Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        lblheading.text=heading
        self.viewpostdoubtheight.constant=120
        self.imageviewdoubtpostedheight.constant=0
        self.imageviewdoubtposted.isHidden=true
        self.btncloseimage.isHidden=true
        
        
       enterphnemodel.week_id=week_id
         enterphnemodel.week_nameid=week_nameid
        enterphnemodel.preliminary_id=preliminary_id
        enterphnemodel.preliminaryflag=preliminaryflag
        enterphnemodel.page=page
      enterphnemodel.view_comment{ (model) in
        self.view_commentdata(data:model)
                  }
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
        
    

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return comment?.count ?? 0
        
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let answer=comment?[section]
        return answer?.details?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        if datafound==true{
        
                   var lastelement=0
                   lastelement=comment!.count - 1
                    print("lastelement",lastelement)
        if indexPath.section<=lastelement{
        
                        page+=1
                        enterphnemodel.week_id=week_id
                         enterphnemodel.week_nameid=week_nameid
                        enterphnemodel.preliminary_id=preliminary_id
                        enterphnemodel.preliminaryflag=preliminaryflag
                        enterphnemodel.page=page
                        enterphnemodel.view_comment{ (model) in
                        self.view_commentdata(data:model)
                                  }
                    }
        }
        
        
       itemcell = (tableView.dequeueReusableCell(withIdentifier: "DoubtsolutionTableViewCell", for: indexPath) as? DoubtsolutionTableViewCell)!
        tableviewdoubts.separatorStyle = .none
        tableviewdoubts.separatorInset=UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        if comment?.count ?? 0>0{
          let totalRow = tableView.numberOfRows(inSection: indexPath.section) //first get total rows in that section by current indexPath.
           if indexPath.row == totalRow - 1 {
               //this is the last row in section.
          // }
                 
           // if (comment?[indexPath.section].details)?.count==indexPath.row{
                    itemcell.viewwritesolutionanswer.isHidden=false
                    itemcell.viewsolutionheightanswer.constant=59
            itemcell.Outerview.layer.cornerRadius=10
            itemcell.Outerview.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
            itemcell.viewwritesolutionanswer.setShadowEffect()
                
                
                
            }else{
           
            itemcell.viewwritesolutionanswer.isHidden=true
            itemcell.viewsolutionheightanswer.constant=0
                }
            itemcell.Outerview.setShadowEffect()
           
            let answer=comment?[indexPath.section].details
            itemcell.lblanswr.text=answer?[indexPath.row].comment ?? ""
            itemcell.lblanswrname.text=answer?[indexPath.row].psc_first_name ?? ""
             if (answer?[indexPath.row].comment_image)==""{
            itemcell.imageviewheight.constant=0
                itemcell.imageviewanswer.isHidden=true
            }else{
                itemcell.imageviewheight.constant=160
            let url = URL(string:answer?[indexPath.row].comment_image  ?? "")
            
            itemcell.imageviewanswer.isHidden=false
            itemcell.imageviewanswer.kf.indicatorType = .activity
            itemcell.imageviewanswer.kf.setImage(with: url)
            itemcell.imageviewanswer.contentMode = .scaleAspectFill
                }
                
           
                }
         return itemcell
        }
            
          
       // }
        
    
        
   
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
         return 400
    }
    
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
         return UITableView.automaticDimension
        
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
    if comment?[section].comment_image==""{
     return 210
      }else{

    return 418
      }
//
       }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//
//         return 150
//
//    }
    
    
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
         let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
        

        headerCell.lblname.text=comment?[section].psc_first_name ?? ""
        headerCell.lbltime.text=comment?[section].created_at1 ?? ""
        
        
        
        let olDateFormatter = DateFormatter()
                 olDateFormatter.dateFormat = "yyyy-mm-dd HH:mm:ss"

                 let oldDate = olDateFormatter.date(from: comment?[section].created_at1 ?? "")
                print("oldDate",oldDate)
                var today_date = Date()
                       let format = DateFormatter()
                       format.dateFormat = "yyyy-mm-dd HH:mm:ss"
                       format.timeZone = .current
        print("today_date",today_date)
         let calendar = Calendar.current
        let difference = calendar.dateComponents([.hour, .minute,.second,.day,.month,.year], from: today_date, to: oldDate as! Date)
        let hours = difference.hour!
        let minutes = difference.minute!
        let seconds = difference.hour!
        let day = difference.minute!
        let month=difference.month!
        print("hours",hours)
         print("minutes",minutes)
         print("seconds",seconds)
         print("day",day)
         print("month",month)
        
        
        if seconds>60{
            
        }else if minutes>60{
            
        }else if hours>24{
            
        }else if day>1{
            
        }
    
        
        
        
        
        headerCell.lblcomment.text=comment?[section].comment ?? ""
        headerCell.lblnoofsolutions.text=((comment?[section].details?.count ?? 0) as! NSNumber).stringValue+" Solutions"
        if comment?[section].comment_image==""{
        headerCell.imageviewheight.constant=0
           
            headerCell.imageviewqustn.isHidden=true
        }else{
            headerCell.imageviewheight.constant=160
           
        let url = URL(string:comment?[section].comment_image  ?? "")
        
        headerCell.imageviewqustn.isHidden=false
        headerCell.imageviewqustn.kf.indicatorType = .activity
        headerCell.imageviewqustn.kf.setImage(with: url)
        headerCell.imageviewqustn.contentMode = .scaleAspectFill
        }
        if comment?[section].details?.count ?? 0>0{
            headerCell.Outerview.setShadowEffect()
            
            headerCell.Outerview.layer.cornerRadius=10
            headerCell.Outerview.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
           // btncancelanswer.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
           // headerCell.Outerview.layer.ma
            headerCell.viewwritesolutionheight.constant=0
                  
            
       }else{
            headerCell.Outerview.setShadowEffect()
            headerCell.viewfoesolution.setShadowEffect()
            headerCell.viewwritesolutionheight.constant=59
        }
        
        headerCell.btndetails.tag=section
        
       headerCell.btndetails.addTarget(self, action: #selector(headerTapped(sender:)), for: .touchUpInside)
//        let tapGestureRecognizer = UITapGestureRecognizer(
//               target: self,
//               action: #selector(headerTapped(_:))
//           )
//        sectionshown=section
//           view.tag = section
//           headerCell.addGestureRecognizer(tapGestureRecognizer)
       
        let name=comment?[section].psc_first_name as! String
       // let io=name?.prefix(1) as! String
//        print("io",io)
        headerCell.btnqustnletter.setTitle("\(name.prefix(1))", for: .normal)
        return headerCell
    }
    
    @objc func headerTapped(sender: UIButton?) {
       
        print("sectionshown",sender?.tag)
        let commentdetail = self.storyboard?.instantiateViewController (withIdentifier: "CommentdetailViewController") as! CommentdetailViewController
       // commentdetail.sectionshown=sender?.tag ?? 0
       // commentdetail.comment=comment
        //commentdetail.details=comment?[sender?.tag ?? 0].details
        commentdetail.commentid=comment?[sender?.tag ?? 0].comment_id ?? ""
               commentdetail.week_id=week_id
                commentdetail.week_nameid=week_nameid
               commentdetail.preliminary_id=preliminary_id
               commentdetail.preliminaryflag=preliminaryflag
                   
               
                self.navigationController?.pushViewController(commentdetail, animated: true)
              
    }
    
    func convertDateFormat(inputDate: String) -> Date {

         let olDateFormatter = DateFormatter()
         olDateFormatter.dateFormat = "yyyy-mm-dd HH:mm:ss"

         let oldDate = olDateFormatter.date(from: inputDate)
        print("oldDate",oldDate)
        var today_date = Date()
               let format = DateFormatter()
               format.dateFormat = "yyyy-mm-dd HH:mm:ss"
               format.timeZone = .current
 let calendar = Calendar.current
        let difference = calendar.dateComponents([.hour, .minute,.second,.day], from: oldDate as! Date, to: today_date)
let hours = difference.hour!
let minutes = difference.minute!
print("hours",hours)
        return olDateFormatter.date(from: inputDate)!
    }
    
    
    func view_commentdata(data: Viewcommentclass) {
           print("data",data)
          
           let status=data.status
           if status==true{
            if data.data?.comments?.count==0{
                datafound=false
            }else{
                datafound=true
            }
               DispatchQueue.main.async{
                if self.comment?.count ?? 0==0{
                    self.comment=data.data?.comments
                }else{
                    self.comment!+=(data.data?.comments)!
                }
                 // self.comment=data.data?.comments
                  
                self.tableviewdoubts.reloadData()
                
               
                  
               }
           }else{
               DispatchQueue.main.async{
                  
                   
               }
           }
       }
       
    @IBAction func btnbackaction(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnimagepicker(_ sender: Any) {
        pickImage()
        
    }
    
    @IBAction func btninsertcomment(_ sender: Any) {
       
    self.uploadPhoto(image: self.imageToUpload, week_id: self.week_id,preliminary_id: self.preliminary_id,preliminaryflag: self.preliminaryflag,comment_id: "0",comment: self.txtfldaskyourdbts.text ?? "")
        
    }
    
//    func uploadUserDataedit(week_id:String,preliminary_id:String,preliminaryflag:Int,comment_id:String,comment:String) {
//        model.updateUserDataedit(image: imageToUpload, week_id: week_id,preliminary_id: preliminary_id,preliminaryflag: preliminaryflag,comment_id: comment_id,comment: comment).subscribe(
//               onNext:{ data in
//                   print("API success")
//                  self.viewpostdoubtheight.constant=150
//       self.imageviewdoubtpostedheight.constant=0
//       self.imageviewdoubtposted.isHidden=true
//       self.btncloseimage.isHidden=true
//                self.txtfldaskyourdbts.text=""
//                
//                self.enterphnemodel.week_id=week_id
//                self.enterphnemodel.week_nameid=self.week_nameid
//                self.enterphnemodel.preliminary_id=preliminary_id
//                self.enterphnemodel.preliminaryflag=preliminaryflag
//                self.enterphnemodel.page=self.page
//                self.enterphnemodel.view_comment{ (model) in
//                  self.view_commentdata(data:model)
//                            }
//           },onError:{ error in
//               print("error")
//           }).disposed(by: bag)
//       }
    
    func pickImage(){
        ImagePickerManager().pickImage(self) { image in
           // self.imageViewUser.image = image
            self.imageToUpload = image
            self.viewpostdoubtheight.constant=240
            self.imageviewdoubtpostedheight.constant=140
            self.imageviewdoubtposted.isHidden=false
            self.imageviewdoubtposted.image=image
            self.btncloseimage.isHidden=false
            
           // self.resize(self.imageToUpload)
           // self.uploadUserDataedit(week_id:self.week_id ?? "",preliminary_id: self.preliminary_id ?? "",preliminaryflag: self.preliminaryflag,comment_id: "0",comment:self.txtfldaskyourdbts.text ?? "")
           
        }
    }
    
    
    @IBAction func btnclosepostdoubtaction(_ sender: Any) {
        self.viewpostdoubtheight.constant=120
        self.imageviewdoubtpostedheight.constant=0
        self.imageviewdoubtposted.isHidden=true
        self.btncloseimage.isHidden=true
        
        
        
    }
    func apicall(){
    self.viewpostdoubtheight.constant=120
           self.imageviewdoubtpostedheight.constant=0
           self.imageviewdoubtposted.isHidden=true
           self.btncloseimage.isHidden=true
                    self.txtfldaskyourdbts.text=""
    
                    self.enterphnemodel.week_id=week_id
                    self.enterphnemodel.week_nameid=self.week_nameid
                    self.enterphnemodel.preliminary_id=preliminary_id
                    self.enterphnemodel.preliminaryflag=preliminaryflag
                    self.enterphnemodel.page=self.page
                    self.enterphnemodel.view_comment{ (model) in
                      self.view_commentdata(data:model)
                                }
    }
    

    
    func uploadPhoto(image: UIImage, week_id: String,preliminary_id: String,preliminaryflag: Int,comment_id: String,comment: String) {
         var mainctgryid=String()
        var userid=Int()
        
         if let user_id=UserDefaults.standard.value(forKey: "useridnew"){
           userid=UserDefaults.standard.value(forKey: "useridnew") as! Int
            }
            if let main_ctgry_id = UserDefaults.standard.value(forKey: "mainctgryid"){
                mainctgryid=UserDefaults.standard.value(forKey: "mainctgryid") as! String
                }
      
        let header: HTTPHeaders = [
            "Content-type": "multipart/form-data"
        ]
        let params: [String:Any] = ["main_category_id":mainctgryid,"user_id":userid,"week_id":week_id,"preliminary_id":preliminary_id,"comment_id":comment_id,"comment":comment]
        let url="http://pscrank.com/psc_coaching_admin/api_v2/Data/insert_comment"
    AF.upload(multipartFormData: { multiPart in
        for p in params {
            multiPart.append("\(p.value)".data(using: String.Encoding.utf8)!, withName: p.key)
        }
       multiPart.append(image.jpegData(compressionQuality: 0.4)!, withName: "comment_image", fileName: "file.jpg", mimeType: "image/jpg")
    }, to: url, method: .post, headers: header) .uploadProgress(queue: .main, closure: { progress in
        print("Upload Progress: \(progress.fractionCompleted)")
    }).responseJSON(completionHandler: { data in
        print("upload finished: \(data)")
    }).response { (response) in
        switch response.result {
        case .success(let resut):
            print("upload success result: \(resut)")
            self.apicall()
        case .failure(let err):
            print("upload err: \(err)")
        }
    }
}
}
