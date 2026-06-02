//
//  NointernetViewController.swift
//  Lasagu
//
//  Created by Arun Vijayan on 19/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class NointernetViewController: UIViewController {

    @IBOutlet weak var btnopenbookmarks: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        btnopenbookmarks.layer.cornerRadius=10
    }
    
    @IBAction func btnopenbookmarkaction(_ sender: Any) {
        let bookmark = self.storyboard?.instantiateViewController (withIdentifier: "BookmarksViewController") as! BookmarksViewController
        
        self.navigationController?.pushViewController(bookmark, animated: true)
        
    }
    
    @IBAction func btncloseaction(_ sender: Any) {
        let home = self.storyboard?.instantiateViewController (withIdentifier: "HomepageViewController") as! HomepageViewController
        
        self.navigationController?.pushViewController(home, animated: true)
        
        
    }
    
    @IBAction func btndownloadaction(_ sender: Any) {
        
        
        let download = UIStoryboard(name: "Sub", bundle: nil).instantiateViewController (withIdentifier: "DownloadingListViewController") as! DownloadingListViewController
        self.navigationController?.pushViewController(download, animated: true)
        
    }
}
