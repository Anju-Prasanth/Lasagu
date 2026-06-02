//
//  HeadersolutionTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 01/02/21.
//  Copyright © 2021 Arun Vijayan. All rights reserved.
//

import UIKit

class HeadersolutionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewfoesolution: UIView!
    @IBOutlet weak var outerviewheaderheight: NSLayoutConstraint!
    @IBOutlet weak var viewwritesolutionheight: NSLayoutConstraint!
    @IBOutlet weak var imageviewheight: NSLayoutConstraint!
    @IBOutlet weak var imageviewqustn: UIImageView!
    @IBOutlet weak var lblnoofsolutions: UILabel!
    
    @IBOutlet weak var lblcomment: UILabel!
    @IBOutlet weak var lbltime: UILabel!
    @IBOutlet weak var btnqustnletter: UIButton!
    @IBOutlet weak var Outerview: UIView!
    @IBOutlet weak var lblname: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
       btnqustnletter.layer.cornerRadius=btnqustnletter.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
