//
//  PreparesubctgryViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 29/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit

class PreparesubctgryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableviewpreparesubctgry: UITableView!
    var cell=HomeTableViewCell()
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 1
    }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            
                cell = (tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell)!
                
                
                
                return cell
                
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 70
                
            }
            


}
