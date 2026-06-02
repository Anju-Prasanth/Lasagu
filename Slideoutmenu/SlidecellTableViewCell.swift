//
//  SlidecellTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 29/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class SlidecellTableViewCell: UITableViewCell {

    @IBOutlet weak var lblline: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var lbllist: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
