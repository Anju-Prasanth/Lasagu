//
//  ButtonTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 08/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var btnwanttojoin: UIButton!
    
    @IBOutlet weak var btnspecialoffer: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnwanttojoin.layer.cornerRadius=10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
