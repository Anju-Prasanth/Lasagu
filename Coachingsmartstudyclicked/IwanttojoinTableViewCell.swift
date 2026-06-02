//
//  IwanttojoinTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 10/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class IwanttojoinTableViewCell: UITableViewCell {
    @IBOutlet weak var lblpackage: UILabel!
    
    @IBOutlet weak var btnbuynow: UIButton!
    @IBOutlet weak var lblprice: UILabel!
    @IBOutlet weak var outerview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        outerview.setShadowEffect()
        btnbuynow.layer.cornerRadius=10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
