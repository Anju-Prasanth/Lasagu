//
//  QustnanswerTableViewCell.swift
//  Lasagu
//
//  Created by Anju s on 01/03/21.
//  Copyright © 2021 Arun Vijayan. All rights reserved.
//

import UIKit
import MBProgressHUD

protocol selectedanswertapped{
    
    func selectedanswer(pause_flag: Int,attended_count:Int,skipped_count:Int,submitflag:Int,dictanswers:[String:Any])
}

protocol tableheightdelegate{
    func totaltableheight(height:Float)
}


extension UITableViewCell{
    
    func showToast(message : String, font: UIFont , duration: Double) {
        let toastLabel = UILabel(frame: CGRect(x: self.frame.size.width/4 - 85, y:  UIScreen.main.bounds.height-270, width: UIScreen.main.bounds.width-30, height: 40))
        //toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.backgroundColor = UIColor.systemGreen
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 5;
        toastLabel.clipsToBounds  =  true
        self.addSubview(toastLabel)
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }

    
    func showToast1(message : String, font: UIFont , duration: Double) {
           
           let toastLabel = UILabel(frame: CGRect(x: self.frame.size.width/4 - 85, y: self.frame.size.height/2-150, width: UIScreen.main.bounds.width-30, height: 40))
           //toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
           toastLabel.backgroundColor = UIColor.systemRed
           toastLabel.textColor = UIColor.white
           toastLabel.font = font
           toastLabel.textAlignment = .center;
           toastLabel.text = message
           toastLabel.alpha = 1.0
           toastLabel.layer.cornerRadius = 5;
           toastLabel.clipsToBounds  =  true
           self.addSubview(toastLabel)
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut, animations: {
               toastLabel.alpha = 0.0
           }, completion: {(isCompleted) in
               toastLabel.removeFromSuperview()
           })
       }
        
    }


@available(iOS 13.0, *)
class QustnanswerTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var newcollectionviewdailyexam: UICollectionView!
    
    
    
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
   
    var mocktestseriesdata:[Mock_test_series_question]?
    var questionsformocktest:[Questions]?
    var usertime=String()
    var mocktestseriesid=String()
    var reportsandsolutionofdailyexam:Dailyexamanswerdata?
    var reportformocktest:Report?
    
    var chapterid=String()
    var chapterwiseexamdata:[chapterwisequstndata]?
    var reportsandsolutionforchapterwiseexam:submitchapterwisedata?
    var yearid=String()
    var monthid=String()
    var caid=String()
    
    var caqstndata:[CurrentaffairData]?
    var currentaffairqustnarray=[[String:String]]()
    var reportforcatest:CAReport?
    var pauseflag=0
    
    var currentitem=Int()
    
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
    
    var questioncell=NewdailyexamCollectionViewCell()
    var selectedanswer=String()
    var mocktestflag=Int()
    var exclusivecoachingflag=Int()
    var currentaffairflag=Int()
    var weekwiseflag=Int()
    var date_choosen=String()
    var delegate:selectedanswertapped!
    var delegate1:tableheightdelegate!
    var flowLayout=UICollectionViewLayout()
    var selectedoption=String()
    var tableviewheight=Float()
    var hud:MBProgressHUD!
    var theme=Int()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        newcollectionviewdailyexam.delegate=self
        newcollectionviewdailyexam.dataSource=self
        newcollectionviewdailyexam.layer.cornerRadius=20
//        newcollectionviewdailyexam.setShadowEffect()
        
       
        
        if let mode=UserDefaults.standard.value(forKey: "mode"){
            theme=UserDefaults.standard.value(forKey: "mode") as! Int
        }
        if theme==0{
            overrideUserInterfaceStyle = .light
            
        }else{
        overrideUserInterfaceStyle = .dark
        }
        
        if let mocktest_flag=UserDefaults.standard.value(forKey: "mocktestflag"){
            mocktestflag=UserDefaults.standard.value(forKey: "mocktestflag") as! Int
        
        }
        
        if let exclusivecoaching_flag=UserDefaults.standard.value(forKey: "exclusivecoachingflag"){
            exclusivecoachingflag=UserDefaults.standard.value(forKey: "exclusivecoachingflag") as! Int
        
        }
        
        
        
        if let currentaffairs_flag=UserDefaults.standard.value(forKey: "currentaffairflag"){
            currentaffairflag=UserDefaults.standard.value(forKey: "currentaffairflag") as! Int
        
        }
        
        
        
        if let weekwisequstn_flag=UserDefaults.standard.value(forKey: "weekwiseflag"){
            weekwiseflag=UserDefaults.standard.value(forKey: "weekwiseflag") as! Int
        
        }
        
        
        
        if let datechoosen=UserDefaults.standard.value(forKey: "datechoosen"){
            date_choosen=UserDefaults.standard.value(forKey: "datechoosen") as! String
        
        }
        
        
        
        if let weekexamid=UserDefaults.standard.value(forKey: "week_examid"){
            week_examid=UserDefaults.standard.value(forKey: "week_examid") as! String
        
        }
        
        
        
        if let year_id=UserDefaults.standard.value(forKey: "yearid"){
            yearid=UserDefaults.standard.value(forKey: "yearid") as! String
        
        }
        
        
        
        if let ca_id=UserDefaults.standard.value(forKey: "caid"){
            caid=UserDefaults.standard.value(forKey: "caid") as! String
        
        }
        
        
        
        if let month_id=UserDefaults.standard.value(forKey: "monthid"){
            monthid=UserDefaults.standard.value(forKey: "monthid") as! String
        
        }
        if let chapter_id=UserDefaults.standard.value(forKey: "chapterid"){
            chapterid=UserDefaults.standard.value(forKey: "chapterid") as! String
        
        }
        if let mocktestseries_id=UserDefaults.standard.value(forKey: "mocktestseries_id"){
            mocktestseriesid=UserDefaults.standard.value(forKey: "mocktestseries_id") as! String
        
        }
        
        userid=(UserDefaults.standard.value(forKey: "useridnew") as! NSNumber).stringValue
        
        funccalled(mocktestflag: mocktestflag, exclusivecoachingflag: exclusivecoachingflag, currentaffairflag: currentaffairflag, weekwiseflag: weekwiseflag, date_choosen: date_choosen, week_examid: week_examid, year_id: yearid, caid: caid, monthid: monthid, chapterid: chapterid, mocktestseries_id: mocktestseriesid)
        
        
//
//                if let flowLayout = newcollectionviewdailyexam.collectionViewLayout as? UICollectionViewFlowLayout {
//                flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
//
//                           }

    }
    
    
    
//    func loadCollectionView(mocktestflag:Int,exclusivecoachingflag:Int,currentaffairflag:Int,weekwiseflag:Int,date_choosen:String,week_examid:String,year_id:String,caid:String,
//                            monthid:String,chapterid:String,mocktestseries_id:String) {
//        print("weekwiseflag",weekwiseflag)
//        print("week_examid",week_examid)
//
//
//
//        funccalled(mocktestflag:mocktestflag,exclusivecoachingflag:exclusivecoachingflag,currentaffairflag:currentaffairflag,weekwiseflag:weekwiseflag,date_choosen:date_choosen,week_examid:week_examid,year_id:year_id,caid:date_choosen,
//                   monthid:monthid,chapterid:chapterid,mocktestseries_id:mocktestseries_id)
//
//      // self.collectionviewdailyexam.reloadData()
//    }

    func funccalled(mocktestflag:Int,exclusivecoachingflag:Int,currentaffairflag:Int,weekwiseflag:Int,date_choosen:String,week_examid:String,year_id:String,caid:String,
                    monthid:String,chapterid:String,mocktestseries_id:String) {

       print("weekwiseflag",weekwiseflag)
        
    dailyexammodel.dateselected=date_choosen
    if mocktestflag==1{
        
        dailyexammodel.mocktestseriesid=mocktestseries_id
        
        dailyexammodel.get_mock_test_series_questions_new_ios{ (model) in
            self.mocktestseriesqustn(data:model)
        }
    }else if exclusivecoachingflag==1{
        dailyexammodel.chapterid=chapterid
        dailyexammodel.get_chapter_wise_exam{ (model) in
            self.getchapterwiseexamdata(data:model)
        }
        
    }else if currentaffairflag==1{
        dailyexammodel.year_id=yearid
        dailyexammodel.ca_id=caid
        dailyexammodel.month_id=monthid
        dailyexammodel.get_current_affairs_questions{ (model) in
                       self.currentaffairqstndata(data:model)
        }
        
    }else if weekwiseflag==1{
        dailyexammodel.weekexamid=week_examid
        dailyexammodel.get_week_wise_exam_questions_new{ (model) in
                self.getweekwiseexamquestionsdata(data:model)
        }
        
        
    }else{
        
        
        dailyexammodel.get_daily_exam_questions{ (model) in
            self.dailyexamquestn(data:model)
        }
    }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int{
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if mocktestflag==1{
            return questionsformocktest?.count ?? 0
        }else if exclusivecoachingflag==1{
            return chapterwiseexamdata?.count ?? 0
        }else if currentaffairflag==1{
            return caqstndata?.count ?? 0
        }else if weekwiseflag==1{
             return questionsforweekexam?.count ?? 0
        }else{

            return dailyexamqustn?.count ?? 0
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    questioncell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewdailyexamCollectionViewCell",for: indexPath) as! NewdailyexamCollectionViewCell
        questioncell.layer.cornerRadius=10
        questioncell.lblopt1.isHidden=true
        questioncell.lblopt2.isHidden=true
        questioncell.lblopt3.isHidden=true
        questioncell.lblopt4.isHidden=true
        questioncell.btnopt1.layer.cornerRadius=20
        questioncell.btnopt1.layer.borderColor = UIColor.lightGray.cgColor
        questioncell.btnopt1.layer.borderWidth=0.5
        questioncell.btnopt2.layer.cornerRadius=20
        questioncell.btnopt2.layer.borderColor = UIColor.lightGray.cgColor
        questioncell.btnopt2.layer.borderWidth=0.5
        questioncell.btnopt3.layer.cornerRadius=20
        questioncell.btnopt3.layer.borderColor = UIColor.lightGray.cgColor
        questioncell.btnopt3.layer.borderWidth=0.5
        questioncell.btnopt4.layer.cornerRadius=20
        questioncell.btnopt4.layer.borderColor = UIColor.lightGray.cgColor
        questioncell.btnopt4.layer.borderWidth=0.5
        
        
        if mocktestflag==1{
            
            
            
            
            
            
            if theme==0{
            questioncell.btnopt1.setAttributedTitle((questionsformocktest?[indexPath.row].psc_option1 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt2.setAttributedTitle((questionsformocktest?[indexPath.row].psc_option2 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt3.setAttributedTitle((questionsformocktest?[indexPath.row].psc_option3 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt4.setAttributedTitle((questionsformocktest?[indexPath.row].psc_option4 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.lblqustion.attributedText=(questionsformocktest?[indexPath.row].psc_question ?? "").convertToAttributedString3()
            }else{
                questioncell.btnopt1.setAttributedTitle((questionsformocktest?[indexPath.row].psc_option1 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt2.setAttributedTitle((questionsformocktest?[indexPath.row].psc_option2 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt3.setAttributedTitle((questionsformocktest?[indexPath.row].psc_option3 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt4.setAttributedTitle((questionsformocktest?[indexPath.row].psc_option4 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.lblqustion.attributedText=(questionsformocktest?[indexPath.row].psc_question ?? "").convertToAttributedString3white()
            }
            
            questioncell.btnopt1.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt1.layoutIfNeeded()
            questioncell.btnopt1.sizeToFit()
           
            
            questioncell.btnopt1height.constant=50
            if (questioncell.btnopt1.titleLabel?.frame.size.height)!>20{
                questioncell.btnopt1height.constant = ((questioncell.btnopt1.titleLabel?.frame.size.height)!)+50
                
            }else{
                self.questioncell.btnopt1height.constant=50
            }
           
            questioncell.btnopt2.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt2.layoutIfNeeded()
            questioncell.btnopt2height.constant=50
            if (questioncell.btnopt2.titleLabel?.frame.size.height)!>20{
            questioncell.btnopt2height.constant = ((questioncell.btnopt2.titleLabel?.frame.size.height)!)+50
            }else{
                self.questioncell.btnopt2height.constant=50
            }
            
            
            questioncell.btnopt3.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt3.layoutIfNeeded()
            questioncell.btnopt3height.constant=50
            if (questioncell.btnopt3.titleLabel?.frame.size.height)!>20{
            questioncell.btnopt3height.constant = ((questioncell.btnopt3.titleLabel?.frame.size.height)!)+50
            }else{
                self.questioncell.btnopt3height.constant=50
            }
            
            
            questioncell.btnopt4.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt4.layoutIfNeeded()
            questioncell.btnopt4height.constant=50
            if (questioncell.btnopt4.titleLabel?.frame.size.height)!>20{
            questioncell.btnopt4height.constant = ((questioncell.btnopt4.titleLabel?.frame.size.height)!)+50
            }else{
                self.questioncell.btnopt4height.constant=50
            }
            
            
  
               
            
            
            
            
            
            
            
            
//            questioncell.lblopt1.text=questionsformocktest?[indexPath.row].psc_option1 ?? ""
//            questioncell.lblopt2.text=questionsformocktest?[indexPath.row].psc_option2 ?? ""
//            questioncell.lblopt3.text=questionsformocktest?[indexPath.row].psc_option3 ?? ""
//            questioncell.lblopt4.text=questionsformocktest?[indexPath.row].psc_option4 ?? ""
//            questioncell.lblqustion.attributedText=(questionsformocktest?[indexPath.row].psc_question ?? "").convertToAttributedString3()
            
            if questionsformocktest?[indexPath.row].isselected==1{
                questioncell.btnopt1.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                if theme==0{
                questioncell.btnopt2.backgroundColor=UIColor.white
                questioncell.btnopt3.backgroundColor=UIColor.white
                questioncell.btnopt4.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt2.backgroundColor=UIColor.black
                    questioncell.btnopt3.backgroundColor=UIColor.black
                    questioncell.btnopt4.backgroundColor=UIColor.black
                }
                
            }else if questionsformocktest?[indexPath.row].isselected==2{
                questioncell.btnopt2.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                if theme==0{
                questioncell.btnopt1.backgroundColor=UIColor.white
                questioncell.btnopt3.backgroundColor=UIColor.white
                questioncell.btnopt4.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt1.backgroundColor=UIColor.black
                    questioncell.btnopt3.backgroundColor=UIColor.black
                    questioncell.btnopt4.backgroundColor=UIColor.black
                }
                
            }else if questionsformocktest?[indexPath.row].isselected==3{
                questioncell.btnopt3.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                if theme==0{
                questioncell.btnopt2.backgroundColor=UIColor.white
                questioncell.btnopt1.backgroundColor=UIColor.white
                questioncell.btnopt4.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt2.backgroundColor=UIColor.black
                    questioncell.btnopt1.backgroundColor=UIColor.black
                    questioncell.btnopt4.backgroundColor=UIColor.black
                }
                
            }else if questionsformocktest?[indexPath.row].isselected==4{
                questioncell.btnopt4.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                if theme==0{
                questioncell.btnopt2.backgroundColor=UIColor.white
                questioncell.btnopt3.backgroundColor=UIColor.white
                questioncell.btnopt1.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt2.backgroundColor=UIColor.black
                    questioncell.btnopt3.backgroundColor=UIColor.black
                    questioncell.btnopt1.backgroundColor=UIColor.black
                }
                
            }else{
                if theme==0{
                questioncell.btnopt1.backgroundColor=UIColor.white
                
                questioncell.btnopt2.backgroundColor=UIColor.white
                questioncell.btnopt3.backgroundColor=UIColor.white
                questioncell.btnopt4.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt1.backgroundColor=UIColor.black
                    
                    questioncell.btnopt2.backgroundColor=UIColor.black
                    questioncell.btnopt3.backgroundColor=UIColor.black
                    questioncell.btnopt4.backgroundColor=UIColor.black
                }
            }
            
        }  else if exclusivecoachingflag==1{
            
            
            
            
            
            if theme==0{
            
            questioncell.btnopt1.setAttributedTitle((chapterwiseexamdata?[indexPath.row].chapter_exam_option1 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt2.setAttributedTitle((chapterwiseexamdata?[indexPath.row].chapter_exam_option2 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt3.setAttributedTitle((chapterwiseexamdata?[indexPath.row].chapter_exam_option3 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt4.setAttributedTitle((chapterwiseexamdata?[indexPath.row].chapter_exam_option4 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.lblqustion.attributedText=(chapterwiseexamdata?[indexPath.row].chapter_exam_question ?? "").convertToAttributedString3()
            }else{
                questioncell.btnopt1.setAttributedTitle((chapterwiseexamdata?[indexPath.row].chapter_exam_option1 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt2.setAttributedTitle((chapterwiseexamdata?[indexPath.row].chapter_exam_option2 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt3.setAttributedTitle((chapterwiseexamdata?[indexPath.row].chapter_exam_option3 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt4.setAttributedTitle((chapterwiseexamdata?[indexPath.row].chapter_exam_option4 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.lblqustion.attributedText=(chapterwiseexamdata?[indexPath.row].chapter_exam_question ?? "").convertToAttributedString3white()
            }
            questioncell.btnopt1.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt1.layoutIfNeeded()
            questioncell.btnopt1height.constant=50
            if (questioncell.btnopt1.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt1height.constant = (questioncell.btnopt1.titleLabel?.frame.size.height)!
            }else{
                self.questioncell.btnopt1height.constant=50
            }
            
            questioncell.btnopt2.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt2.layoutIfNeeded()
            questioncell.btnopt2height.constant=50
            if (questioncell.btnopt2.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt2height.constant = (questioncell.btnopt2.titleLabel?.frame.size.height)!
            }else{
                self.questioncell.btnopt2height.constant=50
            }
            
            
            questioncell.btnopt3.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt3.layoutIfNeeded()
            questioncell.btnopt3height.constant=50
            if (questioncell.btnopt3.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt3height.constant = (questioncell.btnopt3.titleLabel?.frame.size.height)!
            }else{
                self.questioncell.btnopt3height.constant=50
            }
            
            
            questioncell.btnopt4.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt4.layoutIfNeeded()
            questioncell.btnopt4height.constant=50
            if (questioncell.btnopt4.titleLabel?.frame.size.height)!>50{
    questioncell.btnopt4height.constant=(questioncell.btnopt4.titleLabel?.frame.size.height)!
            }else{
                self.questioncell.btnopt4height.constant=50
            }
            
            
  
               
            
            
            
            
//            questioncell.lblopt1.text=chapterwiseexamdata?[indexPath.row].chapter_exam_option1 ?? ""
//            questioncell.lblopt2.text=chapterwiseexamdata?[indexPath.row].chapter_exam_option2 ?? ""
//            questioncell.lblopt3.text=chapterwiseexamdata?[indexPath.row].chapter_exam_option3 ?? ""
//            questioncell.lblopt4.text=chapterwiseexamdata?[indexPath.row].chapter_exam_option4 ?? ""
//            questioncell.lblqustion.attributedText=(chapterwiseexamdata?[indexPath.row].chapter_exam_question ?? "").convertToAttributedString3()
            
            if chapterwiseexamdata?[indexPath.row].isselected==1{
                 questioncell.btnopt1.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                if theme==0{
                               questioncell.btnopt2.backgroundColor=UIColor.white
                               questioncell.btnopt3.backgroundColor=UIColor.white
                               questioncell.btnopt4.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt2.backgroundColor=UIColor.black
                    questioncell.btnopt3.backgroundColor=UIColor.black
                    questioncell.btnopt4.backgroundColor=UIColor.black
                }
                
            }else if chapterwiseexamdata?[indexPath.row].isselected==2{
                questioncell.btnopt2.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                if theme==0{
                               questioncell.btnopt1.backgroundColor=UIColor.white
                               questioncell.btnopt3.backgroundColor=UIColor.white
                               questioncell.btnopt4.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt1.backgroundColor=UIColor.black
                    questioncell.btnopt3.backgroundColor=UIColor.black
                    questioncell.btnopt4.backgroundColor=UIColor.black
                }
                
            }else if chapterwiseexamdata?[indexPath.row].isselected==3{
                questioncell.btnopt3.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                if theme==0{
                               questioncell.btnopt2.backgroundColor=UIColor.white
                               questioncell.btnopt1.backgroundColor=UIColor.white
                               questioncell.btnopt4.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt2.backgroundColor=UIColor.black
                    questioncell.btnopt1.backgroundColor=UIColor.black
                    questioncell.btnopt4.backgroundColor=UIColor.black
                }
                
            }else if chapterwiseexamdata?[indexPath.row].isselected==4{
                questioncell.btnopt4.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                if theme==0{
                               questioncell.btnopt2.backgroundColor=UIColor.white
                               questioncell.btnopt3.backgroundColor=UIColor.white
                               questioncell.btnopt1.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt2.backgroundColor=UIColor.black
                    questioncell.btnopt3.backgroundColor=UIColor.black
                    questioncell.btnopt1.backgroundColor=UIColor.black
                }
                
            }else{
                if theme==0{
                questioncell.btnopt1.backgroundColor=UIColor.white
                
                questioncell.btnopt2.backgroundColor=UIColor.white
                questioncell.btnopt3.backgroundColor=UIColor.white
                questioncell.btnopt4.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt1.backgroundColor=UIColor.black
                    
                    questioncell.btnopt2.backgroundColor=UIColor.black
                    questioncell.btnopt3.backgroundColor=UIColor.black
                    questioncell.btnopt4.backgroundColor=UIColor.black
                }
            }
            
        }else if currentaffairflag==1{
            
            
            
            
            
            
            
            if theme==0{
            
            questioncell.btnopt1.setAttributedTitle((caqstndata?[indexPath.row].ca_option1 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt2.setAttributedTitle((caqstndata?[indexPath.row].ca_option2 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt3.setAttributedTitle((caqstndata?[indexPath.row].ca_option3 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt4.setAttributedTitle((caqstndata?[indexPath.row].ca_option4 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.lblqustion.attributedText=(caqstndata?[indexPath.row].ca_question ?? "").convertToAttributedString3()
            
            }else{
                questioncell.btnopt1.setAttributedTitle((caqstndata?[indexPath.row].ca_option1 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt2.setAttributedTitle((caqstndata?[indexPath.row].ca_option2 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt3.setAttributedTitle((caqstndata?[indexPath.row].ca_option3 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt4.setAttributedTitle((caqstndata?[indexPath.row].ca_option4 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.lblqustion.attributedText=(caqstndata?[indexPath.row].ca_question ?? "").convertToAttributedString3white()
            }
            
            
            
            questioncell.btnopt1.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt1.layoutIfNeeded()
            questioncell.btnopt1height.constant=50
            if (questioncell.btnopt1.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt1height.constant = (questioncell.btnopt1.titleLabel?.frame.size.height)!
            }else{
                self.questioncell.btnopt1height.constant=50
            }
            questioncell.btnopt2.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt2.layoutIfNeeded()
            questioncell.btnopt2height.constant=50
            if (questioncell.btnopt2.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt2height.constant = (questioncell.btnopt2.titleLabel?.frame.size.height)!
            }else{
                self.questioncell.btnopt2height.constant=50
            }
            
            
            questioncell.btnopt3.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt3.layoutIfNeeded()
            questioncell.btnopt3height.constant=50
            if (questioncell.btnopt3.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt3height.constant = (questioncell.btnopt3.titleLabel?.frame.size.height)!
            }else{
                self.questioncell.btnopt3height.constant=50
            }
            
            
            questioncell.btnopt4.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt4.layoutIfNeeded()
            questioncell.btnopt4height.constant=50
            if (questioncell.btnopt4.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt4height.constant = (questioncell.btnopt4.titleLabel?.frame.size.height)!
            }else{
                self.questioncell.btnopt4height.constant=50
            }
            
            
  
               
            
            
            
//                questioncell.lblopt1.text=caqstndata?[indexPath.row].ca_option1 ?? ""
//                questioncell.lblopt2.text=caqstndata?[indexPath.row].ca_option2 ?? ""
//                questioncell.lblopt3.text=caqstndata?[indexPath.row].ca_option3 ?? ""
//                questioncell.lblopt4.text=caqstndata?[indexPath.row].ca_option4 ?? ""
//                questioncell.lblqustion.attributedText=(caqstndata?[indexPath.row].ca_question ?? "").convertToAttributedString3()
                
                if caqstndata?[indexPath.row].isselected==1{
                    questioncell.btnopt1.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                    if theme==0{
                                   questioncell.btnopt2.backgroundColor=UIColor.white
                                   questioncell.btnopt3.backgroundColor=UIColor.white
                                   questioncell.btnopt4.backgroundColor=UIColor.white
                    }else{
                        questioncell.btnopt2.backgroundColor=UIColor.black
                        questioncell.btnopt3.backgroundColor=UIColor.black
                        questioncell.btnopt4.backgroundColor=UIColor.black
                    }
                    
                }else if caqstndata?[indexPath.row].isselected==2{
                    questioncell.btnopt2.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                    if theme==0{
                                   questioncell.btnopt1.backgroundColor=UIColor.white
                                   questioncell.btnopt3.backgroundColor=UIColor.white
                                   questioncell.btnopt4.backgroundColor=UIColor.white
                    }else{
                        questioncell.btnopt1.backgroundColor=UIColor.black
                        questioncell.btnopt3.backgroundColor=UIColor.black
                        questioncell.btnopt4.backgroundColor=UIColor.black
                    }
                    
                }else if caqstndata?[indexPath.row].isselected==3{
                    questioncell.btnopt3.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                    if theme==0{
                                   questioncell.btnopt2.backgroundColor=UIColor.white
                                   questioncell.btnopt1.backgroundColor=UIColor.white
                                   questioncell.btnopt4.backgroundColor=UIColor.white
                    }else{
                        questioncell.btnopt2.backgroundColor=UIColor.black
                        questioncell.btnopt1.backgroundColor=UIColor.black
                        questioncell.btnopt4.backgroundColor=UIColor.black
                    }
                    
                }else if caqstndata?[indexPath.row].isselected==4{
                    questioncell.btnopt4.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                    if theme==0{
                                   questioncell.btnopt2.backgroundColor=UIColor.white
                                   questioncell.btnopt3.backgroundColor=UIColor.white
                                   questioncell.btnopt1.backgroundColor=UIColor.white
                    }else{
                        questioncell.btnopt2.backgroundColor=UIColor.black
                        questioncell.btnopt3.backgroundColor=UIColor.black
                        questioncell.btnopt1.backgroundColor=UIColor.black
                    }
                    
                }else{
                    if theme==0{
                    questioncell.btnopt1.backgroundColor=UIColor.white
                    questioncell.btnopt2.backgroundColor=UIColor.white
                    questioncell.btnopt3.backgroundColor=UIColor.white
                    questioncell.btnopt4.backgroundColor=UIColor.white
                    }else{
                        questioncell.btnopt1.backgroundColor=UIColor.black
                        questioncell.btnopt2.backgroundColor=UIColor.black
                        questioncell.btnopt3.backgroundColor=UIColor.black
                        questioncell.btnopt4.backgroundColor=UIColor.black
                    }
                }
            
        }else if weekwiseflag==1{
        
            
           
            
           
            if theme==0{
            
            questioncell.btnopt1.setAttributedTitle((questionsforweekexam?[indexPath.row].option1 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt2.setAttributedTitle((questionsforweekexam?[indexPath.row].option2 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt3.setAttributedTitle((questionsforweekexam?[indexPath.row].option3 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt4.setAttributedTitle((questionsforweekexam?[indexPath.row].option4 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.lblqustion.attributedText=(questionsforweekexam?[indexPath.row].question ?? "").convertToAttributedString3()
            }else{
                questioncell.btnopt1.setAttributedTitle((questionsforweekexam?[indexPath.row].option1 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt2.setAttributedTitle((questionsforweekexam?[indexPath.row].option2 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt3.setAttributedTitle((questionsforweekexam?[indexPath.row].option3 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt4.setAttributedTitle((questionsforweekexam?[indexPath.row].option4 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.lblqustion.attributedText=(questionsforweekexam?[indexPath.row].question ?? "").convertToAttributedString3white()
            }
            
            
            
            questioncell.btnopt1.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt1.layoutIfNeeded()
            questioncell.btnopt1height.constant=50
            if (questioncell.btnopt1.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt1height.constant = ((questioncell.btnopt1.titleLabel?.frame.size.height)!)+50
            }else{
                self.questioncell.btnopt1height.constant=50
            }
            
            
            questioncell.btnopt2.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt2.layoutIfNeeded()
            questioncell.btnopt2height.constant=50
            if (questioncell.btnopt2.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt2height.constant = ((questioncell.btnopt2.titleLabel?.frame.size.height)!)+50
            }else{
                self.questioncell.btnopt2height.constant=50
            }
            
            
            questioncell.btnopt3.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt3.layoutIfNeeded()
            questioncell.btnopt3height.constant=50
            if (questioncell.btnopt3.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt3height.constant = ((questioncell.btnopt3.titleLabel?.frame.size.height)!)+50
            }else{
                self.questioncell.btnopt3height.constant=50
            }
            
            
            questioncell.btnopt4.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt4.layoutIfNeeded()
            questioncell.btnopt4height.constant=50
            if (questioncell.btnopt4.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt4height.constant = ((questioncell.btnopt4.titleLabel?.frame.size.height)!)+50
            }else{
                self.questioncell.btnopt4height.constant=50
            }
            
            
            
            
            
            
                
//            questioncell.lblopt1.attributedText=(questionsforweekexam?[indexPath.row].option1 ?? "").convertToAttributedString3()
            
//                questioncell.lblopt2.attributedText=(questionsforweekexam?[indexPath.row].option2 ?? "").convertToAttributedString3()
//            questioncell.lblopt3.attributedText=(questionsforweekexam?[indexPath.row].option3 ?? "").convertToAttributedString3()
//            questioncell.lblopt4.attributedText=(questionsforweekexam?[indexPath.row].option4 ?? "").convertToAttributedString3()
               
//
//            questioncell.lblopt1.numberOfLines=0
//            questioncell.lblopt1.sizeToFit()
                
                 if questionsforweekexam?[indexPath.row].isselected==1{
                    questioncell.btnopt1.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                    if theme==0{
                                   questioncell.btnopt2.backgroundColor=UIColor.white
                                   questioncell.btnopt3.backgroundColor=UIColor.white
                                   questioncell.btnopt4.backgroundColor=UIColor.white
                    }else{
                        questioncell.btnopt2.backgroundColor=UIColor.black
                        questioncell.btnopt3.backgroundColor=UIColor.black
                        questioncell.btnopt4.backgroundColor=UIColor.black
                    }
                }else if questionsforweekexam?[indexPath.row].isselected==2{
                    questioncell.btnopt2.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                    if theme==0{
                                   questioncell.btnopt1.backgroundColor=UIColor.white
                                   questioncell.btnopt3.backgroundColor=UIColor.white
                                   questioncell.btnopt4.backgroundColor=UIColor.white
                    }else{
                        questioncell.btnopt1.backgroundColor=UIColor.black
                        questioncell.btnopt3.backgroundColor=UIColor.black
                        questioncell.btnopt4.backgroundColor=UIColor.black
                    }
                    
                }else if questionsforweekexam?[indexPath.row].isselected==3{
                    questioncell.btnopt3.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                    if theme==0{
                                   questioncell.btnopt2.backgroundColor=UIColor.white
                                   questioncell.btnopt1.backgroundColor=UIColor.white
                                   questioncell.btnopt4.backgroundColor=UIColor.white
                    }else{
                        questioncell.btnopt2.backgroundColor=UIColor.black
                        questioncell.btnopt1.backgroundColor=UIColor.black
                        questioncell.btnopt4.backgroundColor=UIColor.black
                    }
                    
                }else if questionsforweekexam?[indexPath.row].isselected==4{
                    questioncell.btnopt4.backgroundColor=UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                    if theme==0{
                                   questioncell.btnopt2.backgroundColor=UIColor.white
                                   questioncell.btnopt3.backgroundColor=UIColor.white
                                   questioncell.btnopt1.backgroundColor=UIColor.white
                    }else{
                        questioncell.btnopt2.backgroundColor=UIColor.black
                        questioncell.btnopt3.backgroundColor=UIColor.black
                        questioncell.btnopt1.backgroundColor=UIColor.black
                    }
                    
                }else{
                    if theme==0{
                    questioncell.btnopt1.backgroundColor=UIColor.white
                    
                    questioncell.btnopt2.backgroundColor=UIColor.white
                    questioncell.btnopt3.backgroundColor=UIColor.white
                    questioncell.btnopt4.backgroundColor=UIColor.white
                    }else{
                        questioncell.btnopt1.backgroundColor=UIColor.black
                        
                        questioncell.btnopt2.backgroundColor=UIColor.black
                        questioncell.btnopt3.backgroundColor=UIColor.black
                        questioncell.btnopt4.backgroundColor=UIColor.black
                    }
                }
            
            
            
        
            
        }else{
            
            
            
            
            if theme==0{
            questioncell.btnopt1.setAttributedTitle((dailyexamqustn?[indexPath.row].psc_option1 ?? "").convertToAttributedString3(), for: .normal)
            
            questioncell.btnopt2.setAttributedTitle((dailyexamqustn?[indexPath.row].psc_option2 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt3.setAttributedTitle((dailyexamqustn?[indexPath.row].psc_option3 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.btnopt4.setAttributedTitle((dailyexamqustn?[indexPath.row].psc_option4 ?? "").convertToAttributedString3(), for: .normal)
            questioncell.lblqustion.attributedText=(dailyexamqustn?[indexPath.row].psc_question ?? "").convertToAttributedString3()
            }else{
                questioncell.btnopt1.setAttributedTitle((dailyexamqustn?[indexPath.row].psc_option1 ?? "").convertToAttributedString3white(), for: .normal)
                
                questioncell.btnopt2.setAttributedTitle((dailyexamqustn?[indexPath.row].psc_option2 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt3.setAttributedTitle((dailyexamqustn?[indexPath.row].psc_option3 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.btnopt4.setAttributedTitle((dailyexamqustn?[indexPath.row].psc_option4 ?? "").convertToAttributedString3white(), for: .normal)
                questioncell.lblqustion.attributedText=(dailyexamqustn?[indexPath.row].psc_question ?? "").convertToAttributedString3white()
            }
            
            questioncell.btnopt1.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt1.layoutIfNeeded()
            questioncell.btnopt1height.constant=50
            if (questioncell.btnopt1.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt1height.constant = (questioncell.btnopt1.titleLabel?.frame.size.height)!
            }else{
                self.questioncell.btnopt1height.constant=50
            }
            
            questioncell.btnopt2.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt2.layoutIfNeeded()
            questioncell.btnopt2height.constant=50
            if (questioncell.btnopt2.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt2height.constant = (questioncell.btnopt2.titleLabel?.frame.size.height)!
            }else{
                self.questioncell.btnopt2height.constant=50
            }
            
            
            questioncell.btnopt3.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt3.layoutIfNeeded()
            questioncell.btnopt3height.constant=50
            if (questioncell.btnopt3.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt3height.constant = (questioncell.btnopt3.titleLabel?.frame.size.height)!
            }else{
                self.questioncell.btnopt3height.constant=50
            }
            
            
            questioncell.btnopt4.titleLabel?.lineBreakMode = .byWordWrapping
            questioncell.btnopt4.layoutIfNeeded()
            questioncell.btnopt4height.constant=50
            if (questioncell.btnopt4.titleLabel?.frame.size.height)!>50{
            questioncell.btnopt4height.constant = (questioncell.btnopt4.titleLabel?.frame.size.height)!
            }else{
                self.questioncell.btnopt4height.constant=50
            }
            
        
           
            
            
            print("dailyexamqustn",dailyexamqustn)
           // questioncell.lblopt1.text=dailyexamqustn?[indexPath.item].psc_option1 ?? ""
//            questioncell.lblopt2.text=dailyexamqustn?[indexPath.item].psc_option2 ?? ""
//            questioncell.lblopt3.text=dailyexamqustn?[indexPath.item].psc_option3 ?? ""
//            questioncell.lblopt4.text=dailyexamqustn?[indexPath.item].psc_option4 ?? ""
//            questioncell.lblqustion.attributedText=(dailyexamqustn?[indexPath.item].psc_question ?? "").convertToAttributedString3()
            
            if dailyexamqustn?[indexPath.item].isselected==1{
                questioncell.btnopt1.backgroundColor = UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                if theme==0{
                               questioncell.btnopt2.backgroundColor=UIColor.white
                               questioncell.btnopt3.backgroundColor=UIColor.white
                               questioncell.btnopt4.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt2.backgroundColor=UIColor.black
                    questioncell.btnopt3.backgroundColor=UIColor.black
                    questioncell.btnopt4.backgroundColor=UIColor.black
                }
                
            }else if dailyexamqustn?[indexPath.item].isselected==2{
                questioncell.btnopt2.backgroundColor = UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                if theme==0{
                               questioncell.btnopt1.backgroundColor=UIColor.white
                               questioncell.btnopt3.backgroundColor=UIColor.white
                               questioncell.btnopt4.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt1.backgroundColor=UIColor.black
                    questioncell.btnopt3.backgroundColor=UIColor.black
                    questioncell.btnopt4.backgroundColor=UIColor.black
                }
                
            }else if dailyexamqustn?[indexPath.item].isselected==3{
                questioncell.btnopt3.backgroundColor = UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                if theme==0{
                               questioncell.btnopt2.backgroundColor=UIColor.white
                               questioncell.btnopt1.backgroundColor=UIColor.white
                               questioncell.btnopt4.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt2.backgroundColor=UIColor.black
                    questioncell.btnopt1.backgroundColor=UIColor.black
                    questioncell.btnopt4.backgroundColor=UIColor.black
                }
                
            }else if dailyexamqustn?[indexPath.item].isselected==4{
                questioncell.btnopt4.backgroundColor = UIColor(red: 89/255.0, green: 232/255.0, blue: 251/255.0, alpha: 1.0)
                if theme==0{
                               questioncell.btnopt2.backgroundColor=UIColor.white
                               questioncell.btnopt3.backgroundColor=UIColor.white
                               questioncell.btnopt1.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt2.backgroundColor=UIColor.black
                    questioncell.btnopt3.backgroundColor=UIColor.black
                    questioncell.btnopt1.backgroundColor=UIColor.black
                }
                
            }else{
                if theme==0{
                questioncell.btnopt1.backgroundColor=UIColor.white
                
                questioncell.btnopt2.backgroundColor=UIColor.white
                questioncell.btnopt3.backgroundColor=UIColor.white
                questioncell.btnopt4.backgroundColor=UIColor.white
                }else{
                    questioncell.btnopt1.backgroundColor=UIColor.black
                    
                    questioncell.btnopt2.backgroundColor=UIColor.black
                    questioncell.btnopt3.backgroundColor=UIColor.black
                    questioncell.btnopt4.backgroundColor=UIColor.black
                }
            }
        }
       
        
        
        
        questioncell.btnopt1.tag=indexPath.item
        questioncell.btnopt2.tag=indexPath.item
        questioncell.btnopt3.tag=indexPath.item
        questioncell.btnopt4.tag=indexPath.item
        questioncell.btngotit.tag=indexPath.item
        questioncell.btnskipqustn.tag=indexPath.item
        questioncell.btnnext.tag=indexPath.item
        questioncell.btnpauseexam.tag=indexPath.item
        
        questioncell.lblqstnnumber.isHidden=false
        questioncell.lblqstnnumber.text="Q."+String(indexPath.item+1)
        
        
        questioncell.btnopt1.addTarget(self, action: #selector(btnopt1(sender:)), for: .touchUpInside)
        questioncell.btnopt2.addTarget(self, action: #selector(btnopt2(sender:)), for: .touchUpInside)
        questioncell.btnopt3.addTarget(self, action: #selector(btnopt3(sender:)), for: .touchUpInside)
        questioncell.btnopt4.addTarget(self, action: #selector(btnopt4(sender:)), for: .touchUpInside)
        questioncell.btnskipqustn.addTarget(self, action: #selector(skipaction(sender:)), for: .touchUpInside)
        questioncell.btnpauseexam.addTarget(self, action: #selector(pauseaction(sender:)), for: .touchUpInside)
       // questioncell.btngotit.addTarget(self, action: #selector(btngotitclicked(sender:)), for: .touchUpInside)
        questioncell.btnnext.addTarget(self, action: #selector(btnnextaction), for: .touchUpInside)
        questioncell.btnprevious.addTarget(self, action: #selector(btnpreviousaction), for: .touchUpInside)
        questioncell.btnsubmitt.addTarget(self, action: #selector(btnsubmittaction), for: .touchUpInside)
        
       
        
        
//        delegate1.totaltableheight(height:tableviewheight)
       
        return questioncell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
      
//        self.collectionviewdailyexam.scrollToItem(at: IndexPath(row: 3, section: 0), at: .left, animated: true)
//        collectionviewdailyexam.reloadData()
                           
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {


        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenheight=screenSize.height
        return CGSize(width: screenWidth-10, height: newcollectionviewdailyexam.frame.height-20)
//        return CGSize(width: screenWidth-10, height: CGFloat(tableviewheight))


    }
    
    
    
//    @objc func btnopt1(sender:UIButton){
//        delegate.selectedanswer(btnselected: 1, sender: sender.tag,skipflag: 0,pauseflag: 0,nextflag:0)
//
//
//
//    }
//
//    @objc func btnopt2(sender:UIButton){
//
//        delegate.selectedanswer(btnselected: 1, sender: sender.tag,skipflag: 0,pauseflag: 0,nextflag:0)
//
//
//    }
//    @objc func btnopt3(sender:UIButton){
//
//
//        delegate.selectedanswer(btnselected: 1, sender: sender.tag,skipflag: 0,pauseflag: 0,nextflag:0)
//
//
//    }
//    @objc func btnopt4(sender:UIButton){
//         print("sender.tag",sender.tag)
//
//        delegate.selectedanswer(btnselected: 1, sender: sender.tag,skipflag: 0,pauseflag: 0,nextflag:0)
//
//    }
    
    
     
    
   
    @objc func pauseaction(sender:UIButton){
        
        
        
        let calendar = NSCalendar.current
               let now = NSDate()
               var dateComponents = calendar.dateComponents([.day,.month,.year,.hour,.minute,.second], from: now as Date)
               //let dateComponents = calendar.dateComponents([NSCalendar.Unit.Day, NSCalendar.Unit.Month, NSCalendar.Unit.Year, NSCalendar.Unit.Hour, NSCalendar.Unit.Minute, NSCalendar.Unit.Second], from: now as Date)

               dateComponents.second! += 1 //add 2 minutes to current time for debug

               let date = calendar.date(from: dateComponents)
         var uuidString = UUID().uuidString
        
        if sender.currentTitle=="Pause Exam"{
            sender.setTitle("Resume Exam", for: .normal)
           pauseflag=1
            let content = UNMutableNotificationContent()
                   content.title = "Your last exam has been paused"
                   
                   content.body = "Clich here to resume"
                   let trigger = UNCalendarNotificationTrigger(
                   dateMatching: dateComponents, repeats: true)
                  
                   let request = UNNotificationRequest(identifier: uuidString,
                               content: content, trigger: trigger)

                   // Schedule the request with the system.
                   let notificationCenter = UNUserNotificationCenter.current()
                   notificationCenter.add(request) { (error) in
                      if error != nil {
                         // Handle any errors.
                      }
                   }
          
            
        }else{
            sender.setTitle("Pause Exam", for: .normal)
           pauseflag=0
//            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [uuidString])
            UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        }
        delegate.selectedanswer(pause_flag: pauseflag,attended_count:attendedcount,skipped_count:skipcount,submitflag: 0, dictanswers: [:])
       
    }
    
    @objc func btngotitclicked(sender:UIButton){
        questioncell.lblqstnnumber.isHidden=false
        questioncell.btngotitclicked.isHidden=true
        questioncell.btngotit.isHidden=true
        questioncell.lblgotit.isHidden=true
        questioncell.viewgotit.isHidden=true
        questioncell.lblqstnnumber.text="Q."+String(sender.tag+1)
        newcollectionviewdailyexam.reloadData()
        
    }
    
    
   
       
    func currentaffairqstndata(data: Currentaffairsqustnclass) {
        print("data",data)
        
        
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                
                self.caqstndata=data.data
                
               // self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
                
                
               
                self.newcollectionviewdailyexam.reloadSections(IndexSet(integer: 0))
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
        
        
    func dailyexamquestn(data: Dailyexam) {
        print("data",data)
        
        
        let status=data.status
        if status==true{
            self.dailyexamqustn=data.data
            DispatchQueue.main.async{
                
               
               
                print("self.dailyexamqustn",self.dailyexamqustn)
               // self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
               
                self.newcollectionviewdailyexam.reloadSections(IndexSet(integer: 0))
//                self.collectionviewdailyexam.reloadData()
               
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    func getchapterwiseexamdata(data: Chapterwiseexamclass) {
        print("data",data)
        
        
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                
                self.chapterwiseexamdata=data.data
                
                
               // self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
                
                
               
                self.newcollectionviewdailyexam.reloadSections(IndexSet(integer: 0))
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    func mocktestseriesqustn(data: Testseriesquestion){
        
        let status=data.status
        if status==true{
            DispatchQueue.main.async{
                self.mocktestseriesdata=data.data?.mock_test_series
                self.questionsformocktest=self.mocktestseriesdata?[0].questions
                
                
                
               // self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
               
                
                self.newcollectionviewdailyexam.reloadSections(IndexSet(integer: 0))
            }
        }else{
            
            DispatchQueue.main.async{
                
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
    
   func getweekwiseexamquestionsdata(data: Weekwiseexamqustnclass){
        let status=data.status
    DispatchQueue.main.async{
   // self.activityindicator.startAnimating()
    }
        if status==true{
            DispatchQueue.main.async{
               
                self.weekqustndata=data.data?.week_exam
                self.questionsforweekexam=data.data?.questions
                
                
               // self.showToast(message: data.message!, font: .boldSystemFont(ofSize: 13), duration: 2)
                
                self.totalTime=(self.questionsforweekexam?.count ?? 0)*60
               
               
                self.newcollectionviewdailyexam.reloadSections(IndexSet(integer: 0))
               
//                self.newcollectionviewdailyexam.reloadData()
               // self.activityindicator.stopAnimating()
                
            }
        }else{
            
            DispatchQueue.main.async{
                self.showToast1(message: data.message!, font:  .boldSystemFont(ofSize: 13), duration: 2)
            }
        }
    }
    
    
    
    
    @objc func btnopt1(sender:UIButton){
        print()
        skipflag=0
        if mocktestflag==1{
            selectedanswer=questionsformocktest?[sender.tag].psc_option1 ?? ""
            questionid=questionsformocktest?[sender.tag].psc_question_id ?? ""
            questionsformocktest?[sender.tag].isselected=1
            mocktestseriesid=questionsformocktest?[sender.tag].psc_mock_test_series_id ?? ""
            selectedoption="psc_option1"
        }else if exclusivecoachingflag==1{
            selectedanswer=chapterwiseexamdata?[sender.tag].chapter_exam_option1 ?? ""
            questionid=chapterwiseexamdata?[sender.tag].chapter_question_id ?? ""
            chapterwiseexamdata?[sender.tag].isselected=1
            
            
        }else if currentaffairflag==1{
            selectedanswer=caqstndata?[sender.tag].ca_option1 ?? ""
            questionid=caqstndata?[sender.tag].ca_question_id ?? ""
            caqstndata?[sender.tag].isselected=1
        }else if weekwiseflag==1{
            selectedanswer=questionsforweekexam?[sender.tag].option1 ?? ""
            selectedoption="option1"
            questionid=questionsforweekexam?[sender.tag].exam_question_id ?? ""
            questionsforweekexam?[sender.tag].isselected=1
        }else{
            selectedanswer=dailyexamqustn?[sender.tag].psc_option1 ?? ""
            questionid=dailyexamqustn?[sender.tag].psc_question_id ?? ""
            dailyexamqustn?[sender.tag].isselected=1
        }
        questionidarray.append(questionid)
        btnoptionaction()
        

    }
    
    @objc func btnopt2(sender:UIButton){
         print("sender.tag",sender.tag)
        
        skipflag=0
        if mocktestflag==1{
            selectedanswer=questionsformocktest?[sender.tag].psc_option2 ?? ""
            questionid=questionsformocktest?[sender.tag].psc_question_id ?? ""
            questionsformocktest?[sender.tag].isselected=2
            mocktestseriesid=questionsformocktest?[sender.tag].psc_mock_test_series_id ?? ""
            selectedoption="psc_option2"
        } else if exclusivecoachingflag==1{
            selectedanswer=chapterwiseexamdata?[sender.tag].chapter_exam_option2 ?? ""
            questionid=chapterwiseexamdata?[sender.tag].chapter_question_id ?? ""
            chapterwiseexamdata?[sender.tag].isselected=2
            
        }else if currentaffairflag==1{
            selectedanswer=caqstndata?[sender.tag].ca_option2 ?? ""
            questionid=caqstndata?[sender.tag].ca_question_id ?? ""
            caqstndata?[sender.tag].isselected=2
        } else if weekwiseflag==1{
            selectedanswer=questionsforweekexam?[sender.tag].option2 ?? ""
                       questionid=questionsforweekexam?[sender.tag].exam_question_id ?? ""
                       questionsforweekexam?[sender.tag].isselected=2
            selectedoption="option2"
        }else{
            selectedanswer=dailyexamqustn?[sender.tag].psc_option2 ?? ""
            questionid=dailyexamqustn?[sender.tag].psc_question_id ?? ""
            dailyexamqustn?[sender.tag].isselected=2
        }
        questionidarray.append(questionid)
        
        btnoptionaction()
        
    }
    @objc func btnopt3(sender:UIButton){
         print("sender.tag",sender.tag)
        skipflag=0
        if mocktestflag==1{
            selectedanswer=questionsformocktest?[sender.tag].psc_option3 ?? ""
            questionid=questionsformocktest?[sender.tag].psc_question_id ?? ""
            questionsformocktest?[sender.tag].isselected=3
            mocktestseriesid=questionsformocktest?[sender.tag].psc_mock_test_series_id ?? ""
            selectedoption="psc_option3"
        } else if exclusivecoachingflag==1{
            selectedanswer=chapterwiseexamdata?[sender.tag].chapter_exam_option3 ?? ""
            questionid=chapterwiseexamdata?[sender.tag].chapter_question_id ?? ""
            chapterwiseexamdata?[sender.tag].isselected=3
        }else if currentaffairflag==1{
            
          selectedanswer=caqstndata?[sender.tag].ca_option3 ?? ""
            questionid=caqstndata?[sender.tag].ca_question_id ?? ""
            caqstndata?[sender.tag].isselected=3
        }else if weekwiseflag==1{
        selectedanswer=questionsforweekexam?[sender.tag].option3 ?? ""
                   questionid=questionsforweekexam?[sender.tag].exam_question_id ?? ""
                   questionsforweekexam?[sender.tag].isselected=3
            selectedoption="option3"
        }else{
            selectedanswer=dailyexamqustn?[sender.tag].psc_option3 ?? ""
            questionid=dailyexamqustn?[sender.tag].psc_question_id ?? ""
            dailyexamqustn?[sender.tag].isselected=3
        }
        questionidarray.append(questionid)
        btnoptionaction()
       // self.collectionviewdailyexam.reloadData()
        
    }
    @objc func btnopt4(sender:UIButton){
         print("sender.tag",sender.tag)
        skipflag=0
        if mocktestflag==1{
            selectedanswer=questionsformocktest?[sender.tag].psc_option4 ?? ""
            questionid=questionsformocktest?[sender.tag].psc_question_id ?? ""
            questionsformocktest?[sender.tag].isselected=4
            mocktestseriesid=questionsformocktest?[sender.tag].psc_mock_test_series_id ?? ""
            selectedoption="psc_option4"
        } else if exclusivecoachingflag==1{
            selectedanswer=chapterwiseexamdata?[sender.tag].chapter_exam_option4 ?? ""
            questionid=chapterwiseexamdata?[sender.tag].chapter_question_id ?? ""
            chapterwiseexamdata?[sender.tag].isselected=4
        }else if currentaffairflag==1{
            selectedanswer=caqstndata?[sender.tag].ca_option4 ?? ""
            questionid=caqstndata?[sender.tag].ca_question_id ?? ""
            caqstndata?[sender.tag].isselected=4
        }else if weekwiseflag==1{
        selectedanswer=questionsforweekexam?[sender.tag].option4 ?? ""
                   questionid=questionsforweekexam?[sender.tag].exam_question_id ?? ""
                   questionsforweekexam?[sender.tag].isselected=4
            selectedoption="option4"
        }else{
            selectedanswer=dailyexamqustn?[sender.tag].psc_option4 ?? ""
            questionid=dailyexamqustn?[sender.tag].psc_question_id ?? ""
            dailyexamqustn?[sender.tag].isselected=4
        }
        questionidarray.append(questionid)
        btnoptionaction()
      //  self.collectionviewdailyexam.reloadData()
        
    }
    
    
    
    @objc func skipaction(sender:UIButton){
           Btn_RightAction()
        questionidarray.append("0")
        if mocktestflag==1{
            questionid=questionsformocktest?[sender.tag].psc_question_id ?? ""
        }else if exclusivecoachingflag==1{
            questionid=chapterwiseexamdata?[sender.tag].chapter_question_id ?? ""
        }else if currentaffairflag==1{
          questionid=caqstndata?[sender.tag].ca_question_id ?? ""
        }else if weekwiseflag==1{
       
        questionid=questionsforweekexam?[sender.tag].exam_question_id ?? ""
                   
        }else{
            questionid=dailyexamqustn?[sender.tag].psc_question_id ?? ""
        }
        skipflag=1
        
        for value in dailyexamqstnarray{
            let indexpartinsertarray=dailyexamqstnarray.index(of:value)
            var items:[String:String]=value as! [String:String]
            
            if items["question_id"]==questionid{
                questionidarray.remove(at: indexpartinsertarray!)
                if items["skip"]=="0"{
                    attendedcount-=1
                    
                }else{
                    skipcount-=1
                }
                
                dailyexamqstnarray.remove(at: indexpartinsertarray!)
                
                
            }
        }
        
        selectedanswer=""
        selectedoption=""
        skipcount+=1
//        self.btnskipped.setTitle(String(skipcount), for: .normal)
//        self.btnattended.setTitle(String(attendedcount), for: .normal)
       
        dailyexamqustn?[sender.tag].isselected=0
       
        itemdailyexam.updateValue(userid, forKey: "user_id")
        itemdailyexam.updateValue(questionid, forKey: "question_id")
        itemdailyexam.updateValue(selectedanswer, forKey: "selected_answer")
        itemdailyexam.updateValue("1", forKey: "skip")
        dailyexamqstnarray.append(itemdailyexam)
       
        
        
        delegate.selectedanswer(pause_flag: pauseflag,attended_count:attendedcount,skipped_count:skipcount,submitflag: 0, dictanswers: [:])
        
       // delegate1.totaltableheight(height:tableviewheight)
        
       // newcollectionviewdailyexam.reloadData()
      
    }
    
    
   
    
    func btnoptionaction(){
        Btn_RightAction()
        if mocktestflag==1{
            
            for value in mocktestqstnarray{
                let indexpartinsertarray=mocktestqstnarray.index(of:value)
                var items:[String:String]=value as! [String:String]
                
                if items["question_id"]==questionid{
                    
                    
                    mocktestqstnarray.remove(at: indexpartinsertarray!)
                }
            }
            
            
            
        }
        if currentaffairflag==1{
       for value in currentaffairqustnarray{
                let indexpartinsertarray=currentaffairqustnarray.index(of:value)
                var items:[String:String]=value as! [String:String]
                
                if items["question_id"]==questionid{
                    
                    
                    currentaffairqustnarray.remove(at: indexpartinsertarray!)
                }
            }
            
            
            
        }
        
        
        
        for value in dailyexamqstnarray{
            let indexpartinsertarray=dailyexamqstnarray.index(of:value)
            var items:[String:String]=value as! [String:String]
            
            if items["question_id"]==questionid{
                if items["skip"]=="1"{
                    skipcount-=1
                    
                }else{
                    attendedcount-=1
                }
                
                dailyexamqstnarray.remove(at: indexpartinsertarray!)
            }
        }
        
        if  weekwiseflag==1{
            for value in weekexamqustnarray{
            let indexpartinsertarray=weekexamqustnarray.index(of:value)
                           var items:[String:String]=value as! [String:String]
                           
                           if items["question_id"]==questionid{
                               
                               
                               weekexamqustnarray.remove(at: indexpartinsertarray!)
                           }
                       }
        }
        
        
        
        print("dailyexamqstnarray",dailyexamqstnarray)
        
        attendedcount+=1
        
//        self.btnattended.setTitle(String(attendedcount), for: .normal)
//        self.btnskipped.setTitle(String(skipcount), for: .normal)
        
        
        delegate.selectedanswer(pause_flag: pauseflag,attended_count:attendedcount,skipped_count:skipcount,submitflag: 0, dictanswers: [:])
        
        
        
        if mocktestflag==1{
             itemmocktest.updateValue(userid, forKey: "user_id")
            itemmocktest.updateValue(questionid, forKey: "question_id")
            itemmocktest.updateValue(selectedanswer, forKey: "selected_answer")
            itemmocktest.updateValue(mocktestseriesid, forKey: "mock_test_series_id")
            itemmocktest.updateValue(selectedoption, forKey: "selected_option")
        }
        itemdailyexam.updateValue(userid, forKey: "user_id")
        itemdailyexam.updateValue(questionid, forKey: "question_id")
        itemdailyexam.updateValue(selectedanswer, forKey: "selected_answer")
        itemdailyexam.updateValue("0", forKey: "skip")
        
        if currentaffairflag==1{
            itemcurrentaffair.updateValue(userid, forKey: "user_id")
                       itemcurrentaffair.updateValue(questionid, forKey: "question_id")
                       itemcurrentaffair.updateValue(selectedanswer, forKey: "selected_answer")
                       
        }
       
        if weekwiseflag==1{
             itemweekwiseexam.updateValue(userid, forKey: "user_id")
                        itemweekwiseexam.updateValue(questionid, forKey: "question_id")
                        itemweekwiseexam.updateValue(selectedanswer, forKey: "selected_answer")
            itemweekwiseexam.updateValue(selectedoption, forKey: "selected_option")
                       
        }
        
        currentaffairqustnarray.append(itemcurrentaffair)
        mocktestqstnarray.append(itemmocktest)
        dailyexamqstnarray.append(itemdailyexam)
        weekexamqustnarray.append(itemweekwiseexam)
        
        print("mocktestqstnarray",mocktestqstnarray)
        print("dailyexamqstnarray",dailyexamqstnarray)
       
    }
    
    
    func Btn_RightAction()
    {
        print("dailyexamqustn",dailyexamqustn)
        
        visibleItems = self.newcollectionviewdailyexam.indexPathsForVisibleItems as NSArray
        print("visibleItems",visibleItems)
        currentItem = visibleItems.object(at: 0) as! IndexPath
      nextItem = IndexPath(item: currentItem.row + 1, section: 0)
       
         print("currentItem",currentItem)
         print("nextItem",nextItem)
            if self.mocktestflag==1{
                if nextItem.row < self.questionsformocktest?.count ?? 0{
                self.newcollectionviewdailyexam.scrollToItem(at: nextItem, at: .left, animated: true)
                
            }else if nextItem.row == self.questionsformocktest?.count ?? 0{
                
                    self.showToast(message: "End of Exam", font: UIFont.boldSystemFont(ofSize: 14),duration: 2)
            }
            
            
            
            }else if self.exclusivecoachingflag==1{
                if nextItem.row < self.chapterwiseexamdata?.count ?? 0{
                self.newcollectionviewdailyexam.scrollToItem(at: nextItem, at: .left, animated: true)
                
            }else if nextItem.row == self.chapterwiseexamdata?.count ?? 0{
                self.showToast(message: "End of Exam", font: UIFont.boldSystemFont(ofSize: 14),duration: 2)
            }
        }  else if self.currentaffairflag==1{
            if nextItem.row < self.caqstndata?.count ?? 0{
                self.newcollectionviewdailyexam.scrollToItem(at: nextItem, at: .left, animated: true)
                
            }else if nextItem.row == self.caqstndata?.count ?? 0{
                self.showToast(message: "End of Exam", font: UIFont.boldSystemFont(ofSize: 14),duration: 2)
            }
                
            }  else if self.weekwiseflag==1{
                if nextItem.row < self.questionsforweekexam?.count ?? 0{
                    self.newcollectionviewdailyexam.scrollToItem(at: nextItem, at: .left, animated: true)
                    
                }else if nextItem.row == self.questionsforweekexam?.count ?? 0{
                    self.showToast(message: "End of Exam", font: UIFont.boldSystemFont(ofSize: 14),duration: 2)
                }
        }else{
            
                
                if nextItem.row < self.dailyexamqustn?.count ?? 0{
                    self.newcollectionviewdailyexam.scrollToItem(at: nextItem, at: .left, animated: true)
                   // actionflag=1
                  


            }else if nextItem.row == self.dailyexamqustn?.count ?? 0{
                self.showToast(message: "End of Exam", font: UIFont.boldSystemFont(ofSize: 14),duration: 2)
            }
             
        }
        
       
        
        
       // tableviewheight=Float(newcollectionviewdailyexam.frame.height)
        delegate1.totaltableheight(height:tableviewheight)
        
        self.newcollectionviewdailyexam.reloadData()
//
//
    }
    
    
    
    func Btn_LeftAction()
    {
        let visibleItems: NSArray = self.newcollectionviewdailyexam.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
        if mocktestflag==1{
            if nextItem.row < questionsformocktest?.count ?? 0 && nextItem.row >= 0{
                self.newcollectionviewdailyexam.scrollToItem(at: nextItem, at: .right, animated: true)
                
            }
        }else if exclusivecoachingflag==1{
            if nextItem.row < chapterwiseexamdata?.count ?? 0 && nextItem.row >= 0{
                self.newcollectionviewdailyexam.scrollToItem(at: nextItem, at: .right, animated: true)
                
            }
        }   else if currentaffairflag==1{
            if nextItem.row < caqstndata?.count ?? 0 && nextItem.row >= 0{
                self.newcollectionviewdailyexam.scrollToItem(at: nextItem, at: .right, animated: true)
                
            }
        } else if weekwiseflag==1{
            if nextItem.row < questionsforweekexam?.count ?? 0 && nextItem.row >= 0{
                self.newcollectionviewdailyexam.scrollToItem(at: nextItem, at: .right, animated: true)
                
            }
        }else{
            if nextItem.row < dailyexamqustn?.count ?? 0 && nextItem.row >= 0{
                self.newcollectionviewdailyexam.scrollToItem(at: nextItem, at: .right, animated: true)
                
            }
        }
        
        delegate1.totaltableheight(height:tableviewheight)
       // self.newcollectionviewdailyexam.reloadSections(IndexSet(integer: 0))
    }
    
    
    
    @objc func btnnextaction(sender:UIButton){
        var questionidcontains=String()
        if mocktestflag==1{
            questionidcontains=questionsformocktest?[sender.tag].psc_question_id ?? ""
        }else if exclusivecoachingflag==1{
            questionidcontains=chapterwiseexamdata?[sender.tag].chapter_question_id ?? ""
        } else if currentaffairflag==1{
            questionidcontains=caqstndata?[sender.tag].ca_question_id ?? ""
        }else if weekwiseflag==1{
            questionidcontains=questionsforweekexam?[sender.tag].exam_question_id ?? ""
        } else {
            questionidcontains=dailyexamqustn?[sender.tag].psc_question_id ?? ""
        }
        if questionidarray.contains(questionidcontains){
            Btn_RightAction()
            
        }else{
            showToast(message: "Please select an answer to continue", font: UIFont.boldSystemFont(ofSize: 14),duration: 1)
        }
      
    }
    
    @objc func btnpreviousaction(sender:UIButton){
       
        delegate1.totaltableheight(height:tableviewheight)
        Btn_LeftAction()
    }
   
        @objc func btnsubmittaction(sender:UIButton){
            
            
            if mocktestflag==1{
                
                dict_answers.updateValue((mocktestseriesdata?[0].psc_mock_category_id ?? ""), forKey: "mock_category")
                dict_answers.updateValue(mocktestqstnarray, forKey: "mock_test_question")
            }else if exclusivecoachingflag==1{
                dict_answers.updateValue(chapterwiseexamdata?[0].chapter_id ?? "", forKey: "chapter_id")
                dict_answers.updateValue(dailyexamqstnarray, forKey: "chapter_wise_exam")
            }else if currentaffairflag==1{
                dict_answers.updateValue(caqstndata?[0].ca_id ?? "", forKey: "ca_id")
                dict_answers.updateValue(dailyexamqstnarray, forKey: "ca_question")
            }else if weekwiseflag==1{
                dict_answers.updateValue(questionsforweekexam?[0].week_exam_id ?? "", forKey: "week_exam_id")
                           dict_answers.updateValue(weekexamqustnarray, forKey: "exam_question")
            }
            else{
                dict_answers.updateValue(date_choosen, forKey: "exam_date")
                dict_answers.updateValue(dailyexamqstnarray, forKey: "daily_exam_question")
            }
            
//            dict_answers.updateValue(usertime, forKey: "user_time")
//            dict_main.updateValue(dict_answers, forKey: "data")
            print("dict_main",dict_main)
            delegate.selectedanswer(pause_flag: pauseflag, attended_count: attendedcount, skipped_count: skipcount, submitflag: 1,dictanswers:dict_answers)
            
        }
        
        
   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
