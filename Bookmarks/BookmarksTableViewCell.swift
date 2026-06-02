//
//  BookmarksTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 18/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class BookmarksTableViewCell: UITableViewCell {

    @IBOutlet weak var Outerview: UIView!
    @IBOutlet weak var lbldescrptn: UILabel!
    @IBOutlet weak var lblsubcatname: UILabel!
    @IBOutlet weak var btndelete: UIButton!
    @IBOutlet weak var lblimagetitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        Outerview.setShadowEffect()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
