//
//  DoubtsolutionTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 29/01/21.
//  Copyright © 2021 Arun Vijayan. All rights reserved.
//

import UIKit

class DoubtsolutionTableViewCell: UITableViewCell {

   
    @IBOutlet weak var imageviewheight: NSLayoutConstraint!
    @IBOutlet weak var viewwritesolutionanswer: UIView!
    @IBOutlet weak var imageviewanswer: UIImageView!
    @IBOutlet weak var lblanswr: UILabel!
    @IBOutlet weak var lblanswrname: UILabel!
    @IBOutlet weak var btnanswrletter: UIButton!
    @IBOutlet weak var viewsolutionheightanswer: NSLayoutConstraint!
    @IBOutlet weak var viewanswrs: UIView!
    @IBOutlet weak var Outerview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //Outerview.setShadowEffect()
        btnanswrletter.layer.cornerRadius=btnanswrletter.frame.height/2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
