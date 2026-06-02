//
//  SlidemenureportsTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 13/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class SlidemenureportsTableViewCell: UITableViewCell {
    @IBOutlet weak var lblusertime: UILabel!
    
    @IBOutlet weak var Outerview: UIView!
    @IBOutlet weak var lbltotalmark: UILabel!
    @IBOutlet weak var lbltestname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        lbltotalmark.layer.masksToBounds = true
        lbltotalmark.layer.cornerRadius=20
        Outerview.setShadowEffect()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
