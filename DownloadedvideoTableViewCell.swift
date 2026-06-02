//
//  DownloadedvideoTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 03/09/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class DownloadedvideoTableViewCell: UITableViewCell {
 @IBOutlet weak var numberdownloaded: UILabel!
 @IBOutlet weak var btnopenvideo: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnopenvideo.layer.cornerRadius=10
        btnopenvideo.layer.borderColor=UIColor.lightGray.cgColor
        btnopenvideo.layer.borderWidth=0.5
       // btnopenvideo.layer.borderWidth=0.5
    
    }
   
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
