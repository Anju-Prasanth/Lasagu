//
//  QuestionsViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 30/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
import UserNotifications
import MBProgressHUD

@available(iOS 13.0, *)
class QuestionsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,selectedanswertapped,tableheightdelegate{
    
    
    @IBOutlet weak var iconsortup: UIImageView!
    @IBOutlet weak var tableviewqustnanwers: UITableView!
    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    @IBOutlet weak var viewouter: UIView!
    @IBOutlet weak var btncancelanswer: UIButton!
    @IBOutlet weak var btnsubmitanswer: UIButton!
    @IBOutlet weak var viewevaluationcompleted: UIView!
    @IBOutlet weak var viewbtns: UIView!
    @IBOutlet weak var viewsubmitanswer: UIView!
    @IBOutlet weak var btnskipped: UIButton!
    @IBOutlet weak var btnattended: UIButton!
    @IBOutlet weak var btntotalquestion: UIButton!
    @IBOutlet weak var viewtime: UIView!
    @IBOutlet weak var viewskipped: UIView!
    @IBOutlet weak var viewattaend: UIView!
    @IBOutlet weak var viewtotal: UIView!
    @IBOutlet weak var lbltime: UILabel!
    
    @IBOutlet weak var newviewgotit: UIView!
    
    @IBOutlet weak var btnnewgotit: UIButton!
    var hud:MBProgressHUD!
    var selectedanswer=String()
    
    var datechoosen=String()
    var questioncell=DailyexamCollectionViewCell()
    var dailyexammodel=Dailyexamviewmodel()
    var dailyexamqustn:[quesansdata]?
    var timer: Timer?
    var totalTime = Int()
    var skipcount=0
    var attendedcount=0
    var itemdailyexam=[String:String]()
    var itemmocktest=[String:String]()
    var itemcurrentaffair=[String:String]()
    var userid=String()
    var dailyexamqstnarray=[[String:String]]()
    var mocktestqstnarray=[[String:String]]()
    var dict_answers=[String:Any]()
    var dict_main=[String:Any]()
    var questionid=String()
    var questionidarray=[String]()
    var skipflag=Int()
    var mocktestseries_id=String()
    var mocktest_flag=Int()
    var mocktestseriesdata:[Mock_test_series_question]?
    var questionsformocktest:[Questions]?
    var usertime=String()
    var mocktestseriesid=String()
    var reportsandsolutionofdailyexam:Dailyexamanswerdata?
    var reportformocktest:Report?
    var exclusivecoachingflag=Int()
    var chapterid=String()
    var chapterwiseexamdata:[chapterwisequstndata]?
    var reportsandsolutionforchapterwiseexam:submitchapterwisedata?
    var yearid=String()
    var monthid=String()
    var caid=String()
    var currentaffairsflag=Int()
    var caqstndata:[CurrentaffairData]?
    var currentaffairqustnarray=[[String:String]]()
    var reportforcatest:CAReport?
    var pauseflag=0
    
    var currentitem=Int()
    var weekwisequstnflag=Int()
    var week_examid=String()
    var questionsforweekexam:[WeekQuestions]?
    var weekqustndata:Week_exam?
    var weekexamqustnarray=[[String:String]]()
    var itemweekwiseexam=[String:String]()
    var reportweekwisetest:SubmitweekexamReport?
    var actionflag=Int()
    
   var  visibleItems=NSArray()
                 
    var  currentItem=IndexPath()
    var  nextItem=IndexPath()
    var flowlayout:UICollectionViewLayout!
    var sendertag=Int()
    var cell=QustnanswerTableViewCell()
    var tabeviewactualheight=Float()
    var estimateflag=0
    var theme=Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewsubmitanswer.layer.cornerRadius=15
        if mocktest_flag==1{
            tableviewqustnanwers.rowHeight=1700
            tableviewqustnanwers.estimatedRowHeight=UITableView.automaticDimension
        }else{
        tableviewqustnanwers.rowHeight=900
        tableviewqustnanwers.estimatedRowHeight=UITableView.automaticDimension
        }
        tableviewqustnanwers.layer.cornerRadius=15
        
        newviewgotit.layer.cornerRadius=20
        newviewgotit.layer.borderColor = UIColor.black.cgColor
        newviewgotit.layer.borderWidth=0.5
        btnnewgotit.layer.cornerRadius=15
        btnnewgotit.layer.borderColor = UIColor.black.cgColor
        btnnewgotit.layer.borderWidth=0.5
        
// cell.loadCollectionView(mocktestflag:self.mocktest_flag,exclusivecoachingflag:self.exclusivecoachingflag,currentaffairflag:self.currentaffairsflag,weekwiseflag:self.weekwisequstnflag,date_choosen:self.datechoosen,week_examid:self.week_examid,year_id:self.yearid,caid:self.caid,
                                       //monthid:self.monthid,chapterid:self.chapterid,mocktestseries_id:self.mocktestseries_id)
      // tableviewqustnanwers.reloadData()
        
        UserDefaults.standard.set(mocktest_flag,forKey:"mocktestflag")
        UserDefaults.standard.set(exclusivecoachingflag,forKey:"exclusivecoachingflag")
        UserDefaults.standard.set(currentaffairsflag,forKey:"currentaffairflag")
        UserDefaults.standard.set(weekwisequstnflag,forKey:"weekwiseflag")
        UserDefaults.standard.set(datechoosen,forKey:"datechoosen")
        UserDefaults.standard.set(week_examid,forKey:"week_examid")
        UserDefaults.standard.set(yearid,forKey:"yearid")
        UserDefaults.standard.set(caid,forKey:"caid")
        UserDefaults.standard.set(monthid,forKey:"monthid")
        UserDefaults.standard.set(chapterid,forKey:"chapterid")
        UserDefaults.standard.set(mocktestseries_id,forKey:"mocktestseries_id")
           
            
        DispatchQueue.main.async {
            self.activityindicator.stopAnimating()
            
            
        }
     
       
        
        userid=(UserDefaults.standard.value(forKey: "useridnew") as! NSNumber).stringValue
        dailyexammodel.dateselected=datechoosen
        if mocktest_flag==1{
            
            dailyexammodel.mocktestseriesid=mocktestseries_id
            
            dailyexammodel.get_mock_test_series_questions_new_ios{ (model) in
                self.mocktestseriesqustn(data:model)
            }
        }else if exclusivecoachingflag==1{
            dailyexammodel.chapterid=chapterid
            dailyexammodel.get_chapter_wise_exam{ (model) in
                self.getchapterwiseexamdata(data:model)
            }
            
        }else if currentaffairsflag==1{
            dailyexammodel.year_id=yearid
            dailyexammodel.ca_id=caid
            dailyexammodel.month_id=monthid
            dailyexammodel.get_current_affairs_questions{ (model) in
                           self.currentaffairqstndata(data:model)
            }
            
        }else if weekwisequstnflag==1{
            dailyexammodel.weekexamid=week_examid
            dailyexammodel.get_week_wise_exam_questions_new{ (model) in
                    self.getweekwiseexamquestionsdata(data:model)
            }
            
            
        }else{
            
            
            dailyexammodel.get_daily_exam_questions{ (model) in
                self.dailyexamquestn(data:model)
            }
        }

        viewtime.setcornerradius()
        viewtotal.setcornerradius()
        viewattaend.setcornerradius()
        viewskipped.setcornerradius()
        btnsubmitanswer.layer.cornerRadius=20
        btnsubmitanswer.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        btncancelanswer.layer.cornerRadius=20
        btncancelanswer.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    
  
    
    private func startOtpTimer() {
        //self.totalTime = 20
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    
    
    
    @objc func updateTimer() {
        print(self.totalTime)
        lbltime.text = self.timeFormatted(self.totalTime)
        usertime=self.timeFormatted(self.totalTime)
        if totalTime != 0&&pauseflag==0 {
            totalTime -= 1  // decrease counter timer
        
        }else{
            if let timer = self.timer {
                timer.invalidate()
                self.timer = nil
                
            }
        }
    
    }
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        let minutes: Int = (totalSeconds / 60)
        let hours : Int = (totalSeconds / 3600)
        print("hours",hours)
        print("seconds",seconds)
        print("minutes",minutes)
        if minutes>=60{
            let minutes: Int = (totalSeconds % 3600) / 60
            let seconds:Int=(totalSeconds % 3600) % 60
        return String(format: "%02d:%02d:%02d", hours,minutes,seconds)
        }else{
        return String(format: "%02d:%02d", minutes, seconds)
        }
    }
    
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
         self.viewevaluationcompleted.isHidden=true
        self.navigationController?.isNavigationBarHidden = true
        
        self.viewsubmitanswer.setShadowEffect()
        
        if let mode=UserDefaults.standard.value(forKey: "mode"){
            theme=UserDefaults.standard.value(forKey: "mode") as! Int
        }
        if theme==0{
            overrideUserInterfaceStyle = .light
            
        }else{
        overrideUserInterfaceStyle = .dark
        }
        
        mocktestqstnarray.removeAll()
        dailyexamqstnarray.removeAll()
        dailyexammodel.dateselected=datechoosen
        if mocktest_flag==1{
            
            dailyexammodel.mocktestseriesid=mocktestseries_id
            
            dailyexammodel.get_mock_test_series_questions_new_ios{ (model) in
                self.mocktestseriesqustn(data:model)
            }
        }else if exclusivecoachingflag==1{
            dailyexammodel.chapterid=chapterid
            dailyexammodel.get_chapter_wise_exam{ (model) in
                self.getchapterwiseexamdata(data:model)
            }
            
        }  else if currentaffairsflag==1{
            dailyexammodel.year_id=yearid
            dailyexammodel.ca_id=caid
            dailyexammodel.month_id=monthid
            dailyexammodel.get_current_affairs_questions{ (model) in
                           self.currentaffairqstndata(data:model)
            }
            
        }else if weekwisequstnflag==1{
        dailyexammodel.weekexamid=week_examid
        dailyexammodel.get_week_wise_exam_questions_new{ (model) in
                self.getweekwiseexamquestionsdata(data:model)
        }
        }else{
            
            dailyexammodel.get_daily_exam_questions{ (model) in
                self.dailyexamquestn(data:model)
            }
        }
//         let nextItem: IndexPath = IndexPath(item: 0, section: 0)
//        self.collectionviewdailyexam.scrollToItem(at: nextItem, at: .left, animated: true)
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cell = (tableView.dequeueReusableCell(withIdentifier: "QustnanswerTableViewCell", for: indexPath) as? QustnanswerTableViewCell)!
        cell.delegate=self
        cell.delegate1=self
        
     
        return cell
    }
    
    @IBAction func btnbackaction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btngotitclicked(_ sender: Any) {
        newviewgotit.isHidden=true
        iconsortup.isHidden=true
    }
    
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//
//       }
////
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        if estimateflag==0{
//    return 800
//    }else{
//        return CGFloat(tabeviewactualheight)
//    }
//       }
    
     func selectedanswer(pause_flag : Int,attended_count:Int,skipped_count:Int,submitflag:Int,dictanswers:[String:Any]){
        var dicanswers=dictanswers
        dicanswers.updateValue(usertime, forKey: "user_time")
        print("dicanswers",dicanswers)
        
        self.dict_answers=dicanswers
        print("dict_answers",self.dict_answers)
        self.dict_main.updateValue(dict_answers, forKey: "data")
        print("dict_main",dict_answers)
        self.pauseflag=pause_flag
        if pause_flag==1||pause_flag==0{
            startOtpTimer()
        }
        self.btnskipped.setTitle(String(skipped_count), for: .normal)
         self.btnattended.setTitle(String(attended_count), for: .normal)
        if submitflag==1{
            viewsubmitanswer.isHidden=false
        }else{
            viewsubmitanswer.isHidden=true
        }
        
        
    }
    
    
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int{
//        return 1
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        if mocktest_flag==1{
//            return questionsformocktest?.count ?? 0
//        }else if exclusivecoachingflag==1{
//            return chapterwiseexamdata?.count ?? 0
//        }else if currentaffairsflag==1{
//            return caqstndata?.count ?? 0
//        }else if weekwisequstnflag==1{
//             return questionsforweekexam?.count ?? 0
//        }else{
////            print("cunt",dailyexamqustn?.count ?? 0)
////            if actionflag==1{
////            collectionviewdailyexam.reloadItems(at: [nextItem])
////            }
//            return dailyexamqustn?.count ?? 0
//        }
//
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        questioncell = collectionView.dequeueReusableCell(withReuseIdentifier: "DailyexamCollectionViewCell",for: indexPath) as! DailyexamCollectionViewCell
//        print("indexpath",indexPath.row)
//         print("dailyexamqustn",dailyexamqustn)
//
//        questioncell.lblopt1.isHidden=false
//        questioncell.lblopt2.isHidden=false
//        questioncell.lblopt3.isHidden=false
//        questioncell.lblopt4.isHidden=false
//        if mocktest_flag==1{
//
//
//            questioncell.lblopt1.text=questionsformocktest?[indexPath.row].psc_option1 ?? ""
//            questioncell.lblopt2.text=questionsformocktest?[indexPath.row].psc_option2 ?? ""
//            questioncell.lblopt3.text=questionsformocktest?[indexPath.row].psc_option3 ?? ""
//            questioncell.lblopt4.text=questionsformocktest?[indexPath.row].psc_option4 ?? ""
//            questioncell.lblqustion.attributedText=(questionsformocktest?[indexPath.row].psc_question ?? "").convertToAttributedString3()
//
//            if questionsformocktest?[indexPath.row].isselected==1{
//                questioncell.lblopt1.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//                questioncell.lblopt2.backgroundColor=UIColor.white
//                questioncell.lblopt3.backgroundColor=UIColor.white
//                questioncell.lblopt4.backgroundColor=UIColor.white
//
//            }else if questionsformocktest?[indexPath.row].isselected==2{
//                questioncell.lblopt2.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//                questioncell.lblopt1.backgroundColor=UIColor.white
//                questioncell.lblopt3.backgroundColor=UIColor.white
//                questioncell.lblopt4.backgroundColor=UIColor.white
//
//            }else if questionsformocktest?[indexPath.row].isselected==3{
//                questioncell.lblopt3.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//                questioncell.lblopt2.backgroundColor=UIColor.white
//                questioncell.lblopt1.backgroundColor=UIColor.white
//                questioncell.lblopt4.backgroundColor=UIColor.white
//
//            }else if questionsformocktest?[indexPath.row].isselected==4{
//                questioncell.lblopt4.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//                questioncell.lblopt2.backgroundColor=UIColor.white
//                questioncell.lblopt3.backgroundColor=UIColor.white
//                questioncell.lblopt1.backgroundColor=UIColor.white
//
//            }else{
//                questioncell.lblopt1.backgroundColor=UIColor.white
//
//                questioncell.lblopt2.backgroundColor=UIColor.white
//                questioncell.lblopt3.backgroundColor=UIColor.white
//                questioncell.lblopt4.backgroundColor=UIColor.white
//            }
//
//        }  else if exclusivecoachingflag==1{
//
//            questioncell.lblopt1.text=chapterwiseexamdata?[indexPath.row].chapter_exam_option1 ?? ""
//            questioncell.lblopt2.text=chapterwiseexamdata?[indexPath.row].chapter_exam_option2 ?? ""
//            questioncell.lblopt3.text=chapterwiseexamdata?[indexPath.row].chapter_exam_option3 ?? ""
//            questioncell.lblopt4.text=chapterwiseexamdata?[indexPath.row].chapter_exam_option4 ?? ""
//            questioncell.lblqustion.attributedText=(chapterwiseexamdata?[indexPath.row].chapter_exam_question ?? "").convertToAttributedString3()
//
//            if chapterwiseexamdata?[indexPath.row].isselected==1{
//                 questioncell.lblopt1.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//                               questioncell.lblopt2.backgroundColor=UIColor.white
//                               questioncell.lblopt3.backgroundColor=UIColor.white
//                               questioncell.lblopt4.backgroundColor=UIColor.white
//
//            }else if chapterwiseexamdata?[indexPath.row].isselected==2{
//                questioncell.lblopt2.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                               questioncell.lblopt1.backgroundColor=UIColor.white
//                               questioncell.lblopt3.backgroundColor=UIColor.white
//                               questioncell.lblopt4.backgroundColor=UIColor.white
//
//            }else if chapterwiseexamdata?[indexPath.row].isselected==3{
//                questioncell.lblopt3.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                               questioncell.lblopt2.backgroundColor=UIColor.white
//                               questioncell.lblopt1.backgroundColor=UIColor.white
//                               questioncell.lblopt4.backgroundColor=UIColor.white
//
//            }else if chapterwiseexamdata?[indexPath.row].isselected==4{
//                questioncell.lblopt4.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                               questioncell.lblopt2.backgroundColor=UIColor.white
//                               questioncell.lblopt3.backgroundColor=UIColor.white
//                               questioncell.lblopt1.backgroundColor=UIColor.white
//
//            }else{
//                questioncell.lblopt1.backgroundColor=UIColor.white
//
//                questioncell.lblopt2.backgroundColor=UIColor.white
//                questioncell.lblopt3.backgroundColor=UIColor.white
//                questioncell.lblopt4.backgroundColor=UIColor.white
//            }
//
//        }else if currentaffairsflag==1{
//
//
//
//                questioncell.lblopt1.text=caqstndata?[indexPath.row].ca_option1 ?? ""
//                questioncell.lblopt2.text=caqstndata?[indexPath.row].ca_option2 ?? ""
//                questioncell.lblopt3.text=caqstndata?[indexPath.row].ca_option3 ?? ""
//                questioncell.lblopt4.text=caqstndata?[indexPath.row].ca_option4 ?? ""
//                questioncell.lblqustion.attributedText=(caqstndata?[indexPath.row].ca_question ?? "").convertToAttributedString3()
//
//                if caqstndata?[indexPath.row].isselected==1{
//                    questioncell.lblopt1.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                                   questioncell.lblopt2.backgroundColor=UIColor.white
//                                   questioncell.lblopt3.backgroundColor=UIColor.white
//                                   questioncell.lblopt4.backgroundColor=UIColor.white
//
//                }else if caqstndata?[indexPath.row].isselected==2{
//                    questioncell.lblopt2.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                                   questioncell.lblopt1.backgroundColor=UIColor.white
//                                   questioncell.lblopt3.backgroundColor=UIColor.white
//                                   questioncell.lblopt4.backgroundColor=UIColor.white
//
//                }else if caqstndata?[indexPath.row].isselected==3{
//                    questioncell.lblopt3.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                                   questioncell.lblopt2.backgroundColor=UIColor.white
//                                   questioncell.lblopt1.backgroundColor=UIColor.white
//                                   questioncell.lblopt4.backgroundColor=UIColor.white
//
//                }else if caqstndata?[indexPath.row].isselected==4{
//                    questioncell.lblopt4.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                                   questioncell.lblopt2.backgroundColor=UIColor.white
//                                   questioncell.lblopt3.backgroundColor=UIColor.white
//                                   questioncell.lblopt1.backgroundColor=UIColor.white
//
//                }else{
//                    questioncell.lblopt1.backgroundColor=UIColor.white
//
//                    questioncell.lblopt2.backgroundColor=UIColor.white
//                    questioncell.lblopt3.backgroundColor=UIColor.white
//                    questioncell.lblopt4.backgroundColor=UIColor.white
//                }
//
//        }else if weekwisequstnflag==1{
//            questioncell.lblopt1.isHidden=true
//            questioncell.lblopt2.isHidden=true
//            questioncell.lblopt3.isHidden=true
//            questioncell.lblopt4.isHidden=true
//            questioncell.btnopt1.layer.cornerRadius=20
//            questioncell.btnopt1.layer.borderColor = UIColor.black.cgColor
//            questioncell.btnopt1.layer.borderWidth=0.5
//            questioncell.btnopt2.layer.cornerRadius=20
//            questioncell.btnopt2.layer.borderColor = UIColor.black.cgColor
//            questioncell.btnopt2.layer.borderWidth=0.5
//            questioncell.btnopt3.layer.cornerRadius=20
//            questioncell.btnopt3.layer.borderColor = UIColor.black.cgColor
//            questioncell.btnopt3.layer.borderWidth=0.5
//            questioncell.btnopt4.layer.cornerRadius=20
//            questioncell.btnopt4.layer.borderColor = UIColor.black.cgColor
//            questioncell.btnopt4.layer.borderWidth=0.5
//
//
//            questioncell.btnopt1.setAttributedTitle((questionsforweekexam?[indexPath.row].option1 ?? "").convertToAttributedString3(), for: .normal)
//
//            questioncell.btnopt1.titleLabel?.lineBreakMode = .byWordWrapping
//            questioncell.btnopt1.layoutIfNeeded()
//            //questioncell.btnopt1height.constant = (questioncell.btnopt1.titleLabel?.frame.size.height)!
//
//
//
//
//
//
//           // questioncell.btnopt1.setAttributedTitle((questionsforweekexam?[indexPath.row].option1 ?? "").convertToAttributedString3(), for: .normal)
//            questioncell.btnopt2.setAttributedTitle((questionsforweekexam?[indexPath.row].option2 ?? "").convertToAttributedString3(), for: .normal)
//            questioncell.btnopt3.setAttributedTitle((questionsforweekexam?[indexPath.row].option3 ?? "").convertToAttributedString3(), for: .normal)
//            questioncell.btnopt4.setAttributedTitle((questionsforweekexam?[indexPath.row].option4 ?? "").convertToAttributedString3(), for: .normal)
//
//
////            questioncell.lblopt1.attributedText=(questionsforweekexam?[indexPath.row].option1 ?? "").convertToAttributedString3()
//
////                questioncell.lblopt2.attributedText=(questionsforweekexam?[indexPath.row].option2 ?? "").convertToAttributedString3()
////            questioncell.lblopt3.attributedText=(questionsforweekexam?[indexPath.row].option3 ?? "").convertToAttributedString3()
////            questioncell.lblopt4.attributedText=(questionsforweekexam?[indexPath.row].option4 ?? "").convertToAttributedString3()
//                questioncell.lblqustion.attributedText=(questionsforweekexam?[indexPath.row].question ?? "").convertToAttributedString3()
//
//            questioncell.lblopt1.numberOfLines=0
//            questioncell.lblopt1.sizeToFit()
//
//                 if questionsforweekexam?[indexPath.row].isselected==1{
//                    questioncell.btnopt1.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                                   questioncell.btnopt2.backgroundColor=UIColor.white
//                                   questioncell.btnopt3.backgroundColor=UIColor.white
//                                   questioncell.btnopt4.backgroundColor=UIColor.white
//
//                }else if questionsforweekexam?[indexPath.row].isselected==2{
//                    questioncell.btnopt2.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                                   questioncell.btnopt1.backgroundColor=UIColor.white
//                                   questioncell.btnopt3.backgroundColor=UIColor.white
//                                   questioncell.btnopt4.backgroundColor=UIColor.white
//
//                }else if questionsforweekexam?[indexPath.row].isselected==3{
//                    questioncell.btnopt3.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                                   questioncell.btnopt2.backgroundColor=UIColor.white
//                                   questioncell.btnopt1.backgroundColor=UIColor.white
//                                   questioncell.btnopt4.backgroundColor=UIColor.white
//
//                }else if questionsforweekexam?[indexPath.row].isselected==4{
//                    questioncell.btnopt4.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                                   questioncell.btnopt2.backgroundColor=UIColor.white
//                                   questioncell.btnopt3.backgroundColor=UIColor.white
//                                   questioncell.btnopt1.backgroundColor=UIColor.white
//
//                }else{
//                    questioncell.btnopt1.backgroundColor=UIColor.white
//
//                    questioncell.btnopt2.backgroundColor=UIColor.white
//                    questioncell.btnopt3.backgroundColor=UIColor.white
//                    questioncell.btnopt4.backgroundColor=UIColor.white
//                }
//
//
//
//
//
//        }else{
//            print("dailyexamqustn",dailyexamqustn)
//            questioncell.lblopt1.text=dailyexamqustn?[indexPath.item].psc_option1 ?? ""
//            questioncell.lblopt2.text=dailyexamqustn?[indexPath.item].psc_option2 ?? ""
//            questioncell.lblopt3.text=dailyexamqustn?[indexPath.item].psc_option3 ?? ""
//            questioncell.lblopt4.text=dailyexamqustn?[indexPath.item].psc_option4 ?? ""
//            questioncell.lblqustion.attributedText=(dailyexamqustn?[indexPath.item].psc_question ?? "").convertToAttributedString3()
//
//            if dailyexamqustn?[indexPath.item].isselected==1{
//                questioncell.lblopt1.backgroundColor = UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                               questioncell.lblopt2.backgroundColor=UIColor.white
//                               questioncell.lblopt3.backgroundColor=UIColor.white
//                               questioncell.lblopt4.backgroundColor=UIColor.white
//
//            }else if dailyexamqustn?[indexPath.item].isselected==2{
//                questioncell.lblopt2.backgroundColor = UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                               questioncell.lblopt1.backgroundColor=UIColor.white
//                               questioncell.lblopt3.backgroundColor=UIColor.white
//                               questioncell.lblopt4.backgroundColor=UIColor.white
//
//            }else if dailyexamqustn?[indexPath.item].isselected==3{
//                questioncell.lblopt3.backgroundColor = UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                               questioncell.lblopt2.backgroundColor=UIColor.white
//                               questioncell.lblopt1.backgroundColor=UIColor.white
//                               questioncell.lblopt4.backgroundColor=UIColor.white
//
//            }else if dailyexamqustn?[indexPath.item].isselected==4{
//                questioncell.lblopt4.backgroundColor = UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
//
//                               questioncell.lblopt2.backgroundColor=UIColor.white
//                               questioncell.lblopt3.backgroundColor=UIColor.white
//                               questioncell.lblopt1.backgroundColor=UIColor.white
//
//            }else{
//                questioncell.lblopt1.backgroundColor=UIColor.white
//
//                questioncell.lblopt2.backgroundColor=UIColor.white
//                questioncell.lblopt3.backgroundColor=UIColor.white
//                questioncell.lblopt4.backgroundColor=UIColor.white
//            }
//        }
//
//
//
//
//        questioncell.btnopt1.tag=indexPath.item
//        questioncell.btnopt2.tag=indexPath.item
//        questioncell.btnopt3.tag=indexPath.item
//        questioncell.btnopt4.tag=indexPath.item
//        questioncell.btngotitclicked.tag=indexPath.item
//        questioncell.btnskipqustn.tag=indexPath.item
//        questioncell.btnnext.tag=indexPath.item
//        questioncell.btnpauseexam.tag=indexPath.item
//
//        questioncell.btnopt1.addTarget(self, action: #selector(btnopt1(sender:)), for: .touchUpInside)
//        questioncell.btnopt2.addTarget(self, action: #selector(btnopt2(sender:)), for: .touchUpInside)
//        questioncell.btnopt3.addTarget(self, action: #selector(btnopt3(sender:)), for: .touchUpInside)
//        questioncell.btnopt4.addTarget(self, action: #selector(btnopt4(sender:)), for: .touchUpInside)
//        questioncell.btnskipqustn.addTarget(self, action: #selector(skipaction(sender:)), for: .touchUpInside)
//        questioncell.btnpauseexam.addTarget(self, action: #selector(pauseaction(sender:)), for: .touchUpInside)
//        questioncell.btngotit.addTarget(self, action: #selector(btngotitclicked(sender:)), for: .touchUpInside)
//        questioncell.btnnext.addTarget(self, action: #selector(btnnextaction), for: .touchUpInside)
//        questioncell.btnprevious.addTarget(self, action: #selector(btnpreviousaction), for: .touchUpInside)
//        questioncell.btnsubmitt.addTarget(self, action: #selector(btnsubmittaction), for: .touchUpInside)
//        return questioncell
//
//    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
//
////        self.collectionviewdailyexam.scrollToItem(at: IndexPath(row: 3, section: 0), at: .left, animated: true)
////        collectionviewdailyexam.reloadData()
//
//    }
//
//
//
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
//    {
//
//
//        let screenSize: CGRect = UIScreen.main.bounds
//        let screenWidth = screenSize.width
//        let screenheight=screenSize.height
//        return CGSize(width: screenWidth, height: 700)
//
//    }
//
////
    
    
    func totaltableheight(height: Float) {
      print("height",height)
//        tabeviewactualheight=height
//        estimateflag=1
        tableviewqustnanwers.scrollToRow(at: IndexPath(item: 0, section: 0), at: .top, animated: false)
//        tableviewqustnanwers.reloadData()
    }
    
    
    
    
    
    
    
    func currentaffairqstndata(data: Currentaffairsqustnclass) {
        print("data",data)


        let status=data.status
        if status==true{
            DispatchQueue.main.async{

                self.caqstndata=data.data
                self.btntotalquestion.setTitle(String(self.caqstndata?.count ?? 0), for: .normal)

               // self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)

                self.totalTime=(self.caqstndata?.count ?? 0)*60

                self.startOtpTimer()
               // self.collectionviewdailyexam.reloadSections(IndexSet(integer: 0))
            }
        }else{

            DispatchQueue.main.async{
               // self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
//
//
    func dailyexamquestn(data: Dailyexam) {
        print("data",data)


        let status=data.status
        if status==true{
            self.dailyexamqustn=data.data
            DispatchQueue.main.async{


                self.btntotalquestion.setTitle(String(self.dailyexamqustn?.count ?? 0), for: .normal)
                print("self.dailyexamqustn",self.dailyexamqustn)
               // self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                if self.dailyexamqustn?[0].psc_special_exam == "0"{
                    self.totalTime=7*60
                }else{
                    self.totalTime=(self.dailyexamqustn?.count ?? 0)*60
                }
                self.startOtpTimer()
               // self.collectionviewdailyexam.reloadSections(IndexSet(integer: 0))
//                self.collectionviewdailyexam.reloadData()

            }
        }else{

            DispatchQueue.main.async{
              //  self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
//
    func getchapterwiseexamdata(data: Chapterwiseexamclass) {
        print("data",data)


        let status=data.status
        if status==true{
            DispatchQueue.main.async{

                self.chapterwiseexamdata=data.data
                self.btntotalquestion.setTitle(String(self.chapterwiseexamdata?.count ?? 0), for: .normal)

               // self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)

                self.totalTime=(self.chapterwiseexamdata?.count ?? 0)*60

                self.startOtpTimer()
//                self.collectionviewdailyexam.reloadSections(IndexSet(integer: 0))
            }
        }else{

            DispatchQueue.main.async{
               // self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
//
    func mocktestseriesqustn(data: Testseriesquestion){
        DispatchQueue.main.async{
        self.showhud()
        }
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                self.mocktestseriesdata=data.data?.mock_test_series
                self.questionsformocktest=self.mocktestseriesdata?[0].questions

                self.btntotalquestion.setTitle(String(self.questionsformocktest?.count ?? 0), for: .normal)

               // self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                if self.questionsformocktest?[0].psc_special_exam == "0"{
                    self.totalTime=7*60
                }else{
                    self.totalTime=(self.questionsformocktest?.count ?? 0)*60
                }
                self.hud.hide(animated: true)
                self.startOtpTimer()
               // self.collectionviewdailyexam.reloadSections(IndexSet(integer: 0))
            }
        }else{

            DispatchQueue.main.async{
                self.hud.hide(animated: true)
               // self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
//
//
//
   func getweekwiseexamquestionsdata(data: Weekwiseexamqustnclass){
        let status=data.status
    DispatchQueue.main.async{
    self.activityindicator.startAnimating()
    }
        if status==true{
            DispatchQueue.main.async{

                self.weekqustndata=data.data?.week_exam
                self.questionsforweekexam=data.data?.questions
                self.btntotalquestion.setTitle(String(self.questionsforweekexam?.count ?? 0), for: .normal)

               // self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)

                self.totalTime=(self.questionsforweekexam?.count ?? 0)*60
               

               // self.collectionviewdailyexam.reloadSections(IndexSet(integer: 0))

                self.startOtpTimer()
                self.activityindicator.stopAnimating()

            }
        }else{

            DispatchQueue.main.async{
                self.activityindicator.stopAnimating()
                //self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
//
//
//
//
//    func btnopt1(){
//        print()
//        skipflag=0
//        if mocktest_flag==1{
//            selectedanswer=questionsformocktest?[sendertag].psc_option1 ?? ""
//            questionid=questionsformocktest?[sendertag].psc_question_id ?? ""
//            questionsformocktest?[sendertag].isselected=1
//            mocktestseriesid=questionsformocktest?[sendertag].psc_mock_test_series_id ?? ""
//        }else if exclusivecoachingflag==1{
//            selectedanswer=chapterwiseexamdata?[sendertag].chapter_exam_option1 ?? ""
//            questionid=chapterwiseexamdata?[sendertag].chapter_question_id ?? ""
//            chapterwiseexamdata?[sendertag].isselected=1
//
//
//        }else if currentaffairsflag==1{
//            selectedanswer=caqstndata?[sendertag].ca_option1 ?? ""
//            questionid=caqstndata?[sendertag].ca_question_id ?? ""
//            caqstndata?[sendertag].isselected=1
//        }else if weekwisequstnflag==1{
//            selectedanswer=questionsforweekexam?[sendertag].option1 ?? ""
//                       questionid=questionsforweekexam?[sendertag].exam_question_id ?? ""
//                       questionsforweekexam?[sendertag].isselected=1
//        }else{
//            selectedanswer=dailyexamqustn?[sendertag].psc_option1 ?? ""
//            questionid=dailyexamqustn?[sendertag].psc_question_id ?? ""
//            dailyexamqustn?[sendertag].isselected=1
//        }
//        questionidarray.append(questionid)
//        btnoptionaction()
//
//
//    }
//
//    @objc func btnopt2(sender:UIButton){
//         print("sender.tag",sender.tag)
//
//        skipflag=0
//        if mocktest_flag==1{
//            selectedanswer=questionsformocktest?[sender.tag].psc_option2 ?? ""
//            questionid=questionsformocktest?[sender.tag].psc_question_id ?? ""
//            questionsformocktest?[sender.tag].isselected=2
//            mocktestseriesid=questionsformocktest?[sender.tag].psc_mock_test_series_id ?? ""
//        } else if exclusivecoachingflag==1{
//            selectedanswer=chapterwiseexamdata?[sender.tag].chapter_exam_option2 ?? ""
//            questionid=chapterwiseexamdata?[sender.tag].chapter_question_id ?? ""
//            chapterwiseexamdata?[sender.tag].isselected=2
//
//        }else if currentaffairsflag==1{
//            selectedanswer=caqstndata?[sender.tag].ca_option2 ?? ""
//            questionid=caqstndata?[sender.tag].ca_question_id ?? ""
//            caqstndata?[sender.tag].isselected=2
//        } else if weekwisequstnflag==1{
//            selectedanswer=questionsforweekexam?[sender.tag].option2 ?? ""
//                       questionid=questionsforweekexam?[sender.tag].exam_question_id ?? ""
//                       questionsforweekexam?[sender.tag].isselected=2
//        }else{
//            selectedanswer=dailyexamqustn?[sender.tag].psc_option2 ?? ""
//            questionid=dailyexamqustn?[sender.tag].psc_question_id ?? ""
//            dailyexamqustn?[sender.tag].isselected=2
//        }
//        questionidarray.append(questionid)
//
//        btnoptionaction()
//
//    }
//    @objc func btnopt3(sender:UIButton){
//         print("sender.tag",sender.tag)
//        skipflag=0
//        if mocktest_flag==1{
//            selectedanswer=questionsformocktest?[sender.tag].psc_option3 ?? ""
//            questionid=questionsformocktest?[sender.tag].psc_question_id ?? ""
//            questionsformocktest?[sender.tag].isselected=3
//            mocktestseriesid=questionsformocktest?[sender.tag].psc_mock_test_series_id ?? ""
//        } else if exclusivecoachingflag==1{
//            selectedanswer=chapterwiseexamdata?[sender.tag].chapter_exam_option3 ?? ""
//            questionid=chapterwiseexamdata?[sender.tag].chapter_question_id ?? ""
//            chapterwiseexamdata?[sender.tag].isselected=3
//        }else if currentaffairsflag==1{
//
//          selectedanswer=caqstndata?[sender.tag].ca_option3 ?? ""
//            questionid=caqstndata?[sender.tag].ca_question_id ?? ""
//            caqstndata?[sender.tag].isselected=3
//        }else if weekwisequstnflag==1{
//        selectedanswer=questionsforweekexam?[sender.tag].option3 ?? ""
//                   questionid=questionsforweekexam?[sender.tag].exam_question_id ?? ""
//                   questionsforweekexam?[sender.tag].isselected=3
//        }else{
//            selectedanswer=dailyexamqustn?[sender.tag].psc_option3 ?? ""
//            questionid=dailyexamqustn?[sender.tag].psc_question_id ?? ""
//            dailyexamqustn?[sender.tag].isselected=3
//        }
//        questionidarray.append(questionid)
//        btnoptionaction()
//       // self.collectionviewdailyexam.reloadData()
//
//    }
//    @objc func btnopt4(sender:UIButton){
//         print("sender.tag",sender.tag)
//        skipflag=0
//        if mocktest_flag==1{
//            selectedanswer=questionsformocktest?[sender.tag].psc_option4 ?? ""
//            questionid=questionsformocktest?[sender.tag].psc_question_id ?? ""
//            questionsformocktest?[sender.tag].isselected=4
//            mocktestseriesid=questionsformocktest?[sender.tag].psc_mock_test_series_id ?? ""
//        } else if exclusivecoachingflag==1{
//            selectedanswer=chapterwiseexamdata?[sender.tag].chapter_exam_option4 ?? ""
//            questionid=chapterwiseexamdata?[sender.tag].chapter_question_id ?? ""
//            chapterwiseexamdata?[sender.tag].isselected=4
//        }else if currentaffairsflag==1{
//            selectedanswer=caqstndata?[sender.tag].ca_option4 ?? ""
//            questionid=caqstndata?[sender.tag].ca_question_id ?? ""
//            caqstndata?[sender.tag].isselected=4
//        }else if weekwisequstnflag==1{
//        selectedanswer=questionsforweekexam?[sender.tag].option4 ?? ""
//                   questionid=questionsforweekexam?[sender.tag].exam_question_id ?? ""
//                   questionsforweekexam?[sender.tag].isselected=4
//        }else{
//            selectedanswer=dailyexamqustn?[sender.tag].psc_option4 ?? ""
//            questionid=dailyexamqustn?[sender.tag].psc_question_id ?? ""
//            dailyexamqustn?[sender.tag].isselected=4
//        }
//        questionidarray.append(questionid)
//        btnoptionaction()
//      //  self.collectionviewdailyexam.reloadData()
//
//    }
    
//    func pauseaction(sender:UIButton){
//
//        let calendar = NSCalendar.current
//               let now = NSDate()
//               var dateComponents = calendar.dateComponents([.day,.month,.year,.hour,.minute,.second], from: now as Date)
//               //let dateComponents = calendar.dateComponents([NSCalendar.Unit.Day, NSCalendar.Unit.Month, NSCalendar.Unit.Year, NSCalendar.Unit.Hour, NSCalendar.Unit.Minute, NSCalendar.Unit.Second], from: now as Date)
//
//               dateComponents.second! += 1 //add 2 minutes to current time for debug
//
//               let date = calendar.date(from: dateComponents)
//         var uuidString = UUID().uuidString
//
//        if sender.currentTitle=="Pause Exam"{
//            sender.setTitle("Resume Exam", for: .normal)
//           pauseflag=1
//            let content = UNMutableNotificationContent()
//                   content.title = "Your last exam has been paused"
//
//                   content.body = "Clich here to resume"
//                   let trigger = UNCalendarNotificationTrigger(
//                   dateMatching: dateComponents, repeats: true)
//
//                   let request = UNNotificationRequest(identifier: uuidString,
//                               content: content, trigger: trigger)
//
//                   // Schedule the request with the system.
//                   let notificationCenter = UNUserNotificationCenter.current()
//                   notificationCenter.add(request) { (error) in
//                      if error != nil {
//                         // Handle any errors.
//                      }
//                   }
//
//
//        }else{
//            sender.setTitle("Pause Exam", for: .normal)
//           pauseflag=0
////            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [uuidString])
//            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
//        }
//        startOtpTimer()
//
//
//
//
//
//
//    }
    
//    @objc func skipaction(sender:UIButton){
//           Btn_RightAction()
//        questionidarray.append("0")
//        if mocktest_flag==1{
//            questionid=questionsformocktest?[sender.tag].psc_question_id ?? ""
//        }else if exclusivecoachingflag==1{
//            questionid=chapterwiseexamdata?[sender.tag].chapter_question_id ?? ""
//        }else if currentaffairsflag==1{
//          questionid=caqstndata?[sender.tag].ca_question_id ?? ""
//        }else if weekwisequstnflag==1{
//
//        questionid=questionsforweekexam?[sender.tag].exam_question_id ?? ""
//
//        }else{
//            questionid=dailyexamqustn?[sender.tag].psc_question_id ?? ""
//        }
//        skipflag=1
//
//        for value in dailyexamqstnarray{
//            let indexpartinsertarray=dailyexamqstnarray.index(of:value)
//            var items:[String:String]=value as! [String:String]
//
//            if items["question_id"]==questionid{
//                questionidarray.remove(at: indexpartinsertarray!)
//                if items["skip"]=="0"{
//                    attendedcount-=1
//
//                }else{
//                    skipcount-=1
//                }
//
//                dailyexamqstnarray.remove(at: indexpartinsertarray!)
//
//
//            }
//        }
//
//        selectedanswer=""
//        skipcount+=1
//        self.btnskipped.setTitle(String(skipcount), for: .normal)
//        self.btnattended.setTitle(String(attendedcount), for: .normal)
//
//        dailyexamqustn?[sender.tag].isselected=0
//        //        if mocktest_flag==1{
//        //
//        //        }else{
//        itemdailyexam.updateValue(userid, forKey: "user_id")
//        itemdailyexam.updateValue(questionid, forKey: "question_id")
//        itemdailyexam.updateValue(selectedanswer, forKey: "selected_answer")
//        itemdailyexam.updateValue("1", forKey: "skip")
//        dailyexamqstnarray.append(itemdailyexam)
//        //        }
//        print("dailyexamqstnarray",dailyexamqstnarray)
//         print("dailyexamqustn",dailyexamqustn)
//
//        collectionviewdailyexam.reloadData()
//
//    }
//
//    @objc func btngotitclicked(sender:UIButton){
//        questioncell.lblqstnnumber.isHidden=false
//        questioncell.btngotitclicked.isHidden=true
//        questioncell.btngotit.isHidden=true
//        questioncell.lblgotit.isHidden=true
//        questioncell.viewgotit.isHidden=true
//        questioncell.lblqstnnumber.text="Q."+String(sender.tag)
//
//
//    }
//
//
//    func btnoptionaction(){
//        Btn_RightAction()
//        if mocktest_flag==1{
//
//            for value in mocktestqstnarray{
//                let indexpartinsertarray=mocktestqstnarray.index(of:value)
//                var items:[String:String]=value as! [String:String]
//
//                if items["question_id"]==questionid{
//
//
//                    mocktestqstnarray.remove(at: indexpartinsertarray!)
//                }
//            }
//
//
//
//        }
//        if currentaffairsflag==1{
//       for value in currentaffairqustnarray{
//                let indexpartinsertarray=currentaffairqustnarray.index(of:value)
//                var items:[String:String]=value as! [String:String]
//
//                if items["question_id"]==questionid{
//
//
//                    currentaffairqustnarray.remove(at: indexpartinsertarray!)
//                }
//            }
//
//
//
//        }
//
//
//
//        for value in dailyexamqstnarray{
//            let indexpartinsertarray=dailyexamqstnarray.index(of:value)
//            var items:[String:String]=value as! [String:String]
//
//            if items["question_id"]==questionid{
//                if items["skip"]=="1"{
//                    skipcount-=1
//
//                }else{
//                    attendedcount-=1
//                }
//
//                dailyexamqstnarray.remove(at: indexpartinsertarray!)
//            }
//        }
//
//        if  weekwisequstnflag==1{
//            for value in weekexamqustnarray{
//            let indexpartinsertarray=weekexamqustnarray.index(of:value)
//                           var items:[String:String]=value as! [String:String]
//
//                           if items["question_id"]==questionid{
//
//
//                               weekexamqustnarray.remove(at: indexpartinsertarray!)
//                           }
//                       }
//        }
//
//
//
//        print("dailyexamqstnarray",dailyexamqstnarray)
//
//        attendedcount+=1
//
//        self.btnattended.setTitle(String(attendedcount), for: .normal)
//        self.btnskipped.setTitle(String(skipcount), for: .normal)
//
//
//
//        if mocktest_flag==1{
//             itemmocktest.updateValue(userid, forKey: "user_id")
//            itemmocktest.updateValue(questionid, forKey: "question_id")
//            itemmocktest.updateValue(selectedanswer, forKey: "selected_answer")
//            itemmocktest.updateValue(mocktestseriesid, forKey: "mock_test_series_id")
//        }
//        itemdailyexam.updateValue(userid, forKey: "user_id")
//        itemdailyexam.updateValue(questionid, forKey: "question_id")
//        itemdailyexam.updateValue(selectedanswer, forKey: "selected_answer")
//        itemdailyexam.updateValue("0", forKey: "skip")
//
//        if currentaffairsflag==1{
//            itemcurrentaffair.updateValue(userid, forKey: "user_id")
//                       itemcurrentaffair.updateValue(questionid, forKey: "question_id")
//                       itemcurrentaffair.updateValue(selectedanswer, forKey: "selected_answer")
//
//        }
//
//        if weekwisequstnflag==1{
//             itemweekwiseexam.updateValue(userid, forKey: "user_id")
//                        itemweekwiseexam.updateValue(questionid, forKey: "question_id")
//                        itemweekwiseexam.updateValue(selectedanswer, forKey: "selected_answer")
//
//        }
//
//        currentaffairqustnarray.append(itemcurrentaffair)
//        mocktestqstnarray.append(itemmocktest)
//        dailyexamqstnarray.append(itemdailyexam)
//        weekexamqustnarray.append(itemweekwiseexam)
//
//        print("mocktestqstnarray",mocktestqstnarray)
//        print("dailyexamqstnarray",dailyexamqstnarray)
//
//    }
//
//
//    func Btn_RightAction()
//    {
//        print("dailyexamqustn",dailyexamqustn)
//
//        visibleItems = self.collectionviewdailyexam.indexPathsForVisibleItems as NSArray
//        print("visibleItems",visibleItems)
//        currentItem = visibleItems.object(at: 0) as! IndexPath
//      nextItem = IndexPath(item: currentItem.row + 1, section: 0)
//
//         print("currentItem",currentItem)
//         print("nextItem",nextItem)
//            if self.mocktest_flag==1{
//                if nextItem.row < self.questionsformocktest?.count ?? 0{
//                self.collectionviewdailyexam.scrollToItem(at: nextItem, at: .left, animated: true)
//
//            }else if nextItem.row == self.questionsformocktest?.count ?? 0{
//
//                    self.showToast(message: "End of Exam", font: UIFont.boldSystemFont(ofSize: 14),duration: 2)
//            }
//
//
//
//            }else if self.exclusivecoachingflag==1{
//                if nextItem.row < self.chapterwiseexamdata?.count ?? 0{
//                self.collectionviewdailyexam.scrollToItem(at: nextItem, at: .left, animated: true)
//
//            }else if nextItem.row == self.chapterwiseexamdata?.count ?? 0{
//                self.showToast(message: "End of Exam", font: UIFont.boldSystemFont(ofSize: 14),duration: 2)
//            }
//        }  else if self.currentaffairsflag==1{
//            if nextItem.row < self.caqstndata?.count ?? 0{
//                self.collectionviewdailyexam.scrollToItem(at: nextItem, at: .left, animated: true)
//
//            }else if nextItem.row == self.caqstndata?.count ?? 0{
//                self.showToast(message: "End of Exam", font: UIFont.boldSystemFont(ofSize: 14),duration: 2)
//            }
//
//            }  else if self.weekwisequstnflag==1{
//                if nextItem.row < self.questionsforweekexam?.count ?? 0{
//                    self.collectionviewdailyexam.scrollToItem(at: nextItem, at: .left, animated: true)
//
//                }else if nextItem.row == self.questionsforweekexam?.count ?? 0{
//                    self.showToast(message: "End of Exam", font: UIFont.boldSystemFont(ofSize: 14),duration: 2)
//                }
//        }else{
//
//
//                if nextItem.row < self.dailyexamqustn?.count ?? 0{
//                    self.collectionviewdailyexam.scrollToItem(at: nextItem, at: .left, animated: true)
//                   // actionflag=1
//
//
//
//            }else if nextItem.row == self.dailyexamqustn?.count ?? 0{
//                self.showToast(message: "End of Exam", font: UIFont.boldSystemFont(ofSize: 14),duration: 2)
//            }
//
//        }
//
//        self.collectionviewdailyexam.reloadData()
//
////
//    }
//
//
//
//    func Btn_LeftAction()
//    {
//        let visibleItems: NSArray = self.collectionviewdailyexam.indexPathsForVisibleItems as NSArray
//        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
//        let nextItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
//        if mocktest_flag==1{
//            if nextItem.row < questionsformocktest?.count ?? 0 && nextItem.row >= 0{
//                self.collectionviewdailyexam.scrollToItem(at: nextItem, at: .right, animated: true)
//
//            }
//        }else if exclusivecoachingflag==1{
//            if nextItem.row < chapterwiseexamdata?.count ?? 0 && nextItem.row >= 0{
//                self.collectionviewdailyexam.scrollToItem(at: nextItem, at: .right, animated: true)
//
//            }
//        }   else if currentaffairsflag==1{
//            if nextItem.row < caqstndata?.count ?? 0 && nextItem.row >= 0{
//                self.collectionviewdailyexam.scrollToItem(at: nextItem, at: .right, animated: true)
//
//            }
//        } else if weekwisequstnflag==1{
//            if nextItem.row < questionsforweekexam?.count ?? 0 && nextItem.row >= 0{
//                self.collectionviewdailyexam.scrollToItem(at: nextItem, at: .right, animated: true)
//
//            }
//        }else{
//            if nextItem.row < dailyexamqustn?.count ?? 0 && nextItem.row >= 0{
//                self.collectionviewdailyexam.scrollToItem(at: nextItem, at: .right, animated: true)
//
//            }
//        }
////        self.collectionviewdailyexam.reloadSections(IndexSet(integer: 0))
//    }
//
//
//
//    @objc func btnnextaction(sender:UIButton){
//        var questionidcontains=String()
//        if mocktest_flag==1{
//            questionidcontains=questionsformocktest?[sender.tag].psc_question_id ?? ""
//        }else if exclusivecoachingflag==1{
//            questionidcontains=chapterwiseexamdata?[sender.tag].chapter_question_id ?? ""
//        } else if currentaffairsflag==1{
//            questionidcontains=caqstndata?[sender.tag].ca_question_id ?? ""
//        }else{
//            questionidcontains=dailyexamqustn?[sender.tag].psc_question_id ?? ""
//        }
//        if questionidarray.contains(questionidcontains){
//            Btn_RightAction()
//
//        }else{
//            showToast(message: "Please select an answer to continue", font: UIFont.boldSystemFont(ofSize: 14),duration: 2)
//        }
//    }
//
//    @objc func btnpreviousaction(sender:UIButton){
//        Btn_LeftAction()
//    }
    
    
    
//    @objc func btnsubmittaction(sender:UIButton){
//        
//        
//        if mocktest_flag==1{
//            
//            dict_answers.updateValue((mocktestseriesdata?[0].psc_mock_category_id ?? ""), forKey: "mock_category")
//            dict_answers.updateValue(mocktestqstnarray, forKey: "mock_test_question")
//        }else if exclusivecoachingflag==1{
//            dict_answers.updateValue(chapterwiseexamdata?[0].chapter_id ?? "", forKey: "chapter_id")
//            dict_answers.updateValue(dailyexamqstnarray, forKey: "chapter_wise_exam")
//        }else if currentaffairsflag==1{
//            dict_answers.updateValue(caqstndata?[0].ca_id ?? "", forKey: "ca_id")
//            dict_answers.updateValue(dailyexamqstnarray, forKey: "ca_question")
//        }else if weekwisequstnflag==1{
//            dict_answers.updateValue(questionsforweekexam?[0].week_exam_id ?? "", forKey: "week_exam_id")
//                       dict_answers.updateValue(weekexamqustnarray, forKey: "exam_question")
//        }
//        else{
//            dict_answers.updateValue(datechoosen, forKey: "exam_date")
//            dict_answers.updateValue(dailyexamqstnarray, forKey: "daily_exam_question")
//        }
//        
//        dict_answers.updateValue(usertime, forKey: "user_time")
//        dict_main.updateValue(dict_answers, forKey: "data")
//        print("dict_main",dict_main)
//        viewsubmitanswer.isHidden=false
//    }
//    
    @IBAction func btnsubmitansweraction(_ sender: Any) {
        print("dict_main",dict_main)
        dailyexammodel.dictmain=dict_main
        if mocktest_flag==1{
            dailyexammodel.submit_mock_test_question_new_one_latest{ (model) in
                self.submit_mock_test_question_new_one_latest(data:model)
            }
        }else if exclusivecoachingflag==1{
            dailyexammodel.submit_chapter_wise_exam{ (model) in
                self.submitchapterwiseexamdata(data:model)
            }
            
        }else if currentaffairsflag==1{
            dailyexammodel.submit_ca_exam{ (model) in
                           self.submit_ca_examdata(data:model)
                       }
        
        } else if weekwisequstnflag==1{
            
            dailyexammodel.submit_week_wise_exam_new{ (model) in
                           self.submit_week_wise_examdata(data:model)
                       }
        
    } else{
            dailyexammodel.submit_daily_exam{ (model) in
                self.submitdailyexam(data:model)
            }
        }
        viewsubmitanswer.isHidden=true
    }
    
    @IBAction func btncancelaction(_ sender: Any) {
        viewsubmitanswer.isHidden=true
        
    }
    func submitdailyexam(data: Dailyexamanswersubmsn) {
        print("data",data)
        let status=data.status
        
        if status==true{
            DispatchQueue.main.async{
                self.reportsandsolutionofdailyexam=data.data
                UserDefaults.standard.set(self.dict_main, forKey: "dictmaindailyexam")
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                self.viewevaluationcompleted.isHidden=false
                self.movetoreports()
            }
        }else{
            
            DispatchQueue.main.async{
                self.viewevaluationcompleted.isHidden=true
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
    func submit_ca_examdata(data: Submittcaexamclass) {
    let status=data.status
        if status==true{
            DispatchQueue.main.async{
                self.reportforcatest=data.data?.report
                self.viewevaluationcompleted.isHidden=false
                self.movetoreports()
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
func submit_week_wise_examdata(data: Submitweekexamclass) {
   let status=data.status
       if status==true{
           DispatchQueue.main.async{
               self.reportweekwisetest=data.data?.report
               self.viewevaluationcompleted.isHidden=false
               self.movetoreports()
               self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
               
           }
       }else{
           
           DispatchQueue.main.async{
               self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
           }
       }
   }
    
    
    
    
    
    
    
    func submitchapterwiseexamdata(data: Submittchapterwiseexamclass) {
        print("data",data)
        let status=data.status
        
        if status==true{
            DispatchQueue.main.async{
                self.reportsandsolutionforchapterwiseexam=data.data
                UserDefaults.standard.set(self.dict_main, forKey: "dictmaindailyexam")
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                self.viewevaluationcompleted.isHidden=false
                self.movetoreports()
            }
        }else{
            
            DispatchQueue.main.async{
                self.viewevaluationcompleted.isHidden=true
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    func submit_mock_test_question_new_one_latest(data: Reporttestseries) {
        print("data",data)
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                self.reportformocktest=data.data?.report
                self.viewevaluationcompleted.isHidden=false
                self.movetoreports()
                self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
    
    
    
    func movetoreports(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            let reports = self.storyboard?.instantiateViewController (withIdentifier: "ReportsandsolutionsViewController") as! ReportsandsolutionsViewController
            if self.mocktest_flag==1{
                reports.dataaftertestseriessubsn=self.reportformocktest
                 reports.mocktestflag=self.mocktest_flag
            }else if self.exclusivecoachingflag==1{
                reports.dataafterchapterwisesubsn=self.reportsandsolutionforchapterwiseexam
                 reports.exclusivecoachingflag=self.exclusivecoachingflag
            }else if self.currentaffairsflag==1{
                 reports.currentaffairsflag=1
                 reports.dataaftercasubsn=self.reportforcatest
            }else if self.weekwisequstnflag==1{
            reports.weekwisequstnflag=1
            reports.dataafterweekexamsubsn=self.reportweekwisetest
            }else{
                reports.dataafterdailyexamsubsn=self.reportsandsolutionofdailyexam
            }
           
           
           
            self.navigationController?.pushViewController(reports, animated: true)
        }
        
    }
    
    func showhud(){
        hud = MBProgressHUD.showAdded(to: self.view, animated: true)
        hud.mode = MBProgressHUDMode.indeterminate
            }
   
    
}
extension UICollectionView {
    func scrollToNextItem() {
        let contentOffset = CGFloat(floor(self.contentOffset.x + self.bounds.size.width))
        self.moveToFrame(contentOffset: contentOffset)
    }
    func moveToFrame(contentOffset : CGFloat) {
            self.setContentOffset(CGPoint(x: contentOffset, y: self.contentOffset.y), animated: true)
        }
}
