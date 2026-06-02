//
//  SyllabusTableViewCell.swift
//  Lasagu
//
//  Created by Arun Vijayan on 08/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class SyllabusTableViewCell: UITableViewCell {

    @IBOutlet weak var btnback: UIButton!
    var theme=Int()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if let mode=UserDefaults.standard.value(forKey: "mode"){
            theme=UserDefaults.standard.value(forKey: "mode") as! Int
            
        }
        
        if theme==0{
            overrideUserInterfaceStyle = .light
           
            btnback.setBackgroundImage(UIImage(named: "arrow-left-solid"), for: .normal)
            
        }else{
        overrideUserInterfaceStyle = .dark
       
            btnback.setBackgroundImage(UIImage(named: "backarrow-white"), for: .normal)

        
        }
    }

}
