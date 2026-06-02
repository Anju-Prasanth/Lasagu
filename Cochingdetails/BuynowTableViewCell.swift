//
//  BuynowTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 24/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class BuynowTableViewCell: UITableViewCell {

    @IBOutlet weak var btnbuymow: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnbuymow.layer.cornerRadius=20
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
