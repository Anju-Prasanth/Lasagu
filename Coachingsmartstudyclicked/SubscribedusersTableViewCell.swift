//
//  SubscribedusersTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 11/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class SubscribedusersTableViewCell: UITableViewCell {

    @IBOutlet weak var lblsyllabus: UILabel!
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
