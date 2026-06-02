//
//  CoachingcategoryViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 08/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import StoreKit


@available(iOS 13.0, *)
class CoachingcategoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,SKProductsRequestDelegate,SKPaymentTransactionObserver{
    
    
    
    
    @IBOutlet weak var viewprofile: UIView!
    @IBOutlet weak var btnslidemenu: UIButton!
    @IBOutlet weak var btnmyprofile: UIButton!
    @IBOutlet weak var btnback: UIButton!
    @IBOutlet weak var lblsmartstudysubcatclicked: UILabel!
    @IBOutlet weak var tableviewpackages: UITableView!
    @IBOutlet weak var viewsyllabus: UIView!
    @IBOutlet weak var tableviewcoachingcategorywise: UITableView!
    var syllabus=SyllabusTableViewCell()
    var listing=ListingTableViewCell()
    var buttoncell=ButtonTableViewCell()
    var wanttojoin=IwanttojoinTableViewCell()
    var subscriptionlist=SpecialofferTableViewCell()
    var subscribeduser=SubscribedusersTableViewCell()
    var premiumid=String()
    var coachingctgrysmartstudy=Coachingcategorysmartsyudyviewmodel()
    var categorywisechapter:[Category_wise_chapter]?
    var categorywisepackage:[Category_wise_packagessmartstudy]?
    var wanttojoinflag=Int()
    var pscpremiumcatname=String()
    var subscriptionpackage:[Subscription_package]?
    var categorywisepackagessubscription:[Category_wise_packagessubscrptnlist]?
    var activesubscriptionpackage:[Active_subscription_package]?
    var usersubcribed=Int()
    var promoappliedindex=1000
    var finalamount=Int()
    var amount=String()
    var username=String()
    var mocktestctgryforpayment=String()
    var mocktestpaymentflag=Int()
    var actualusersubscription=Bool()
    var pscvideopackageidforpayment=String()
    var subscriptionlistidforpayment=String()
    var totalamountforpayment=String()
    var slidereportmodel=Slidereportviewmodel()
    var flagfrompayu=0
    
    var product:SKProduct!
    var productsArray=[SKProduct]()
    var productIdentifiers=Set<String>()
    var paymentmodel=Paymentviewmodel()
    var paymentflag=Int()
    var promocodeappliedsubscriptionid=String()
    var pscvideopackageperiod=String()
    var flagfromweekwise=Int()
    var examsubscriptionpackage:[ExamSubscription_package]?
    var examctgrywisepackage:[Category_packages]?
    var preliminaryid=String()
    var examsubscriptionidforpayment=String()
    var examcategoryid=String()
    var catgryid=String()
    var preliminaryflag=Int()
    var premiumcat_id=String()
    var paymentstatus=Bool()
    var promocodeentered=String()
    var theme=Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SKPaymentQueue.default().add(self)
        
        
        
        if usersubcribed==1||flagfromweekwise==1{
            viewsyllabus.isHidden=true
            tableviewpackages.isHidden=false
            tableviewpackages.delegate=self
            tableviewpackages.dataSource=self
        }else{
            viewsyllabus.isHidden=false
            tableviewpackages.isHidden=true
        }
        if pscpremiumcatname==""{
            lblsmartstudysubcatclicked.text="Categories"
        }else{
        
        lblsmartstudysubcatclicked.text=pscpremiumcatname
        }
        
        print("flagfromweekwise",flagfromweekwise)
        
        tableviewcoachingcategorywise.setShadowEffect()
        tableviewcoachingcategorywise.layer.cornerRadius=10
        coachingctgrysmartstudy.premiumid=premiumid
        if wanttojoinflag==2{
            coachingctgrysmartstudy.get_subscription_list{ (model) in
                self.getsubscriptionlistdata(data:model)
                
            }
        }else if flagfromweekwise==1{
            coachingctgrysmartstudy.preliminary_flag=preliminaryflag
            coachingctgrysmartstudy.preliminary_id=preliminaryid
            coachingctgrysmartstudy.get_exam_subscription_packages{ (model) in
                self.get_exam_subscription_packagesdata(data:model)
            }
            
        }else if usersubcribed==1{
            coachingctgrysmartstudy.premiumid=premiumcat_id
            coachingctgrysmartstudy.get_category_wise_video{ (model) in
                self.categorywisesmartstudy(data:model)
                
            }
        }
        
        if self.revealViewController() != nil { btnslidemenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
//        if let name=UserDefaults.standard.value(forKey: "username"){
//            username = UserDefaults.standard.value(forKey: "username") as! String
//            btnmyprofile.setTitle("Hi "+username, for: .normal)
//        }
    }
    
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        
        if flagfrompayu==1{
            DispatchQueue.main.async{
                self.showToast1(message: "Transaction failed please try again", font: .boldSystemFont(ofSize: 13), duration: 10)
            }
        }
        
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
        if wanttojoinflag==1{
            return 1
        }else if wanttojoinflag==2{
            return 2
        }else if usersubcribed==1{
            return 1
        }else if flagfromweekwise==1{
            return 2
        }else{
            return 3
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if wanttojoinflag==1{
            return categorywisepackage?.count ?? 0
        }else if wanttojoinflag==2{
            if section==0{
                return subscriptionpackage?.count ?? 0
            }else{
                return categorywisepackagessubscription?.count ?? 0
            }
            
        }else if usersubcribed==1{
            return categorywisechapter?.count ?? 0
        }else if flagfromweekwise==1{
            if section==0{
                return examsubscriptionpackage?.count ?? 0
            }else{
                return examctgrywisepackage?.count ?? 0
            }
        }else{
            if section==0{
                return 1
            }else if section==1{
                return categorywisechapter?.count ?? 0
            }else{
                return 1
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if wanttojoinflag==1{
            wanttojoin = (tableView.dequeueReusableCell(withIdentifier: "IwanttojoinTableViewCell", for: indexPath) as? IwanttojoinTableViewCell)!
            wanttojoin.lblpackage.text=categorywisepackage?[indexPath.row].psc_package_name ?? ""
            let price=(categorywisepackage?[indexPath.row].psc_package_period ?? "")+"Month - "+"Rs"
            let total = categorywisepackage?[indexPath.row].iOS_price ?? ""
            
            wanttojoin.lblprice.text=price+total
            wanttojoin.btnbuynow.tag=indexPath.row
            
            wanttojoin.btnbuynow.addTarget(self, action: #selector(btnbuynowwanttojoinactionsmartstudy(sender:)), for: .touchUpInside)
            return wanttojoin
        }else if wanttojoinflag==2{
            if indexPath.section==0{
                subscriptionlist = (tableView.dequeueReusableCell(withIdentifier: "SpecialofferTableViewCell", for: indexPath) as? SpecialofferTableViewCell)!
                lblsmartstudysubcatclicked.text="Subscriptions"
              subscriptionlist.lblsubscrptnpackage.text=subscriptionpackage?[indexPath.row].subscription_name
                
                subscriptionlist.btnapply.tag=indexPath.row
                subscriptionlist.btnsubscrptnlistbuynow.tag=indexPath.row
                print("promoappliedindex",promoappliedindex)
                if promoappliedindex==indexPath.row{
                   
                    subscriptionlist.btnsubscrptnlistbuynow.isHidden=false
                    subscriptionlist.btnapply.isHidden=true
                    let buttontitle="₹" + (subscriptionpackage?[indexPath.row].pc_iOS_price ?? "")+" Buy Now"
                    //subscriptionlist.btnapply.setTitle("₹"+String(finalamount)+" BUY NOW", for: .normal)
                    subscriptionlist.btnsubscrptnlistbuynow.setTitle(buttontitle, for: .normal)
                    // subscriptionlist.btnapply.backgroundColor = .systemBlue
                    subscriptionlist.txtfldpromocode.isHidden=true
                    subscriptionlist.lblactualamount.isHidden=false
                    // subscriptionlist.lblactualamount.text=amount
                    subscriptionlist.lblactualamount.text="₹"+(subscriptionpackage?[indexPath.row].iOS_price ?? "") ?? ""
                    //subscriptionlist.btnapply.tag=indexPath.row
                    //                    subscriptionlist.btnapply.addTarget(self, action: #selector(btnsubscrptnlistbuynowaction(sender:)), for: .touchUpInside)
                }else{
                    
                    subscriptionlist.btnsubscrptnlistbuynow.isHidden=false
                    subscriptionlist.btnapply.isHidden=false
                    subscriptionlist.btnapply.setTitle("Apply Now", for: .normal)
                   // subscriptionlist.btnapply.backgroundColor = .systemGreen
                    subscriptionlist.txtfldpromocode.isHidden=false
                    subscriptionlist.lblactualamount.isHidden=true
                   
                   
                    
                    let buttontitle="₹" + (subscriptionpackage?[indexPath.row].iOS_price ?? "")+" Join Now"
                    subscriptionlist.btnsubscrptnlistbuynow.setTitle(buttontitle, for: .normal)
                    
                    //                    subscriptionlist.btnapply.addTarget(self, action: #selector(btnpromoapplyaction(sender:)), for: .touchUpInside)
                    subscriptionlist.btnsubscrptnlistbuynow.addTarget(self, action: #selector(btnsubscrptnlistbuynowaction(sender:)), for: .touchUpInside)
                }
                 subscriptionlist.txtfldpromocode.delegate=self
                 
                subscriptionlist.btnapply.addTarget(self, action: #selector(btnpromoapplyaction(sender:)), for: .touchUpInside)
                
                return subscriptionlist
            }else{
                wanttojoin = (tableView.dequeueReusableCell(withIdentifier: "IwanttojoinTableViewCell", for: indexPath) as? IwanttojoinTableViewCell)!
                wanttojoin.lblpackage.text=categorywisepackagessubscription?[indexPath.row].psc_package_name ?? ""
                let price=(categorywisepackagessubscription?[indexPath.row].psc_package_period ?? "")+"Month - "+"Rs"
                let total = categorywisepackagessubscription?[indexPath.row].iOS_price ?? ""
                wanttojoin.lblprice.text=price+total
                wanttojoin.btnbuynow.tag=indexPath.row
                
                wanttojoin.btnbuynow.addTarget(self, action: #selector(btnbuynowwanttojoinactioncategorywise(sender:)), for: .touchUpInside)
                
                return wanttojoin
                
            }
            
        }else if flagfromweekwise==1{
            DispatchQueue.main.async{
                self.lblsmartstudysubcatclicked.text="Subscriptions"
            }
            if indexPath.section==0{
                subscriptionlist = (tableView.dequeueReusableCell(withIdentifier: "SpecialofferTableViewCell", for: indexPath) as? SpecialofferTableViewCell)!
                
                subscriptionlist.lblsubscrptnpackage.text=examsubscriptionpackage?[indexPath.row].cat_subscription_name
                
                subscriptionlist.btnapply.tag=indexPath.row
                subscriptionlist.btnsubscrptnlistbuynow.tag=indexPath.row
                print("promoappliedindex",promoappliedindex)
                
                subscriptionlist.btnsubscrptnlistbuynow.isHidden=false
                subscriptionlist.btnapply.isHidden=true
                
                
                subscriptionlist.txtfldpromocode.isHidden=true
                subscriptionlist.lblactualamount.isHidden=true
                subscriptionlist.txtfldpromocode.delegate=self
                subscriptionlist.btnsubscrptnlistbuynow.isHidden=false
                
                let buttontitle="₹" + (examsubscriptionpackage?[indexPath.row].iOS_price ?? "")+" Join Now"
                subscriptionlist.btnsubscrptnlistbuynow.setTitle(buttontitle, for: .normal)
                
                
                subscriptionlist.btnsubscrptnlistbuynow.addTarget(self, action: #selector(btnsubscrptnlistbuynowaction(sender:)), for: .touchUpInside)
                
                
                
                return subscriptionlist
            }else{
                wanttojoin = (tableView.dequeueReusableCell(withIdentifier: "IwanttojoinTableViewCell", for: indexPath) as? IwanttojoinTableViewCell)!
                wanttojoin.lblpackage.text=examctgrywisepackage?[indexPath.row].category_package_name ?? ""
                let price=(examctgrywisepackage?[indexPath.row].category_package_period ?? "")+"Month - "+"Rs"
                let total = examctgrywisepackage?[indexPath.row].iOS_price ?? ""
                wanttojoin.lblprice.text=price+total
                wanttojoin.btnbuynow.tag=indexPath.row
                
                wanttojoin.btnbuynow.addTarget(self, action: #selector(btnbuynowwanttojoinactioncategorywise(sender:)), for: .touchUpInside)
                
                return wanttojoin
                
            }
            
        }else if usersubcribed==1{
            subscribeduser = (tableView.dequeueReusableCell(withIdentifier: "SubscribedusersTableViewCell", for: indexPath) as? SubscribedusersTableViewCell)!
            subscribeduser.lblsyllabus.text=categorywisechapter?[indexPath.row].chapter_name
            return subscribeduser
        }else{
            
            if indexPath.section==0{
                syllabus = (tableView.dequeueReusableCell(withIdentifier: "SyllabusTableViewCell", for: indexPath) as? SyllabusTableViewCell)!
                syllabus.btnback.addTarget(self, action: #selector(btnbackaction(sender:)), for: .touchUpInside)
                return syllabus
                
            }else if indexPath.section==1{
                listing = (tableView.dequeueReusableCell(withIdentifier: "ListingTableViewCell", for: indexPath) as? ListingTableViewCell)!
                listing.lblsyllabus.text=categorywisechapter?[indexPath.row].chapter_name
                return listing
            }else{
                buttoncell = (tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as? ButtonTableViewCell)!
                buttoncell.btnwanttojoin.addTarget(self, action: #selector(btnwanttojoin(sender:)), for: .touchUpInside)
                buttoncell.btnspecialoffer.addTarget(self, action: #selector(btnspecialoffer(sender:)), for: .touchUpInside)
                return buttoncell
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if wanttojoinflag==1{
            return 159
        }else if wanttojoinflag==2{
            if indexPath.section==0{
                if indexPath.row == promoappliedindex{
                    return 230
                }else{
                    return 230
                }
            }else{
                return 159
            }
            
            
            
        }else if usersubcribed==1{
            return 85
        }else if flagfromweekwise==1{
            if indexPath.section==0{
                return 200
            }else{
                return 180
            }
        }else{
            if indexPath.section==0{
                return 65
            }else if indexPath.section==1{
                return 60
            }else{
                return 125
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
       // if actualusersubscription==true{
        if usersubcribed==1{
            let exclusive = self.storyboard?.instantiateViewController (withIdentifier: "ExclusivecoachingViewController") as! ExclusivecoachingViewController
            exclusive.premiumcatid=categorywisechapter?[indexPath.row].psc_premium_category_id ?? ""
            exclusive.chapterid=categorywisechapter?[indexPath.row].chapter_id ?? ""
            self.navigationController?.pushViewController(exclusive, animated: true)
        }
        
    }
    
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        promocodeentered=""
//        subscriptionlist.txtfldpromocode.text=""
//        print("promocodeentered",promocodeentered)
//    }
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
//
//        promocodeentered+=string
//         print("promocodeentered",promocodeentered)
//        return true
//    }
//
//
    
    
    @objc func btnbackaction(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func btnwanttojoin(sender: UIButton){
        wanttojoinflag=1
        viewsyllabus.isHidden=true
        tableviewpackages.delegate=self
        tableviewpackages.dataSource=self
        tableviewpackages.isHidden=false
        tableviewpackages.reloadData()
        
    }
    @objc func btnspecialoffer(sender: UIButton){
        
        
        coachingctgrysmartstudy.get_subscription_list{ (model) in
            self.getsubscriptionlistdata(data:model)
            
        }
        wanttojoinflag=2
        lblsmartstudysubcatclicked.text="Subscriptions"
        viewsyllabus.isHidden=true
        
        tableviewpackages.delegate=self
        tableviewpackages.dataSource=self
        tableviewpackages.isHidden=false
        
        
    }
    
    
    
    
    @objc func btnpromoapplyaction(sender: UIButton){
        print("promocodeentered",promocodeentered)
        if promoappliedindex==sender.tag{
            subscriptionlist.btnapply.addTarget(self, action: #selector(btnsubscrptnlistbuynowaction(sender:)), for: .touchUpInside)
        }else{
            print("promoappliedindex",promoappliedindex)
            //        let indexpath = IndexPath(row: sender.tag, section: 0)
            //        subscriptionlist = tableviewpackages.cellForRow(at: indexpath) as! SpecialofferTableViewCell
            
            promoappliedindex=sender.tag
            promocodeappliedsubscriptionid=subscriptionpackage?[sender.tag].subscription_id ?? ""
            coachingctgrysmartstudy.promocode=subscriptionlist.txtfldpromocode.text!
            coachingctgrysmartstudy.amount=subscriptionpackage?[sender.tag].iOS_price ?? ""
            coachingctgrysmartstudy.apply_promo_code{ (model) in
                self.applypromocodedata(data:model)
            }
        }
    }
    
    
    //    @objc func btnbuynowwanttojoinaction(sender:UIButton){
    //        if wanttojoinflag==1{
    //            pscvideopackageidforpayment=categorywisepackage?[sender.tag].psc_video_package_id ?? ""
    //            totalamountforpayment=categorywisepackage?[sender.tag].psc_package_price ?? ""
    //        }else if wanttojoinflag==2{
    //            pscvideopackageidforpayment=categorywisepackagessubscription?[sender.tag].psc_video_package_id ?? ""
    //            totalamountforpayment=categorywisepackagessubscription?[sender.tag].psc_package_price ?? ""
    //        }
    //
    //        let payment = self.storyboard?.instantiateViewController (withIdentifier: "PaymentViewController") as! PaymentViewController
    //        payment.pscvideopackageid=pscvideopackageidforpayment
    //
    //        payment.paymentflag=2
    //         payment.totalPriceAmount=totalamountforpayment
    //        self.navigationController?.pushViewController(payment, animated: true)
    //
    //    }
    
    //    @objc func btnsubscrptnlistbuynowaction(sender:UIButton){
    //        if promoappliedindex==sender.tag{
    //            totalamountforpayment=String(finalamount)
    //        }else{
    //           totalamountforpayment=subscriptionpackage?[sender.tag].subscription_price ?? ""
    //        }
    //        subscriptionlistidforpayment=subscriptionpackage?[sender.tag].subscription_id ?? ""
    //         //pscvideopackageidforpayment=categorywisepackagessubscription?[sender.tag].psc_video_package_id ?? ""
    //
    //       let payment = self.storyboard?.instantiateViewController (withIdentifier: "PaymentViewController") as! PaymentViewController
    //         payment.paymentflag=3
    //         payment.totalPriceAmount=totalamountforpayment
    //        payment.subscriptionlistidforpayment=subscriptionlistidforpayment
    //        self.navigationController?.pushViewController(payment, animated: true)
    //    }
    
    
    
    func get_exam_subscription_packagesdata(data: Examsubscriptnclass) {
        
        let status=data.status
        
        if status==true{
            DispatchQueue.main.async{
                self.examctgrywisepackage=data.data?.category_packages
                self.examsubscriptionpackage=data.data?.subscription_package
                //self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                print("examctgrywisepackage",self.examctgrywisepackage)
                self.tableviewpackages.isHidden=false
                self.tableviewpackages.delegate=self
                self.tableviewpackages.dataSource=self
                if self.examsubscriptionpackage?.count ?? 0>0{
                    for i in 0...(self.examsubscriptionpackage?.count ?? 0)-1{
                        
                        let productidentifiers=self.examsubscriptionpackage?[i].product_id
                        self.productIdentifiers.insert(productidentifiers ?? "")
                        
                        
                        print("productIdentifiers",self.productIdentifiers)
                    }
                    self.requestProductData()
                }
                if self.examctgrywisepackage?.count ?? 0>0{
                    for i in 0...(self.examctgrywisepackage?.count ?? 0)-1{
                        let productidentifiers=self.examctgrywisepackage?[i].product_id
                        self.productIdentifiers.insert(productidentifiers ?? "")
                        print("productIdentifiers",self.productIdentifiers)
                    }
                    self.requestProductData()
                }
                
                
                
                self.tableviewpackages.reloadData()
            }
        }else{
            
            DispatchQueue.main.async{
                // self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
        
        
        
        
        
    }
    
    
    
    func applypromocodedata(data: Applypromocodeclass) {
        print("data",data)
        print("status",data.status)
        let status=data.status
        
        if status==true{
            DispatchQueue.main.async{
                //                self.finalamount=200
                //self.finalamount=data.data?.final_amount ?? 0
                //self.amount=data.data?.amount ?? ""
                self.coachingctgrysmartstudy.get_subscription_list{ (model) in
                    self.getsubscriptionlistdata(data:model)
                    
                }
                // self.tableviewpackages.reloadData()
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
            }
        }else{
            
            DispatchQueue.main.async{
                self.promoappliedindex=1000
              
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
       
        
    }
    
    
    
    func categorywisesmartstudy(data: categorywisevideoclass) {
        print("data",data)
        productIdentifiers.removeAll()
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                self.categorywisechapter=data.data?.category_wise_chapter
                self.categorywisepackage=data.data?.category_wise_packages
                self.actualusersubscription=(data.data?.user_subscription_status)!
               // self.actualusersubscription=true
                self.paymentstatus=(data.data?.payment_status)!
                if self.actualusersubscription==true{
                    self.usersubcribed=1
                }else{
                    if self.paymentstatus==true{
                        self.usersubcribed=1
                    }else{
                        self.usersubcribed=0
                    }
                    
                }
                
                if self.categorywisepackage?.count ?? 0>0{
                    for i in 0...(self.categorywisepackage?.count ?? 0)-1{
                        let productidentifiers=self.categorywisepackage?[i].product_id
                        self.productIdentifiers.insert(productidentifiers ?? "")
                        print("productIdentifiers",self.productIdentifiers)
                    }
                    self.requestProductData()
                }
                
                if self.usersubcribed==1{
                    self.viewsyllabus.isHidden=true
                    self.tableviewpackages.isHidden=false
                    self.tableviewpackages.reloadData()
                }else{
                     self.viewsyllabus.isHidden=false
                     self.tableviewcoachingcategorywise.isHidden=false
                    self.tableviewcoachingcategorywise.reloadData()
                }
                
                //  self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
    func getsubscriptionlistdata(data: Subscriptionlistcalss) {
        print("data",data)
        
        productIdentifiers.removeAll()
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                self.categorywisepackagessubscription=data.data?.category_wise_packages
                self.subscriptionpackage=data.data?.subscription_package
                //self.activesubscriptionpackage=data.data?.active_subscription_package
                for i in 0...(self.subscriptionpackage?.count ?? 0)-1{
                    if self.promocodeappliedsubscriptionid==self.subscriptionpackage?[i].subscription_id{
                        let productidentifiers=self.subscriptionpackage?[i].pc_product_id
                        self.productIdentifiers.insert(productidentifiers ?? "")
                    }else{
                        let productidentifiers=self.subscriptionpackage?[i].product_id
                        self.productIdentifiers.insert(productidentifiers ?? "")
                    }
                    self.requestProductData()
                    print("productIdentifiers",self.productIdentifiers)
                }
                if self.categorywisepackagessubscription?.count ?? 0>0{
                    for i in 0...(self.categorywisepackagessubscription?.count ?? 0)-1{
                        let productidentifiers=self.categorywisepackagessubscription?[i].product_id
                        self.productIdentifiers.insert(productidentifiers ?? "")
                        print("productIdentifiers",self.productIdentifiers)
                    }
                    self.requestProductData()
                }
                
               
                self.tableviewpackages.reloadData()
                // self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
    
    
    
    
    
    @IBAction func btnbackaction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnmyprofileaction(_ sender: Any) {
        //        if viewprofile.isHidden==true{
        //            viewprofile.isHidden=false
        //        }else{
        //            viewprofile.isHidden=true
        //        }
        
        
    }
    
    @IBAction func btnslidemenuaction(_ sender: Any) {
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
    
    
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        print("productsArray",productsArray)
        var products:[SKProduct] = response.products
        
        if (products.count != 0) {
            
            for i in 0 ..< products.count {
                
                self.product = products[i]
                
                self.productsArray.append(product!)
                
            }
            print("There are",productsArray)
            
            
            print("There are \(productsArray.count) elements in the productsArray.")
            
            //  self.tableView.reloadData()
            
        } else {
            DispatchQueue.main.async {
                
                
                
                self.showToast(message: "No products found", font: .boldSystemFont(ofSize: 13), duration: 10)
                
            }
        }
        
        
        let invalidProductIds = response.invalidProductIdentifiers
        
        
        
        if invalidProductIds.count != 0 {
            
            var message = [String]()
            
            message.append("No products found for the following product id(s):\n")
            
            
            
            for pid in invalidProductIds {
                
                message.append(pid)
                
            }
            
            
            
            // showAlertView(message.joinWithSeparator("\n"))
            
        }
    }
    
    func requestProductData() {
        
        //        if wanttojoinflag==2{
        
        if SKPaymentQueue.canMakePayments() {
            
            let productRequest = SKProductsRequest(productIdentifiers:self.productIdentifiers)
            
            productRequest.delegate = self
            
            productRequest.start()
            
            print("Product request was sent to the App Store.")
            
            //        }else if wanttojoinflag==1{
            //
            //            if SKPaymentQueue.canMakePayments() {
            //
            //                let productRequest = SKProductsRequest(productIdentifiers:self.productIdentifiers)
            //
            //                productRequest.delegate = self
            //
            //                productRequest.start()
            //
            //                print("Product request was sent to the App Store.")
            //            }
            
            //        }
            
        } else {
            
            let alertView = UIAlertController(title: "In-App Purchases Not Enabled",
                                              
                                              message: "Please enable In-App Purchase in Settings",
                                              
                                              preferredStyle: .alert)
            
            
            
            let settingsButton = UIAlertAction(title: "Settings", style: .default) {
                
                UIAlertAction in
                
                alertView.dismiss(animated: true, completion: nil)
                
                let url: NSURL? = NSURL(string: UIApplication.openSettingsURLString)
                
                
                
                if url != nil {
                    
                    UIApplication.shared.openURL(url! as URL)
                    
                }
                
            }
            
            
            
            let okButton = UIAlertAction(title: "OK", style: .default) {
                
                UIAlertAction in
                
                alertView.dismiss(animated: true, completion: nil)
                
            }
            
            
            
            alertView.addAction(settingsButton)
            
            alertView.addAction(okButton)
            
            
            
            DispatchQueue.main.async{
                
                self.present(alertView, animated: true, completion: nil)
                
            }
            
        }
    }
    
    
    @objc func btnbuynowwanttojoinactioncategorywise(sender:UIButton){
        paymentflag=1
        if productsArray.count>0{
            if flagfromweekwise==1{
                examcategoryid=examctgrywisepackage?[sender.tag].category_package_id ?? ""
                catgryid=preliminaryid
                for i in 0...productsArray.count-1{
                    let productid=productsArray[i].productIdentifier
                    print("productid",productid)
                    print("",examctgrywisepackage?[sender.tag].product_id)
                    if productid==examctgrywisepackage?[sender.tag].product_id{
                        print("productsArray[i]",productsArray[i])
                        var payment = SKPayment(product: productsArray[i])
                        SKPaymentQueue.default().add(payment)
                        SKPaymentQueue.default().add(self)
                    }
                }
                
            }else{
                
                pscvideopackageidforpayment=categorywisepackagessubscription?[sender.tag].psc_video_package_id ?? ""
                pscvideopackageperiod=categorywisepackagessubscription?[sender.tag].psc_package_period ?? ""
                for i in 0...productsArray.count-1{
                    let productid=productsArray[i].productIdentifier
                    print("productid",productid)
                    print("",categorywisepackagessubscription?[sender.tag].product_id)
                    if productid==categorywisepackagessubscription?[sender.tag].product_id{
                        print("productsArray[i]",productsArray[i])
                        var payment = SKPayment(product: productsArray[i])
                        SKPaymentQueue.default().add(payment)
                        SKPaymentQueue.default().add(self)
                    }
                }
            }
        }
        
        
    }
    
    @objc func  btnbuynowwanttojoinactionsmartstudy(sender:UIButton){
        print("productsArray",productsArray)
        
        paymentflag=1
        pscvideopackageperiod=categorywisepackagessubscription?[sender.tag].psc_package_period ?? ""
        pscvideopackageidforpayment=categorywisepackage?[sender.tag].psc_video_package_id ?? ""
        for i in 0...productsArray.count-1{
            let productid=productsArray[i].productIdentifier
            print("productid",productid)
            print("",categorywisepackage?[sender.tag].product_id)
            if productid==categorywisepackage?[sender.tag].product_id{
                print("productsArray[i]",productsArray[i])
                var payment = SKPayment(product: productsArray[i])
                SKPaymentQueue.default().add(payment)
                SKPaymentQueue.default().add(self)
            }
        }
    }
    
    
    
    
    @objc func btnsubscrptnlistbuynowaction(sender: UIButton){
        paymentflag=2
        if productsArray.count>0{
            if flagfromweekwise==1{
                examsubscriptionidforpayment=examsubscriptionpackage?[sender.tag].cat_subscription_id ?? ""
                for i in 0...productsArray.count-1{
                    let productid=productsArray[i].productIdentifier
                    print("productid",productid)
                    print("",examsubscriptionpackage?[sender.tag].product_id)
                    if productid==examsubscriptionpackage?[sender.tag].product_id{
                        print("productsArray[i]",productsArray[i])
                        var payment = SKPayment(product: productsArray[i])
                        SKPaymentQueue.default().add(payment)
                        SKPaymentQueue.default().add(self)
                    }
                }
                
                
                
            }else{
                
                subscriptionlistidforpayment=subscriptionpackage?[sender.tag].subscription_id ?? ""
                for i in 0...productsArray.count-1{
                    let productid=productsArray[i].productIdentifier
                    print("productid",productid)
                    print("",subscriptionpackage?[sender.tag].product_id)
                    if productid==subscriptionpackage?[sender.tag].product_id{
                        print("productsArray[i]",productsArray[i])
                        var payment = SKPayment(product: productsArray[i])
                        SKPaymentQueue.default().add(payment)
                        SKPaymentQueue.default().add(self)
                    }
                }
            }
        }
    }
    
    func startObserving() {
        SKPaymentQueue.default().add(self)
    }
    
    
    func stopObserving() {
        SKPaymentQueue.default().remove(self)
    }
    
    
    
    
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("paymentflag",paymentflag)
        for transaction:AnyObject in transactions {
            if let trans:SKPaymentTransaction = transaction as? SKPaymentTransaction{
                switch trans.transactionState {
                    
                case .purchased:
                    print("Product Purchased");
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    print(transaction.transactionIdentifier)
                    paymentmodel.transactionid=transaction.transactionIdentifier ?? ""
                    print(transaction.transactionIdentifier)
                    print(transaction.status)
                    paymentmodel.paymentstatus="Success"
                    // paymentmodel.paymenttype=transaction.transa
                    receiptValidation()
                    if paymentflag==1{
                        paymentsubmsion()
                    }else{
                        paymentsubmsion1()
                    }
                    
                    break;
                case .failed:
                    print("Purchased Failed");
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    //                    paymentmodel.transactionid=transaction.transactionIdentifier ?? ""
                    //                    print(transaction.transactionIdentifier)
                    //                    print(transaction.status)
                    //                    paymentmodel.paymentstatus="Success"
                    //                    //paymentmodel.paymenttype="Card"
                    //                    if paymentflag==1{
                    //                    paymentsubmsion()
                    //                    }else{
                    //                    paymentsubmsion1()
                    //                    }
                    //
                    //                    print(transaction.transactionIdentifier)
                    //receiptValidation()
                    break;
                    // case .Restored:
                //[self restoreTransaction:transaction];
                default:
                    break;
                }
            }
        }
    }
    
    func receiptValidation() {
        
        //        let verifyReceiptURL = "https://sandbox.itunes.apple.com/verifyReceipt"
        
        let verifyReceiptURL = "https://buy.itunes.apple.com/verifyReceipt"
        
        
        let receiptFileURL = Bundle.main.appStoreReceiptURL
        let receiptData = try? Data(contentsOf: receiptFileURL!)
        let recieptString = receiptData?.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        let jsonDict: [String: AnyObject] = ["receipt-data" : recieptString! as AnyObject, "password" : "ee70188badc24b1fa8c78f1ddb4cbb3a" as AnyObject]
        
        do {
            let requestData = try JSONSerialization.data(withJSONObject: jsonDict, options: JSONSerialization.WritingOptions.prettyPrinted)
            let storeURL = URL(string: verifyReceiptURL)!
            var storeRequest = URLRequest(url: storeURL)
            storeRequest.httpMethod = "POST"
            storeRequest.httpBody = requestData
            
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task = session.dataTask(with: storeRequest, completionHandler: { [weak self] (data, response, error) in
                
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                    print("=======>",jsonResponse)
                    if let date = self?.getExpirationDateFromResponse(jsonResponse as! NSDictionary) {
                        print(date)
                        
                    }
                } catch let parseError {
                    print(parseError)
                }
            })
            task.resume()
        } catch let parseError {
            print(parseError)
        }
    }
    func getExpirationDateFromResponse(_ jsonResponse: NSDictionary) -> Date? {
        
        if let receiptInfo: NSArray = jsonResponse["latest_receipt_info"] as? NSArray {
            
            let lastReceipt = receiptInfo.lastObject as! NSDictionary
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss VV"
            
            if let expiresDate = lastReceipt["expires_date"] as? String {
                return formatter.date(from: expiresDate)
            }
            
            return nil
        }
        else {
            return nil
        }
    }
    func paymentsubmsion(){
        if flagfromweekwise==1{
            paymentmodel.subscription_id=examcategoryid
            paymentmodel.catgryidforexam=preliminaryid
            paymentmodel.submit_week_category_packages{ (model) in
                self.submitmocktestpaymentdata(data:model)
            }
        }else{
            paymentmodel.video_package_id=pscvideopackageidforpayment
            paymentmodel.pscvideoperiod=pscvideopackageperiod
            paymentmodel.submit_coaching_payment{ (model) in
                self.submitmocktestpaymentdata(data:model)
            }
        }
    }
    func paymentsubmsion1(){
        if flagfromweekwise==1{
            paymentmodel.subscription_id=examsubscriptionidforpayment
            paymentmodel.catgryidforexam=preliminaryid
            paymentmodel.submit_week_category_packages{ (model) in
                self.submitmocktestpaymentdata(data:model)
            }
        }else{
            paymentmodel.subscription_id=subscriptionlistidforpayment
            paymentmodel.submit_week_wise_subscription{ (model) in
                self.submitmocktestpaymentdata(data:model)
                
            }
        }
    }
    
    
    func submitmocktestpaymentdata(data: Paymentsuccessclass) {
        
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                
                
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 10)
                
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
        DispatchQueue.main.async{
            let home = self.storyboard?.instantiateViewController (withIdentifier: "HomepageViewController") as! HomepageViewController
            
            self.navigationController?.pushViewController(home, animated: true)
        }
        
    }
    
}
//@available(iOS 13.0, *)
//extension CoachingcategoryViewController:SKPaymentTransactionObserver{
//
//    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
//        for transaction:AnyObject in transactions {
//                if let trans:SKPaymentTransaction = transaction as? SKPaymentTransaction{
//                    switch trans.transactionState {
//                    case .purchased:
//                        print("Product Purchased");
//                        SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
//                        break;
//                    case .failed:
//                        print("Purchased Failed");
//                        SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
//                        break;
//                    // case .Restored:
//                    //[self restoreTransaction:transaction];
//                    default:
//                        break;
//                    }
//                }
//            }
//        }
//
//
//}
