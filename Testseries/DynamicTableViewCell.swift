//
//  DynamicTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 23/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class DynamicTableViewCell: UITableViewCell {

    @IBOutlet weak var btnview: UIButton!
    @IBOutlet weak var lblctgryname: UILabel!
    @IBOutlet weak var lbltestcount: UILabel!
    @IBOutlet weak var Outerview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        Outerview.setShadowEffect()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
