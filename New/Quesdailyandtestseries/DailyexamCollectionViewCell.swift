//
//  DailyexamCollectionViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 30/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class DailyexamCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var btnopt4: UIButton!
    @IBOutlet weak var btnopt3: UIButton!
    @IBOutlet weak var btnopt2: UIButton!
    @IBOutlet weak var btnopt1: UIButton!
    @IBOutlet weak var btnpauseexam: UIButton!
    @IBOutlet weak var btnprevious: UIButton!
    @IBOutlet weak var btnnext: UIButton!
    @IBOutlet weak var btnsubmitt: UIButton!
    @IBOutlet weak var btnskipqustn: UIButton!
    @IBOutlet weak var btngotitclicked: UIButton!
    @IBOutlet weak var lblopt4: UILabel!
    @IBOutlet weak var lblopt3: UILabel!
    @IBOutlet weak var lblopt2: UILabel!
    @IBOutlet weak var lblopt1: UILabel!
    @IBOutlet weak var lblqustion: UILabel!
    @IBOutlet weak var lblqstnnumber: UILabel!
    
    @IBOutlet weak var lblgotit: UILabel!
    @IBOutlet weak var btngotit: UIButton!
    @IBOutlet weak var viewgotit: UIView!
    
    @IBOutlet weak var btnopt1height: NSLayoutConstraint!
    
    @IBOutlet weak var viewouter: UIView!
    override func awakeFromNib() {
       super.awakeFromNib()
        
        
        
//        viewouter.translatesAutoresizingMaskIntoConstraints = false
//        viewouter.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 50).isActive = true
                   
                
        
        
        
        btnskipqustn.setShadowEffect()
        btnsubmitt.layer.cornerRadius=20
        
       
        
        
        lblopt1.layer.cornerRadius=20
        lblopt1.layer.borderColor = UIColor.black.cgColor
        lblopt1.layer.borderWidth=0.5
        lblopt2.layer.cornerRadius=20
              lblopt2.layer.borderColor = UIColor.black.cgColor
              lblopt2.layer.borderWidth=0.5
        lblopt3.layer.cornerRadius=20
              lblopt3.layer.borderColor = UIColor.black.cgColor
              lblopt3.layer.borderWidth=0.5
        lblopt4.layer.cornerRadius=20
              lblopt4.layer.borderColor = UIColor.black.cgColor
              lblopt4.layer.borderWidth=0.5
        
        
//        btnopt1.layer.cornerRadius=20
//        btnopt1.layer.borderColor = UIColor.black.cgColor
//        btnopt1.layer.borderWidth=0.5
//        btnopt2.layer.cornerRadius=20
//              btnopt2.layer.borderColor = UIColor.black.cgColor
//              btnopt2.layer.borderWidth=0.5
//        btnopt3.layer.cornerRadius=20
//              btnopt3.layer.borderColor = UIColor.black.cgColor
//              btnopt3.layer.borderWidth=0.5
//        btnopt4.layer.cornerRadius=20
//              btnopt4.layer.borderColor = UIColor.black.cgColor
//              btnopt4.layer.borderWidth=0.5
        
        
        
        
        viewgotit.layer.cornerRadius=20
        viewgotit.layer.borderColor = UIColor.black.cgColor
        viewgotit.layer.borderWidth=0.5
        btngotit.layer.cornerRadius=15
               btngotit.layer.borderColor = UIColor.black.cgColor
               btngotit.layer.borderWidth=0.5
        
        btnpauseexam.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
         btnpauseexam.layer.shadowRadius = 4
         btnpauseexam.layer.shadowOpacity = 0.3
        // btnskipqustn.layer.shadowColor = UIColor.black.cgColor
         btnpauseexam.layer.cornerRadius = 15
        
        btnskipqustn.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        btnskipqustn.layer.shadowRadius = 4
        btnskipqustn.layer.shadowOpacity = 0.3
       // btnskipqustn.layer.shadowColor = UIColor.black.cgColor
        btnskipqustn.layer.cornerRadius = 15
        lblqstnnumber.layer.cornerRadius=20
        lblqstnnumber.layer.masksToBounds = true
        
    }
    
    
}
