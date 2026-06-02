//
//  SpecialofferTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 11/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit


class SpecialofferTableViewCell: UITableViewCell,UITextFieldDelegate{

    @IBOutlet weak var txtfldpromocode: UITextField!
    
    @IBOutlet weak var btnapply: UIButton!
    
    @IBOutlet weak var btnsubscrptnlistbuynow: UIButton!
  
    @IBOutlet weak var lblsubscrptnpackage: UILabel!
    @IBOutlet weak var lblactualamount: UILabel!
    @IBOutlet weak var Outerview: UIView!
     
    override func awakeFromNib() {
        super.awakeFromNib()
        btnapply.layer.cornerRadius=10
         btnsubscrptnlistbuynow.layer.cornerRadius=20
        Outerview.setShadowEffect()
        txtfldpromocode.delegate=self
        // promocodecontroller = MDCTextInputControllerOutlined(textInput: txtfldpromocode)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
