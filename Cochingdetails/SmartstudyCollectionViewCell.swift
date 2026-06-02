//
//  SmartstudyCollectionViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 24/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class SmartstudyCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageviewpremiumctgry: UIImageView!
    
    @IBOutlet weak var lblpremiumctgryname: UILabel!
    @IBOutlet weak var Outerview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        //Outerview.clipsToBounds=true
//        Outerview.layer.masksToBounds = false
        Outerview.layer.cornerRadius=Outerview.frame.size.width / 5
        Outerview.setShadowEffect()
      
       
        Outerview.layer.masksToBounds = false
       
    }

}
