//
//  TrendingvideosCollectionViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 24/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class TrendingvideosCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lblvideotitle: UILabel!
    @IBOutlet weak var imageviewvideos: UIImageView!
    @IBOutlet weak var Outerview: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        Outerview.setShadowEffect()
    }

}
