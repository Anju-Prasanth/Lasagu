//
//  NoInternetView.swift
//  Lasagu
//
//  Created by Arun Vijayan on 30/06/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation
import UIKit

protocol NoInternetViewDelegate {
    func retry()
}

class NoInternetView: UIView {
    
    @IBOutlet weak var retryButton: UIButton!
    
    var viewDelegate:NoInternetViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setFrame(height:CGFloat) {
        self.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - height - 50, width: UIScreen.main.bounds.size.width, height: height)
    }
    
    @IBAction func retryButtonAction(_ sender: Any) {
        viewDelegate?.retry()
    }
}
