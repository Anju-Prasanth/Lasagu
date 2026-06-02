//
//  SolutiondetailTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 01/02/21.
//  Copyright © 2021 Arun Vijayan. All rights reserved.
//

import UIKit

class SolutiondetailTableViewCell: UITableViewCell {
    
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
        btnanswrletter.layer.cornerRadius=btnanswrletter.layer.frame.height/2
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
