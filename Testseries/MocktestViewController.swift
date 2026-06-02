//
//  MocktestViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 23/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import StoreKit
@available(iOS 13.0, *)
class MocktestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,SKProductsRequestDelegate,SKPaymentTransactionObserver {
    
    
    
    
    @IBOutlet weak var viewprofile: UIView!
    @IBOutlet weak var btnmyprofile: UIButton!
    @IBOutlet weak var btnslidemenu: UIButton!
    @IBOutlet weak var tableviewmocktest: UITableView!
    var staticcell=StaticTableViewCell()
    var dynamic=DynamicTableViewCell()
    var mocktest_sries=MegatestsTableViewCell()
    var mocktestmodel=Mocktestviewmodel()
    var mockestctgry:[Mock_test_category]?
    var mocktestseries:[Mock_test_series]?
    var viewflag=0
    var mocktestpayment=Bool()
    var username=String()
    var slidereportmodel=Slidereportviewmodel()
    var mockcategoryidforpayment=String()
    var flagfrompayu=0
    var totalamount=String()
    var product:SKProduct!
    var productsArray=[SKProduct]()
    var productIdentifiers=Set<String>()
    var sendertag=Int()
    var paymentmodel=Paymentviewmodel()
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SKPaymentQueue.default().add(self)
        
        mocktestmodel.get_mock_test_new_ios{ (model) in
            self.mocktest(data:model)
        }
        if self.revealViewController() != nil {
            btnslidemenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        if let name=UserDefaults.standard.value(forKey: "username"){
            username = UserDefaults.standard.value(forKey: "username") as! String
            btnmyprofile.setTitle("Hi "+username, for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        viewprofile.isHidden=true
        if flagfrompayu==1{
            DispatchQueue.main.async{
            self.showToast1(message: "Transaction failed please try again", font: .boldSystemFont(ofSize: 13), duration: 10)
            }
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0{
            return 1
        }else{
            if viewflag==1{
                return mocktestseries?.count ?? 0
            }else{
                return mockestctgry?.count ?? 0
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section==0{
            staticcell = (tableView.dequeueReusableCell(withIdentifier: "StaticTableViewCell", for: indexPath) as? StaticTableViewCell)!
            if viewflag==1{
                staticcell.lblmegatestsheading.isHidden=false
                if mocktestpayment==false{
                    staticcell.btnpaynow.isHidden=false
                }else{
                    staticcell.btnpaynow.isHidden=true
                }
            }else{
                staticcell.lblmegatestsheading.isHidden=true
                staticcell.btnpaynow.isHidden=true
            }
            staticcell.btnpaynow.tag=indexPath.row
            staticcell.btnpaynow.addTarget(self, action: #selector(btnpaynowaction(sender:)), for: .touchUpInside)
            
            return staticcell
            
            
        }else{
            if viewflag==1{
                mocktest_sries = (tableView.dequeueReusableCell(withIdentifier: "MegatestsTableViewCell", for: indexPath) as? MegatestsTableViewCell)!
                mocktest_sries.lblinstruction.lineBreakMode = .byWordWrapping
                mocktest_sries.lblinstruction.numberOfLines = 0
                mocktest_sries.lblinstruction.sizeToFit()
                mocktest_sries.lbltestname.text=mocktestseries?[indexPath.row].psc_mock_test_name ?? ""
                mocktest_sries.lblinstruction.attributedText=(mocktestseries?[indexPath.row].psc_mock_test_instruction ?? "").convertToAttributedString1()
                mocktest_sries.lblexamtime.text=String(mocktestseries?[indexPath.row].psc_mock_test_time ?? "")+" minutes"
                mocktest_sries.btnview.tag=indexPath.row
                mocktest_sries.btnview.addTarget(self, action: #selector(btnviewactionmegatest(sender:)), for: .touchUpInside)
                if mocktestpayment==false&&(mocktestseries?[indexPath.row].psc_mock_test_lock ?? "")=="0"{
                    mocktest_sries.isUserInteractionEnabled=true
                    mocktest_sries.btnview.backgroundColor=UIColor.blue
                }else if mocktestpayment==true{
                    mocktest_sries.isUserInteractionEnabled=true
                    mocktest_sries.btnview.backgroundColor=UIColor.blue
                }else{
                    mocktest_sries.isUserInteractionEnabled=false
                    mocktest_sries.btnview.backgroundColor=UIColor.lightGray
                }
                
                if mocktestseries?[indexPath.row].psc_mock_price=="1"{
                    staticcell.btnpaynow.isHidden=true
                }else{
                    staticcell.btnpaynow.isHidden=false
                }
                
                return mocktest_sries
            }else{
                
                dynamic = (tableView.dequeueReusableCell(withIdentifier: "DynamicTableViewCell", for: indexPath) as? DynamicTableViewCell)!
                dynamic.lblctgryname.text=mockestctgry?[indexPath.row].psc_mock_category_name ?? ""
                dynamic.lbltestcount.text=(mockestctgry![indexPath.row].mock_test_count as! NSNumber).stringValue + "Mock Test"
                dynamic.btnview.tag=indexPath.row
                //
                dynamic.btnview.addTarget(self, action: #selector(btnviewaction(sender:)), for: .touchUpInside)
                return dynamic
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==0{
            return 230
        }else{
            if viewflag==1{
                return UITableView.automaticDimension
            }else{
                return 120
            }
        }
    }
    
    func mocktest(data: Mocktest) {
        print("data",data)
        
        
        let status=data.status
        mockestctgry=data.data?.mock_test_category
        
        if status==true{
            
            for i in 0...(self.mockestctgry?.count ?? 0)-1{
                let productidentifiers=self.mockestctgry?[i].product_id
                self.productIdentifiers.insert(productidentifiers ?? "")
                print("productIdentifiers",self.productIdentifiers)
            }
            self.requestProductData()
            DispatchQueue.main.async{
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                self.tableviewmocktest.reloadData()
            }
        }else{
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
    func mocktestseries(data: Mocktestseriesclass) {
        print("data",data)
        
        
        let status=data.status
        
        
        if status==true{
            self.mocktestseries=data.data?.mock_test_series
            mocktestpayment=(data.data?.mock_test_payment)!
            DispatchQueue.main.async{
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                self.tableviewmocktest.reloadData()
            }
        }else{
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    //    @objc func btnpaynowaction(sender:UIButton){
    //        let payment = self.storyboard?.instantiateViewController (withIdentifier: "PaymentViewController") as! PaymentViewController
    //        payment.totalPriceAmount="1"
    //            payment.paymentflag=1
    //             payment.mocktestctgryforpayment=mockcategoryidforpayment
    //            self.navigationController?.pushViewController(payment, animated: true)
    //
    //    }
    
    @objc func btnpaynowaction(sender:UIButton){
        for i in 0...productsArray.count-1{
            let productid=productsArray[i].productIdentifier
            print("productid",productid)
            print("",mockestctgry?[sendertag].product_id)
            if productid==mockestctgry?[sendertag].product_id{
                print("productsArray[i]",productsArray[i])
                var payment = SKPayment(product: productsArray[i])
                SKPaymentQueue.default().add(payment)
                SKPaymentQueue.default().add(self)
            }
        }
    }
    
    @objc func btnviewaction(sender:UIButton){
        viewflag=1
        sendertag=sender.tag
        //totalamount=mockestctgry?[sender.tag].iOS_price ?? ""
        mockcategoryidforpayment=mockestctgry?[sender.tag].psc_mock_category_id ?? ""
        mocktestmodel.mocksubcatid=mockestctgry?[sender.tag].psc_mock_category_id ?? ""
        
        mocktestmodel.get_mock_test_series_new_ios{ (model) in
            self.mocktestseries(data:model)
        }
        
    }
    @objc func btnviewactionmegatest(sender:UIButton){
        let instructions = self.storyboard?.instantiateViewController (withIdentifier: "InstructiondailyeaxamViewController") as! InstructiondailyeaxamViewController
        instructions.instructionstext=mocktestseries?[sender.tag].psc_mock_test_instruction ?? ""
        instructions.mocktestflag=1
        instructions.mocktestseriesid=mocktestseries?[sender.tag].psc_mock_test_series_id ?? ""
        self.navigationController?.pushViewController(instructions, animated: true)
    }
    
    @IBAction func btnmyprofilecation(_ sender: Any) {
        if viewprofile.isHidden==true{
            viewprofile.isHidden=false
        }else{
            viewprofile.isHidden=true
        }
        
    }
    
    
    @IBAction func btnfeedscation(_ sender: Any) {
        viewprofile.isHidden=true
        let home = self.storyboard?.instantiateViewController (withIdentifier: "HomepageViewController") as! HomepageViewController
        home.selectionflag=1
        self.navigationController?.pushViewController(home, animated: false)
        
    }
    
    
    @IBAction func btnprepareaction(_ sender: Any) {
        viewprofile.isHidden=true
        let home = self.storyboard?.instantiateViewController (withIdentifier: "HomepageViewController") as! HomepageViewController
        home.selectionflag=2
        self.navigationController?.pushViewController(home, animated: false)
    }
    
    @IBAction func btndailyeaxamaction(_ sender: Any) {
        viewprofile.isHidden=true
        let dailyexam = self.storyboard?.instantiateViewController (withIdentifier: "DailyexamViewController") as! DailyexamViewController
        
        self.navigationController?.pushViewController(dailyexam, animated: false)
    }
    
    @IBAction func btntestserieasaction(_ sender: Any) {
        viewprofile.isHidden=true
        let testseries = self.storyboard?.instantiateViewController (withIdentifier: "MocktestViewController") as! MocktestViewController
        
        self.navigationController?.pushViewController(testseries, animated: false)
    }
    
    @IBAction func btncoachingaction(_ sender: Any) {
        viewprofile.isHidden=true
        let coaching = self.storyboard?.instantiateViewController (withIdentifier: "CoachingViewController") as! CoachingViewController
        
        self.navigationController?.pushViewController(coaching, animated: false)
        
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
            
            //  self.showToast(message: "\(message.joinWithSeparator("\n"))", font: .boldSystemFont(ofSize: 13), duration: 10)
            
            
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
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction:AnyObject in transactions {
            if let trans:SKPaymentTransaction = transaction as? SKPaymentTransaction{
                switch trans.transactionState {
                case .purchased:
                    print("Product Purchased");
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    paymentmodel.transactionid=transaction.transactionIdentifier ?? ""
                    print(transaction.transactionIdentifier)
                    print(transaction.status)
                    paymentmodel.paymentstatus="Success"
                    // paymentmodel.paymenttype=transaction.transa
                    paymentsubmission()
                    receiptValidation()
                    break;
                case .failed:
                    print("Purchased Failed");
                    
                    SKPaymentQueue.default().finishTransaction(transaction as! SKPaymentTransaction)
                    print(transaction.transactionIdentifier)
                    break;
                    // case .Restored:
                //[self restoreTransaction:transaction];
                default:
                    break;
                }
            }
        }
    }
    func paymentsubmission(){
    paymentmodel.mock_category_id=mockcategoryidforpayment
    paymentmodel.submit_mock_test_payment{ (model) in
        self.submitmocktestpaymentdata(data:model)
        
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
